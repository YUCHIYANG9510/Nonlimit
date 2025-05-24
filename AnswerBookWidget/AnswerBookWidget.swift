//
//  AnswerBookWidget.swift
//  AnswerBookWidget
//
//  Created by Designer on 2025/5/23.
//

import WidgetKit
import SwiftUI

// MARK: - 資料模型
struct FortuneEntry: TimelineEntry {
    let date: Date
    let dayOfYear: Int
    let idiom: String
    let imageName: String
}

// MARK: - Timeline Provider
struct FortuneProvider: TimelineProvider {
    func placeholder(in context: Context) -> FortuneEntry {
        sampleEntry
    }

    func getSnapshot(in context: Context, completion: @escaping (FortuneEntry) -> Void) {
        completion(sampleEntry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<FortuneEntry>) -> Void) {
        let currentDate = Date()
        let calendar = Calendar.current
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: currentDate) ?? 1

        let entry = FortuneEntry(
            date: currentDate,
            dayOfYear: dayOfYear,
            idiom: "一灘爛泥",
            imageName: "widget"
        )

        let nextUpdate = calendar.startOfDay(for: currentDate.addingTimeInterval(86400))
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }

    private var sampleEntry: FortuneEntry {
        FortuneEntry(date: Date(), dayOfYear: 139, idiom: "一灘爛泥", imageName: "widget")
    }
}

// MARK: - 小工具畫面
struct FortuneWidgetEntryView: View {
    var entry: FortuneProvider.Entry
    @Environment(\.widgetFamily) var family
    
    
    var body: some View {
            switch family {
            case .systemSmall:
                smallView
            case .systemMedium:
                mediumView
            case .systemLarge:
                largeView
            default:
                smallView
            }
        }
    
    private var smallView: some View {
        ZStack {
            VStack(spacing: 10) {
                HStack {
                    Text(entry.idiom)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.purple)
                    Spacer()
                    Text("#\(entry.dayOfYear)")
                        .font(.caption2)
                        .foregroundColor(.purple)
                }

                Image(entry.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)

                HStack {
                    Text(entry.date.weekdayString)
                        .font(.caption2)
                        .foregroundColor(.purple)
                    Spacer()
                    Text(entry.date.formattedMMdd())
                        .font(.caption2)
                        .foregroundColor(.purple.opacity(0.8))
                }
            }
            .padding(4)
        }
        .containerBackground(Color(.systemPink).opacity(0.1), for: .widget)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .widgetURL(URL(string: "yourapp://open-today"))
       }
    
    private var mediumView: some View {
            HStack {
                Image(entry.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)

                VStack(alignment: .leading, spacing: 12) {
                    Text(entry.idiom)
                        .font(.title3)
                        .foregroundColor(.purple)
                    HStack{
                        Text(entry.date.weekdayString)
                            .font(.caption)
                            .foregroundColor(.purple)
                        Text(entry.date.formattedMMdd())
                            .font(.caption)
                            .foregroundColor(.purple.opacity(0.8))
                    }
                }

                Spacer()
            }
            .padding(8)
            .containerBackground(Color(.systemPink).opacity(0.1), for: .widget)
        }
    
    private var largeView: some View {
            VStack(spacing: 12) {
                HStack {
                    Text("\(entry.idiom)")
                        .font(.headline)
                        .foregroundColor(.purple)
                    Spacer()
                    Text("#\(entry.dayOfYear)")
                        .font(.subheadline)
                        .foregroundColor(.purple)
                }
                
                Spacer()

                Image(entry.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)

                Spacer()

                HStack {
                    Text(entry.date.weekdayString.capitalized)
                    Spacer()
                    Text(entry.date.formattedMMdd())
                }
                .font(.headline)
                .foregroundColor(.purple.opacity(0.8))
            }
            .padding()
            .containerBackground(Color(.systemPink).opacity(0.1), for: .widget)
        }
    }



// MARK: - Widget 主結構
@main
struct FortuneWidget: Widget {
    let kind: String = "FortuneWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: FortuneProvider()) { entry in
            FortuneWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("每日小解答")
        .description("每天一句話，配上圖，看穿今天的命運。")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


// MARK: - 日期格式擴充
extension Date {
    /// 小寫星期幾，如 "monday"
    var weekdayString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // Full weekday name
        return formatter.string(from: self).lowercased()
    }

    /// 格式化 MM.dd，如 "05.21"
    func formattedMMdd() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd"
        return formatter.string(from: self)
    }
}


struct FortuneWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FortuneWidgetEntryView(entry: sampleEntry)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .previewDisplayName("Small")

            FortuneWidgetEntryView(entry: sampleEntry)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDisplayName("Medium")

            FortuneWidgetEntryView(entry: sampleEntry)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
                .previewDisplayName("Large")
        }
    }

    static var sampleEntry: FortuneEntry {
        FortuneEntry(
            date: Date(),
            dayOfYear: 139,
            idiom: "一灘爛泥",
            imageName: "widget"
        )
    }
}
