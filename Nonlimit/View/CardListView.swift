//
//  CardListView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie

// MARK: - Main Tab View
struct CardListView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 使用 GeometryReader 來實現自定義滑動動畫
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    // 第一個頁面 - 卡片選擇
                    CardSelectionView()
                        .frame(width: geometry.size.width)
                    
                    // 第二個頁面 - 日曆
                    CalendarView()
                        .frame(width: geometry.size.width)
                }
                .offset(x: -CGFloat(selectedTab) * geometry.size.width)
                .contentShape(Rectangle()) // 確保點擊區域正確
            }
            .clipped() // 防止內容溢出顯示白底
            .edgesIgnoringSafeArea(.all)
            
            // 自定義底部 Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Custom Tab Bar
struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: -16) {
            tabButton(
                index: 0,
                selectedImage: "ask-question-on",
                unselectedImage: "ask-question-off"
            )
            
            tabButton(
                index: 1,
                selectedImage: "calendar-on",
                unselectedImage: "calendar-off"
            )
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.5))
        )
        .padding(.bottom, 32)
    }
    
    private func tabButton(index: Int, selectedImage: String, unselectedImage: String) -> some View {
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                selectedTab = index
            }
        }) {
            VStack {
                Image(selectedTab == index ? selectedImage : unselectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Card Selection View
struct CardSelectionView: View {
    @EnvironmentObject var appState: AppState
    @State private var animateGradient = false
    
    private let cards = [
        CardSelectionInfo(
            imageName: "work-button",
            title: "Work.",
            cardType: .work,
            detailIcon: "work-card-2"
        ),
        CardSelectionInfo(
            imageName: "love-button",
            title: "Love.",
            cardType: .love,
            detailIcon: "love-card-2"
        ),
        CardSelectionInfo(
            imageName: "future-button",
            title: "Future.",
            cardType: .future,
            detailIcon: "future-card-2"
        ),
        CardSelectionInfo(
            imageName: "lunch-button",
            title: "Lunch.",
            cardType: .lunch,
            detailIcon: "lunch-card-2"
        )
    ]
    
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
            
            VStack(spacing: 40) {
                Spacer()
                
                // 標題
                Text("你在尋找哪方面的答案呢？")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 16)
                
                // 卡片選項
                VStack(spacing: 24) {
                    ForEach(cards, id: \.id) { card in
                        CardSelectionButton(card: card)
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
        }
    }
}

// MARK: - Calendar View
struct CalendarView: View {
    @State private var currentDate = Date()
    @State private var animateGradient = false
    
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
                                .font(.headline)
                                .foregroundColor(.accentColor)
                            Text("#\(dayOfYear)")
                                .font(.subheadline)
                                .foregroundColor(.accentColor.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        Text(dayOfMonth)
                            .font(.system(size: 64, weight: .bold, design: .monospaced))
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(yearMonthFormatter.string(from: currentDate))
                                .font(.headline)
                                .foregroundColor(.accentColor)
                        }
                    }
                    
                    VStack(spacing: 4) {
                        Text(lunarDate)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("\(suitableActivities) | \(unsuitableActivities)")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                .padding(.top, 100)
                .padding(.horizontal, 30)
                
                // 成語卡片
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.5))
                        .frame(height: 400)
                        .overlay(
                            VStack(spacing: 20) {
                                Image("day144")
                                    .frame(width: 200, height: 200)
                                
                                Text("一事無成")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                
                                VStack(spacing: 8) {
                                    Text("一件事也沒做成。指事業毫無成就。")
                                        .font(.body)
                                        .foregroundColor(.black.opacity(0.8))
                                        .multilineTextAlignment(.center)
                                    
                                    Text("語出唐·白居易《除夜寄微之》詩。")
                                        .font(.caption)
                                        .foregroundColor(.black.opacity(0.6))
                                        .multilineTextAlignment(.center)
                                }
                                .padding(.horizontal, 20)
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

// MARK: - Card Selection Button
struct CardSelectionButton: View {
    let card: CardSelectionInfo
    
    var body: some View {
        NavigationLink(
            destination: CardDetailView(
                icon: card.detailIcon,
                title: card.title.uppercased().replacingOccurrences(of: ".", with: ""),
                cardType: card.cardType
            )
        ) {
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 70)
                .shadow(color: .primary.opacity(0.2), radius: 2, x: 1, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Supporting Models
struct CardSelectionInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let cardType: CardType
    let detailIcon: String
}

// MARK: - Preview
#Preview("Updated Card List View") {
    NavigationStack {
        CardListView()
            .environmentObject(AppState())
    }
}
