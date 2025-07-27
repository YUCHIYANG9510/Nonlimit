//
//  SubscriptionStatusView.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/7/24.
//

import SwiftUI
import RevenueCat

struct SubscriptionStatusView: View {
    @Environment(\.dismiss) var dismiss
    @State private var expirationDate: String = "載入中..."
    @State private var isLifetime: Bool = false
    @State private var purchaseDateText: String = ""
    @StateObject private var revenueCat = RevenueCatManager.shared

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer().frame(height: 40)

                Image("icon_default")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(.bottom, 8)

                HStack(spacing: 12) {
                    Text("The Pigeon book")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .foregroundColor(.accentColor)

                    Text("PRO")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(red: 236/255, green: 116/255, blue: 236/255))
                        .cornerRadius(6)
                }
                .padding(.bottom, 8)

                VStack(spacing: 8) {
                    VStack(spacing: 4) {
                        Text("您是鴿子專家")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.accentColor)

                        Text("感謝支持！")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.accentColor.opacity(0.7))
                    }

                    if revenueCat.isTrialUser {
                        Text("你正在免費試用，還剩下 \(revenueCat.trialDaysLeft) 天")
                            .font(.footnote)
                            .foregroundColor(.orange)
                    }

                    if !purchaseDateText.isEmpty {
                        Text(purchaseDateText)
                            .font(.footnote)
                            .foregroundColor(.accentColor.opacity(0.7))
                    }

                    Divider().padding(.vertical, 16)

                    if !revenueCat.isTrialUser {
                        HStack {
                            Text("訂閱")
                            Spacer()
                            Text("PRO")
                                .foregroundColor(.accentColor)
                        }

                        HStack {
                            Text("有效期至")
                            Spacer()
                            Text(expirationDate)
                                .fontWeight(.semibold)
                        }

                        Divider().padding(.vertical, 16)

                        if !isLifetime {
                            Text("您的訂閱將在上方列出的日期續訂。\n為避免收費，請在續訂日前 24 小時取消免費試用期或訂閱。")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                    }
                }

                Spacer()

                Button(action: {
                    if let url = URL(string: "https://apps.apple.com/account/subscriptions") {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("管理訂閱")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
                .padding(.horizontal, 40)

                Button("關閉") {
                    dismiss()
                }
                .padding(.top, 16)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .task {
                await revenueCat.checkSubscriptionStatus() // ⬅️ 加這行強制同步狀態
                await fetchExpirationDate()
            }
        }
    }

    func fetchExpirationDate() async {
        do {
            let info = try await Purchases.shared.customerInfo()
            let entitlement = info.entitlements["Premium"]

            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.locale = Locale(identifier: "zh_TW")

            if let date = entitlement?.expirationDate {
                expirationDate = formatter.string(from: date)
                isLifetime = false
            } else if entitlement?.isActive == true {
                expirationDate = "永久"
                isLifetime = true
            } else {
                expirationDate = "無法取得"
                isLifetime = false
            }

            if let purchaseDate = entitlement?.latestPurchaseDate {
                purchaseDateText = "您於 \(formatter.string(from: purchaseDate)) 購買"
            }

        } catch {
            expirationDate = "錯誤"
            isLifetime = false
            purchaseDateText = ""
        }
    }
}
