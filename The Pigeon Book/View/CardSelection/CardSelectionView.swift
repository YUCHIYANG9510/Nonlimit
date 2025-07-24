//
//  CardSelectionView.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI

// MARK: - Card Selection View (更新版本)
struct OptimizedCardSelectionView: View {
    @EnvironmentObject var appState: AppState
    @State private var greetingText: String = ""
    @State private var showUpgradeView = false
    @State private var showLocalUpgradeDialog = false
    
    let displayName: String
    
    private static let cardData: [CardSelectionInfo] = [
        CardSelectionInfo(
            imageName: "icon_work",
            title: "工作",
            color: Color(red: 141/255, green: 125/255, blue: 220/255),
            cardType: .work,
            detailIcon: "work-card-2"
        ),
        CardSelectionInfo(
            imageName: "icon_love",
            title: "愛情",
            color: Color(red: 236/255, green: 116/255, blue: 236/255),
            cardType: .love,
            detailIcon: "love-card-2"
        ),
        CardSelectionInfo(
            imageName: "icon_future",
            title: "未來",
            color: Color(red: 36/255, green: 212/255, blue: 148/255),
            cardType: .future,
            detailIcon: "future-card-2"
        ),
        CardSelectionInfo(
            imageName: "icon_lunch",
            title: "午餐",
            color: Color(red: 255/255, green: 151/255, blue: 77/255),
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
            
            VStack(spacing: 40) {
                // 標題區域
                HeaderView(greetingText: greetingText, displayName: displayName)
                
                // 使用狀態顯示區域
                UsageStatusView()
                
                // 卡片區域 - 直接使用統一的資料
                CardButtonsView(cardData: Self.cardData)
                
                Spacer()
            }
        }
        .onAppear {
            greetingText = calculateGreeting()
        }
        
        .onChange(of: appState.showUpgradeDialog) {
            if appState.showUpgradeDialog {
                showLocalUpgradeDialog = true
                appState.showUpgradeDialog = false
            }
        }
        
        .alert("升級進階會員", isPresented: $showLocalUpgradeDialog) {
            Button("暫不升級", role: .cancel) { }
            Button("立即升級") {
                handleUpgrade()
            }
        } message: {
            Text("今天的免費提問次數已用完！\n升級進階會員即可享受無限制提問。")
        }
        .sheet(isPresented: $showUpgradeView) {
            UpgradeView()
                .environmentObject(appState)
        }
    }
    
    func handleUpgrade() {
        showUpgradeView = true
    }
    
    private func calculateGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12:
            return "早安"
        case 12..<18:
            return "午安"
        default:
            return "晚安"
        }
    }
    

}

// MARK: - Usage Status View
struct UsageStatusView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if appState.isPremiumUser {
            HStack {
                Image(systemName: "crown.fill")
                    .foregroundColor(.yellow)
                Text("進階會員 - 無限制提問")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.accentColor.opacity(0.8))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.3))
            )
        } else {
            let remaining = appState.getRemainingFreeQuestions()
            HStack {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.blue)
                Text("今日剩餘免費提問: \(remaining) 次")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.accentColor.opacity(0.8))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.3))
            )
        }
    }
}

// MARK: - Header View
struct HeaderView: View {
    let greetingText: String
    let displayName: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text("\(greetingText) ! \(displayName)")
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.accentColor)
                .padding(.bottom, 6)
            
            Text("選擇一個主題，開始你的每日一問")
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.accentColor.opacity(0.7))
        }
        .padding(.bottom, 4)
        .padding(.top, 140)
    }
}

// MARK: - Card Buttons Container
struct CardButtonsView: View {
    let cardData: [CardSelectionInfo]
    
    var body: some View {
        VStack(spacing: 26) {
            ForEach(cardData, id: \.id) { card in
                CardSelectionButton(card: card)
            }
        }
        .padding(.horizontal, 40)
    }
}

// MARK: - Card Selection Button (更新版本with限制)
struct CardSelectionButton: View {
    let card: CardSelectionInfo
    @EnvironmentObject var appState: AppState
    @State private var showDetailView = false
    
    var body: some View {
        Button(action: {
            if appState.useQuestionAttempt() {
                showDetailView = true
            }
            // 如果 useQuestionAttempt() 回傳 false，會自動顯示升級對話框
        }) {
            HStack(spacing: 4) {
                Image(card.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                
                Text(card.title)
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
            }
            .padding(.leading, 28)
            .padding(.trailing, 36)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 100)
                    .fill(card.color)
                    .stroke(Color.white.opacity(0.2), lineWidth: 6)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .navigationDestination(isPresented: $showDetailView) {
            CardDetailView(
                icon: card.detailIcon,
                title: card.title.uppercased(),
                cardType: card.cardType
            )
        }
    }
}
