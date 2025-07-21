//
//  CustomButtonStyle.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI


// MARK: - 自定義按鈕樣式
struct CustomButtonStyle: ButtonStyle {
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .onChange(of: configuration.isPressed) { oldValue, newValue in
                isPressed = newValue
            }
    }
}
