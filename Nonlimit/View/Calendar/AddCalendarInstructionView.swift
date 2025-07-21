//
//  AddCalendarInstructionView.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI
import Lottie



struct AddCalendarInstructionView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var hasTapped = false
    
    var body: some View {
        
        VStack(spacing: 24) {
            // 標題
            Text("操作教學")
                .font(.title2.bold())
                .foregroundColor(.primary)

            Image("instruction")
                .resizable()
                .scaledToFit()
                .frame(width: 240)
                .cornerRadius(12)

            // 說明文字
            Text("長按 APP icon 可調整組建尺寸")
                .font(.subheadline)
                .foregroundColor(.secondary)

            // 到桌面設定按鈕
            Button(action: {
                hasTapped = true

            // 等待 1 秒後讓 App 進入背景（看起來像跳到桌面）
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                }
                }) {
                Text("到桌面設定")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
            }

        }
        .padding(.top, 40)
    }
}

#Preview {
    CalendarView()
}
