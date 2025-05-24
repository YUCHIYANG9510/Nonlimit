//
//  AppState.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/21.
//

import SwiftUI

// 建立一個環境對象來存儲應用狀態
class AppState: ObservableObject {
    @Published var hasSeenSplash: Bool = false
    @Published var selectedCardIndex: Int = 0
    
    init() {
        // Check if splash has been shown before
        self.hasSeenSplash = UserDefaults.standard.bool(forKey: "hasSeenSplash")
    }
    
    func markSplashAsShown() {
        hasSeenSplash = true
        UserDefaults.standard.set(true, forKey: "hasSeenSplash")
    }
}
