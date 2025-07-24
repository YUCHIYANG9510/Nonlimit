//
//  NonlimitApp.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import RevenueCat

@main
struct NonlimitApp: App {
    // 創建應用狀態並注入到環境中
    @StateObject private var appState = AppState()
    
    init() {
        // 初始化 RevenueCat
        Purchases.configure(withAPIKey: "appl_vFJBxPMpVzihcJNJQRrQahhEzKT")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CardListView()
            }
            .environmentObject(appState)
        }
    }
}

