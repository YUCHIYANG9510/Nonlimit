//
//  UpgradeView.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/7/24.
//

import SwiftUI
import RevenueCat

enum UpgradeOption {
    case monthly
    case lifetime
}

struct UpgradeView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @State private var selectedOption: UpgradeOption = .lifetime
    @StateObject private var revenueCat = RevenueCatManager.shared

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 96/255, green: 103/255, blue: 204/255),
                    Color(red: 120/255, green: 84/255, blue: 216/255)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color.white.opacity(0.4))
                            .padding(16)
                    }
                }
                .padding(.top, 12)
                .padding(.trailing, 12)

                Spacer(minLength: 0)

                Image("icon_default")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(radius: 4)
                    .padding(.bottom, 16)

                HStack(spacing: 12) {
                    Text("The Pigeon book")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    Text("PRO")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(red: 236/255, green: 116/255, blue: 236/255))
                        .cornerRadius(6)
                }
                .padding(.bottom, 28)

                VStack(alignment: .leading, spacing: 18) {
                    Label("無限次數提問", systemImage: "text.bubble.fill")
                    Label("解鎖一整年 365 天貼圖", systemImage: "face.smiling.fill")
                    Label("將會有更多會員專屬福利！", systemImage: "gift.fill")
                }
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
                .padding(.horizontal, 80)
                .padding(.bottom, 24)

                VStack(spacing: 18) {
                    UpgradeButton(
                        title: "每月訂閱 $30",
                        subtitle: "可隨時取消訂閱",
                        isSelected: selectedOption == .monthly
                    ) {
                        selectedOption = .monthly
                    }

                    UpgradeButton(
                        title: "永久使用 $320",
                        subtitle: "前七天免費",
                        badge: "限時優惠",
                        isSelected: selectedOption == .lifetime
                    ) {
                        selectedOption = .lifetime
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 36)

                Button(action: {
                    if selectedOption == .monthly {
                        Task { await revenueCat.purchaseMonthly() }
                    } else {
                        Task { await revenueCat.purchaseLifetime() }
                    }
                }) {
                    HStack {
                        if revenueCat.isLoading {
                            ProgressView()
                                .scaleEffect(0.8)
                                .tint(.black)
                            Text("處理中...")
                        } else {
                            Text(selectedOption == .monthly ? "我要升級" : "免費試用")
                        }
                    }
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(Color(red: 170/255, green: 255/255, blue: 80/255))
                    .cornerRadius(40)
                    .padding(.horizontal, 72)
                }
                .disabled(revenueCat.isLoading)
                .padding(.bottom, 40)

                HStack(spacing: 16) {
                    Link("服務條款", destination: URL(string: "https://www.notion.so/2313fc7b7fd780bea796fea0540e9b86")!)
                    Text("|")
                    Link("隱私權", destination: URL(string: "https://www.notion.so/2313fc7b7fd78096b154d8a249f98d22")!)
                    Text("|")
                    Button("回覆購買") {
                        Task { await revenueCat.restorePurchases() }
                    }
                    .disabled(revenueCat.isLoading)
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
                .padding(.bottom, 24)
            }

            if revenueCat.isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {}
            }
        }
        .alert("錯誤", isPresented: .constant(revenueCat.errorMessage != nil)) {
            Button("確定") {
                revenueCat.errorMessage = nil
            }
        } message: {
            Text(revenueCat.errorMessage ?? "")
        }
        .onReceive(NotificationCenter.default.publisher(for: .purchaseCompleted)) { _ in
            print("🔍 UpgradeView 收到購買完成通知")
            
            // 🔥 修改：確保 AppState 狀態同步
            Task { @MainActor in
                // 等待一小段時間讓 RevenueCat 完全更新
                try? await Task.sleep(nanoseconds: 500_000_000) // 0.5秒
                
                // 強制同步 AppState 與 RevenueCat 的狀態
                if revenueCat.isPremiumUser {
                    appState.upgradeToPremium()
                    print("🔍 UpgradeView 已同步 AppState 狀態")
                }
                
                dismiss()
            }
        }
    }
}

struct UpgradeButton: View {
    let title: String
    let subtitle: String
    var badge: String? = nil
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(title)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    if let badge = badge {
                        Text(badge)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color(red: 236/255, green: 116/255, blue: 236/255))
                            .cornerRadius(6)
                    }
                }
                Text(subtitle)
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.7))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 32)
            .padding(.vertical, 20)
            .background(isSelected ? Color(red: 80/255, green: 60/255, blue: 180/255) : Color.white.opacity(0.08))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.white.opacity(0.5) : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
