//
//  CalendarView.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI

// MARK: - Calendar View
struct CalendarView: View {
    @State private var currentDate = Date()
    @State private var animateGradient = false
    
    private var currentLunarData: LunarCalendarData {
        LunarCalendarDataManager.shared.getData(for: currentDate)
    }

    var body: some View {
        ZStack {
            // 背景漸層
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 237/255, green: 220/255, blue: 244/255),
                    Color(red: 255/255, green: 229/255, blue: 255/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }

            VStack(spacing: 30) {
                // 日期資訊區塊
                VStack(spacing: 24) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(dateFormatter.string(from: currentDate))
                                .font(.system(size: 16, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor)
                            
                            Text("#\(dayOfYear)")
                                .font(.system(size: 14, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        Text(dayOfMonth)
                            .font(.system(size: 64, weight: .bold, design: .monospaced))
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(yearMonthFormatter.string(from: currentDate))
                                .font(.system(size: 16, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor)
                        }
                    }
                    
                    VStack(spacing: 4) {
                        Text(currentLunarData.lunarTerm)
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        
                        Text("\(currentLunarData.suitableActivities)  |  \(currentLunarData.unsuitableActivities)")
                            .font(.subheadline)
                            .foregroundColor(.accentColor.opacity(0.7))
                    }
                }
                .padding(.top, 100)
                .padding(.horizontal, 30)
                
                // 成語卡片
                VStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white.opacity(0.5))
                        .frame(height: 400)
                        .overlay(
                            VStack(spacing: 20) {
                                Image(currentLunarData.idiomImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                
                                VStack(spacing: 12) {
                                    Text(currentLunarData.idiom)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.accentColor)
                                    
                                    Text(currentLunarData.idiomDescription)
                                        .font(.system(size: 14))
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 28)
                                }
                            }
                        )
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
}


// MARK: - Calendar View Extensions
extension CalendarView {
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }
    
    private var yearMonthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM"
        return formatter
    }
    
    private var dayOfYear: Int {
        Calendar.current.ordinality(of: .day, in: .year, for: currentDate) ?? 1
    }
    
    private var dayOfMonth: String {
        let day = Calendar.current.component(.day, from: currentDate)
        return String(day)
    }
    
    private var lunarDate: String {
        // TODO: 實際實現農曆轉換
        return "小滿"
    }
    
    private var suitableActivities: String {
        // TODO: 從真實農曆資料獲取
        return "宜出行、會友"
    }
    
    private var unsuitableActivities: String {
        // TODO: 從真實農曆資料獲取
        return "忌造廟、掘井"
    }
}
