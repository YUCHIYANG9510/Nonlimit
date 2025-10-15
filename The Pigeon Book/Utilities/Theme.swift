//
//  Theme.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/10/15.
//

import SwiftUI

extension Color {
    static var appCardBackground: Color { Color(.secondarySystemBackground) } // 卡片底色
    static var appDivider: Color { Color(.separator) }                        // 分隔線
    static var appTertiaryText: Color { Color(.tertiaryLabel) }               // 第三層級文字
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
