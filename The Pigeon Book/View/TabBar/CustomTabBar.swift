//
//  CustomTabBar.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI

// MARK: - Custom Tab Bar
struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: -16) {
            tabButton(
                index: 0,
                selectedImage: "ask-question-on",
                unselectedImage: "ask-question-off"
            )
            
            tabButton(
                index: 1,
                selectedImage: "calendar-on",
                unselectedImage: "calendar-off"
            )
            
            tabButton(
                index: 2,
                selectedImage: "year-overview-on",
                unselectedImage: "year-overview-off"
            )
        }
        .background(
            // 正確：先建一個形狀，再同時套背景與填充
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Material.ultraThin) // 毛玻璃層
                .background(.bar, in: RoundedRectangle(cornerRadius: 16, style: .continuous)) // 系統 bar 底色
        )
        .overlay(
            // 分隔線用系統語意色
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color(.separator), lineWidth: 1)
        )

        .padding(.bottom, 32)
    }
    
    private func tabButton(index: Int, selectedImage: String, unselectedImage: String) -> some View {
        Button(action: {
            
            let generator = UIImpactFeedbackGenerator(style: .light)
               generator.impactOccurred()
            
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                selectedTab = index
            }
        }) {
            VStack {
                Image(selectedTab == index ? selectedImage : unselectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
