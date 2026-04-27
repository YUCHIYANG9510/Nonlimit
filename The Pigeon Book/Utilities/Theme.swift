//
//  Theme.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/10/15.
//

import SwiftUI

extension Color {
    static var appCardBackground: Color { Color(.secondarySystemBackground) } // 卡片底色
    static var appTertiaryText: Color { Color(.tertiaryLabel) }               // 第三層級文字
    static var brand: Color {
            Color(UIColor { trait in
                trait.userInterfaceStyle == .dark
                ? UIColor(red: 0.86, green: 0.56, blue: 0.95, alpha: 1)  // 深色較亮
                : UIColor(red: 0.93, green: 0.45, blue: 0.93, alpha: 1)  // 淺色粉紫
            })
        }
}

extension View {
    // 針對需要淡淡遮罩的地方，用 Material 比直接用黑色更能適配深/淺色
    func adaptiveTopFade(visible: Bool) -> some View {
        overlay(
            VStack {
                LinearGradient(
                    colors: [Color.clear, .clear], // 由內容決定，預設先空
                    startPoint: .top, endPoint: .bottom
                )
                .frame(height: 0) // 由實際場景覆蓋
                Spacer()
            }
            .allowsHitTesting(false)
            .opacity(visible ? 1 : 0)
        )
    }
}
