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
            // TabView with tag only
            TabView(selection: $selectedTab) {
                CardSelectionView()
                    .tag(0)
                CalendarView()
                    .tag(1)
            }
            .edgesIgnoringSafeArea(.all)
            
            // Custom tab bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: -16) {
            tabButton(index: 0,
                      selectedImage: "ask-question-on",
                      unselectedImage: "ask-question-off")

            tabButton(index: 1,
                      selectedImage: "calendar-on",
                      unselectedImage: "calendar-off")
        }

        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.5))
        )
        .padding(.bottom, 32)
    }

    func tabButton(index: Int, selectedImage: String, unselectedImage: String) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack() {
                Image(selectedTab == index ? selectedImage : unselectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            
        }
    }
}



// MARK: - Card Selection View (原本的選擇頁面)
struct CardSelectionView: View {
    @EnvironmentObject var appState: AppState
    @State private var animateGradient: Bool = false

    private let cards = [
        CardSelectionInfo(imageName: "work-button", title: "Work.", color: Color.purple, cardType: .work, detailIcon: "work-card-2"),
        CardSelectionInfo(imageName: "love-button", title: "Love.", color: Color.pink, cardType: .love, detailIcon: "love-card-2"),
        CardSelectionInfo(imageName: "future-button", title: "Future.", color: Color.green, cardType: .future, detailIcon: "future-card-2"),
        CardSelectionInfo(imageName: "lunch-button", title: "Lunch.", color: Color.orange, cardType: .lunch, detailIcon: "lunch-card-2")
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 237/255, green: 220/255, blue: 244/255),
                        Color(red: 255/255, green: 229/255, blue: 255/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                Spacer()
                
                Text("你在尋找哪方面的答案呢？")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 85/255, green: 86/255, blue: 175/255))
                    .padding(.bottom, 16)
                
                // 選項卡片
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

// MARK: - Calendar View (新的日曆頁面)
struct CalendarView: View {
    @State private var currentDate = Date()
    @State private var animateGradient: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 237/255, green: 220/255, blue: 244/255),
                        Color(red: 255/255, green: 229/255, blue: 255/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                .hueRotation(.degrees(animateGradient ? 45 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // 日期資訊區塊
                VStack(spacing: 8) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(dateFormatter.string(from: currentDate))
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("#\(dayOfYear)")
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(yearMonthFormatter.string(from: currentDate))
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Text(dayOfYearDescription)
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.black)
                    
                    VStack(spacing: 4) {
                        Text(lunarDate)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("\(suitableActivities) | \(unsuitableActivities)")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                .padding(.top, 40)
                .padding(.horizontal, 30)
                
                // 成語卡片
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white.opacity(0.9))
                        .frame(height: 400)
                        .overlay(
                            VStack(spacing: 20) {
                                // 企鵝圖示區域
                                ZStack {
                                    Circle()
                                        .fill(Color.blue.opacity(0.1))
                                        .frame(width: 120, height: 120)
                                    
                                    // 這裡可以放置企鵝圖片
                                    Image(systemName: "face.smiling")
                                        .font(.system(size: 50))
                                        .foregroundColor(.blue)
                                }
                                
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
    
    // MARK: - Date Formatters and Computed Properties
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "zh_TW")
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
    
    private var dayOfYearDescription: String {
        let day = Calendar.current.component(.day, from: currentDate)
        return String(day)
    }
    
    private var lunarDate: String {
        // 這裡應該使用真正的農曆轉換，暫時使用假資料
        return "小滿"
    }
    
    private var suitableActivities: String {
        // 宜的活動，實際應該從農曆資料獲取
        return "宜出行、會友"
    }
    
    private var unsuitableActivities: String {
        // 忌的活動，實際應該從農曆資料獲取
        return "忌造廟、掘井"
    }
}

// MARK: - Card Selection Button
struct CardSelectionButton: View {
    let card: CardSelectionInfo
    
    var body: some View {
        NavigationLink(destination: CardDetailView(
            icon: card.detailIcon,
            title: card.title.uppercased().replacingOccurrences(of: ".", with: ""),
            cardType: card.cardType
        )) {
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 70) // 調整高度，寬度會自動適應
        }
    }
}

// MARK: - Supporting Models
struct CardSelectionInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let color: Color
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
