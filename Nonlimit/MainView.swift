//
//  MainView.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/4.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        if !appState.hasSeenSplash {
            SplashView()
                .transition(.opacity)
        } else {
            NavigationStack {
                CardListView()
            }
        }
    }
}

// MARK: - Preview
#Preview("Main View - Splash") {
    // 顯示 Splash 畫面
    MainView()
        .environmentObject({
            let appState = AppState()
            appState.hasSeenSplash = false
            return appState
        }())
}

#Preview("Main View - Card List") {
    // 顯示卡片列表
    MainView()
        .environmentObject({
            let appState = AppState()
            appState.hasSeenSplash = true
            return appState
        }())
}

#Preview("Main View - Default") {
    // 預設狀態
    MainView()
        .environmentObject(AppState())
}
