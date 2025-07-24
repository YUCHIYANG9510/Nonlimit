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

                // 主標題
                VStack(spacing: 4) {
                    Text("您是鴿子專家")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.accentColor)
                    
                    Text("感謝您的支持！")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.accentColor.opacity(0.7))
                }
                Divider().padding(.vertical, 16)

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

                Text("您的訂閱將在上方列出的日期續訂。\n為避免收費，請在續訂日前 24 小時取消免費試用期或訂閱。")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

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
        }
        .task {
            await fetchExpirationDate()
        }
    }

    func fetchExpirationDate() async {
        do {
            let info = try await Purchases.shared.customerInfo()
            if let date = info.entitlements["Premium"]?.expirationDate {
                let formatter = DateFormatter()
                formatter.dateStyle = .long
                formatter.locale = Locale(identifier: "zh_TW")
                expirationDate = formatter.string(from: date)
            } else {
                expirationDate = "無法取得"
            }
        } catch {
            expirationDate = "錯誤"
        }
    }
}

