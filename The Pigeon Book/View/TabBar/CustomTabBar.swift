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
            RoundedRectangle(cornerRadius: 16)
                .fill(.regularMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
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
