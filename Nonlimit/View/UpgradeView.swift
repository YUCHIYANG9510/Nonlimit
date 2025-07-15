//
//  UpgradeView.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/14.
//

import SwiftUI
import StoreKit

enum UpgradeOption {
    case monthly
    case lifetime
}

struct UpgradeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedOption: UpgradeOption = .lifetime
    
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
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 20)
                }
                
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
                    HStack(spacing: 12) {
                        Image(systemName: "text.bubble.fill")
                            .foregroundColor(Color(red: 170/255, green: 255/255, blue: 80/255))
                            .font(.system(size: 24))
                        Text("無限次數提問")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "face.smiling.fill")
                            .foregroundColor(Color(red: 170/255, green: 255/255, blue: 80/255))
                            .font(.system(size: 24))
                        Text("解鎖一整年 365 天貼圖")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "gift.fill")
                            .foregroundColor(Color(red: 170/255, green: 255/255, blue: 80/255))
                            .font(.system(size: 24))
                        Text("將會有更多會員專屬福利！")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 80)
                .padding(.bottom, 24)
                
                VStack(spacing: 18) {
                    
                    // 每月訂閱按鈕（Unselected 預設）
                    Button(action: {
                        selectedOption = .monthly
                    }) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("每個月 $30.00")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                            Text("可隨時取消訂閱")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 20)
                        .background(selectedOption == .monthly ? Color(red: 80/255, green: 60/255, blue: 180/255) : Color.white.opacity(0.08))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(selectedOption == .monthly ? Color.white.opacity(0.5) : Color.clear, lineWidth: 2)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // 永久使用按鈕（Selected 預設）
                    Button(action: {
                        selectedOption = .lifetime
                    }) {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("永久使用 $490.00")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("限時優惠")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(Color(red: 236/255, green: 116/255, blue: 236/255))
                                    .cornerRadius(6)
                            }
                            Text("前七天免費")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 20)
                        .background(selectedOption == .lifetime ? Color(red: 80/255, green: 60/255, blue: 180/255) : Color.white.opacity(0.08))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(selectedOption == .lifetime ? Color.white.opacity(0.5) : Color.clear, lineWidth: 2)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 36)
                
                Button(action: {
                    if selectedOption == .monthly {
                        purchaseMonthly()
                    } else {
                        purchaseLifetime()
                    }
                }) {
                    Text(selectedOption == .monthly ? "我要升級" : "免費試用")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 60/255, green: 60/255, blue: 60/255))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color(red: 170/255, green: 255/255, blue: 80/255))
                        .cornerRadius(40)
                        .padding(.horizontal, 72)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 16) {
                    Button(action: {
                        if let url = URL(string: "https://www.notion.so/2313fc7b7fd780bea796fea0540e9b86?source=copy_link") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("服務條款")
                    }
                    .buttonStyle(PlainButtonStyle())

                    Text("|")

                    Button(action: {
                        if let url = URL(string: "https://www.notion.so/2313fc7b7fd78096b154d8a249f98d22?source=copy_link") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("隱私權")
                    }
                    .buttonStyle(PlainButtonStyle())

                    Text("|")

                    Button(action: {
                        restorePurchases()
                    }) {
                        Text("回覆購買")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
                .padding(.bottom, 24)


            }
        }
    }
    
    // MARK: - 購買邏輯
    func purchaseMonthly() {
        print("👉 開始每月訂閱流程")
        // TODO: StoreKit 購買每月方案
    }

    func purchaseLifetime() {
        print("👉 開始永久購買流程")
        // TODO: StoreKit 購買永久方案
    }
    
    func restorePurchases() {
        Task {
            do {
                try await AppStore.sync()
                print("✅ 回覆購買已觸發")
            } catch {
                print("❌ 回覆購買失敗：\(error)")
            }
        }
    }
}

#Preview {
    UpgradeView()
}

