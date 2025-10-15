//
//  AnswerBookWidget.swift
//  AnswerBookWidget
//
//  Created by Designer on 2025/5/23.
//

import WidgetKit
import SwiftUI

extension Color {
    /// Widget 專用背景色（淺色為粉紫、深色為霧灰）
    static var widgetBackground: Color {
        Color(UIColor { trait in
            if trait.userInterfaceStyle == .dark {
                // 深色模式：霧面灰、接近系統原生小工具風格
                return UIColor.secondarySystemGroupedBackground
            } else {
                // 淺色模式：你指定的粉紫底
                return UIColor(red: 0xED/255, green: 0xDC/255, blue: 0xF4/255, alpha: 1)
            }
        })
    }
}

extension LinearGradient {
    /// Widget 專用動態背景（淺色：粉紫漸層，深色：霧灰）
    static var widgetBackground: LinearGradient {
        LinearGradient(
            colors: [
                Color(UIColor { trait in
                    if trait.userInterfaceStyle == .dark {
                        return UIColor.secondarySystemGroupedBackground // 深色
                    } else {
                        return UIColor(red: 0xED/255, green: 0xDC/255, blue: 0xF4/255, alpha: 1) // #EDDCF4
                    }
                }),
                Color(UIColor { trait in
                    if trait.userInterfaceStyle == .dark {
                        return UIColor.secondarySystemGroupedBackground // 深色
                    } else {
                        return UIColor(red: 0xFF/255, green: 0xE5/255, blue: 0xFF/255, alpha: 1) // #FFE5FF
                    }
                })
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}


// MARK: - 資料模型
struct FortuneEntry: TimelineEntry {
    let date: Date
    let dayOfYear: Int
    let idiom: String
    let imageName: String
    let idiomDescription: String
    let lunarTerm: String
    let suitableActivities: String
    let unsuitableActivities: String
}

// MARK: - Timeline Provider
struct FortuneProvider: TimelineProvider {
    func placeholder(in context: Context) -> FortuneEntry {
        sampleEntry
    }

    func getSnapshot(in context: Context, completion: @escaping (FortuneEntry) -> Void) {
        completion(getCurrentEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<FortuneEntry>) -> Void) {
        let currentEntry = getCurrentEntry()
        
        // 設定下次更新時間為明天的 00:00
        let calendar = Calendar.current
        let nextUpdate = calendar.startOfDay(for: currentEntry.date.addingTimeInterval(86400))
        let timeline = Timeline(entries: [currentEntry], policy: .after(nextUpdate))
        completion(timeline)
    }
    
    private func getCurrentEntry() -> FortuneEntry {
        let currentDate = Date()
        let calendar = Calendar.current
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: currentDate) ?? 1
        
        // 從 LunarCalendarDataManager 獲取當天資料
        let lunarData = LunarCalendarDataManager.shared.getData(for: currentDate)
        
        return FortuneEntry(
            date: currentDate,
            dayOfYear: dayOfYear,
            idiom: lunarData.idiom,
            imageName: lunarData.idiomImageName,
            idiomDescription: lunarData.idiomDescription,
            lunarTerm: lunarData.lunarTerm,
            suitableActivities: lunarData.suitableActivities,
            unsuitableActivities: lunarData.unsuitableActivities
        )
    }

    private var sampleEntry: FortuneEntry {
        let sampleDate = Date()
        let lunarData = LunarCalendarDataManager.shared.getData(for: sampleDate)
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: sampleDate) ?? 139
        
        return FortuneEntry(
            date: sampleDate,
            dayOfYear: dayOfYear,
            idiom: lunarData.idiom,
            imageName: lunarData.idiomImageName,
            idiomDescription: lunarData.idiomDescription,
            lunarTerm: lunarData.lunarTerm,
            suitableActivities: lunarData.suitableActivities,
            unsuitableActivities: lunarData.unsuitableActivities
        )
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
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    Spacer()
                    Text("#\(entry.dayOfYear)")
                        .font(.system(size: 12, weight: .regular, design: .monospaced))
                        .foregroundColor(.primary)
                }

                Image(entry.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)

                HStack {
                    Text(entry.date.weekdayString)
                        .font(.system(size: 12, weight: .regular, design: .monospaced))
                        .foregroundColor(.primary)
                    Spacer()
                    Text(entry.date.formattedMMdd())
                        .font(.system(size: 12, weight: .regular, design: .monospaced))
                        .foregroundColor(.primary.opacity(0.8))
                }
            }
            .padding(4)
        }
        .containerBackground(
            LinearGradient.widgetBackground,
            for: .widget
        )


        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .widgetURL(URL(string: "yourapp://open-today"))
       }
    
    private var mediumView: some View {
            HStack {
                Image(entry.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)

                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(entry.idiom)
                            .font(.system(size: 16, weight: .regular))
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack {
                            Text(entry.date.weekdayString)
                                .font(.system(size: 13, weight: .regular, design: .monospaced))
                                .foregroundColor(.primary)
                            Text(entry.date.formattedMMdd())
                                .font(.system(size: 13, weight: .regular, design: .monospaced))
                                .foregroundColor(.primary.opacity(0.8))
                        }
                        Text("#\(entry.dayOfYear)")
                            .font(.system(size: 13, weight: .regular, design: .monospaced))
                            .foregroundColor(.primary.opacity(0.6))
                    }
                }

                Spacer()
            }
            .padding(8)
            .containerBackground(
                LinearGradient.widgetBackground, // ← 換成這個
                for: .widget
            )

        }
    
    private var largeView: some View {
            VStack(spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(entry.idiom)
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("#\(entry.dayOfYear)")
                        .font(.system(size: 18, weight: .regular, design: .monospaced))
                        .foregroundColor(.primary)
                }
                

                Image(entry.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)

                // 宜忌資訊
                VStack(spacing: 28) {
                    Text("\(entry.suitableActivities) | \(entry.unsuitableActivities)")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .foregroundColor(.primary.opacity(0.8))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Text(entry.date.weekdayString)
                            .font(.system(size: 18, weight: .regular, design: .monospaced))
                            .foregroundColor(.primary)
                        Spacer()
                        Text(entry.date.formattedMMdd())
                            .font(.system(size: 18, weight: .regular, design: .monospaced))
                            .foregroundColor(.primary.opacity(0.8))
                    }
                }
            }
            .padding()
            .containerBackground(
                LinearGradient.widgetBackground, // ← 換成這個
                for: .widget
            )
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
        let sampleDate = Date()
        let lunarData = LunarCalendarDataManager.shared.getData(for: sampleDate)
        let dayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: sampleDate) ?? 139
        
        return FortuneEntry(
            date: sampleDate,
            dayOfYear: dayOfYear,
            idiom: lunarData.idiom,
            imageName: lunarData.idiomImageName,
            idiomDescription: lunarData.idiomDescription,
            lunarTerm: lunarData.lunarTerm,
            suitableActivities: lunarData.suitableActivities,
            unsuitableActivities: lunarData.unsuitableActivities
        )
    }
}
