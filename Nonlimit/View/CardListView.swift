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
    @State private var showSettings = false
    @State private var displayName = UserDefaults.standard.string(forKey: "displayName") ?? "🐦"
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
           ZStack(alignment: .bottom) {
               
               LinearGradient(
                       gradient: Gradient(colors: [
                           Color(red: 237/255, green: 220/255, blue: 244/255),
                           Color(red: 255/255, green: 229/255, blue: 255/255)
                       ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing
                   )
                   .ignoresSafeArea()
               
               GeometryReader { geometry in
                   HStack(spacing: 0) {
                       // 第一個頁面 - 卡片選擇
                       OptimizedCardSelectionView(displayName: displayName)
                           .frame(width: geometry.size.width)
                       
                       // 第二個頁面 - 日曆
                       CalendarView()
                           .frame(width: geometry.size.width)
                       
                       // 第三個頁面 - 年度總覽
                       YearOverviewView()
                           .frame(width: geometry.size.width)
                   }
                   .offset(x: -CGFloat(selectedTab) * geometry.size.width + dragOffset)
                   .contentShape(Rectangle())
                   .gesture(
                       DragGesture()
                           .onChanged { value in
                               let proposedOffset = value.translation.width
                               let currentIndex = selectedTab

                               // 限制拖曳範圍，只允許在可滑動範圍內拖動
                               if (currentIndex == 0 && proposedOffset > 0) || (currentIndex == 2 && proposedOffset < 0) {
                                   dragOffset = proposedOffset / 4  // 加入阻尼效果（可選）
                               } else {
                                   dragOffset = proposedOffset
                               }
                           }
                           .onEnded { value in
                               let threshold: CGFloat = 50
                               _ = geometry.size.width
                               
                               withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                   if value.translation.width > threshold && selectedTab > 0 {
                                       selectedTab -= 1
                                   } else if value.translation.width < -threshold && selectedTab < 2 {
                                       selectedTab += 1
                                   }
                                   dragOffset = 0
                               }
                           }
                   )
                              }
                              .clipped()
                              .edgesIgnoringSafeArea(.all)
            
            // 設定按鈕（左下角）
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        showSettings = true
                    }) {
                        Image("setting-icon")
                            .resizable()
                            .frame(width: 44, height: 44)
                    }
                    .padding(.leading, 36)
                    .padding(.bottom, 6)
                    
                    Spacer()
                }
            }
            
            // 自定義底部 Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showSettings) {
            SettingsView(displayName: $displayName)
                .presentationDetents([.fraction(0.5)])
                .presentationCornerRadius(40)
        }
    }
}


// MARK: - LunarCalendarData Extension
// 需要添加這個擴展讓 LunarCalendarData 遵循 Identifiable 協議
extension LunarCalendarData: Identifiable {
    public var id: String {
        return "\(lunarTerm)-\(idiom)-\(idiomImageName)"
    }
}





// MARK: - Preview
#Preview("Updated Card List View") {
    NavigationStack {
        CardListView()
            .environmentObject(AppState())
    }
}
