//
//  NonlimitApp.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

@main
struct NonlimitApp: App {
    // 創建應用狀態並注入到環境中
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CardListView()
            }
            .environmentObject(appState)
        }
    }
}
