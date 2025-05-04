//
//  AppViewModel.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/4.
//
import SwiftUI
import Lottie

// Create a global app state manager
class AppViewModel: ObservableObject {
    @Published var hasSeenSplash: Bool
    
    init() {
        // Check if splash has been shown before
        self.hasSeenSplash = UserDefaults.standard.bool(forKey: "hasSeenSplash")
    }
    
    func markSplashAsShown() {
        hasSeenSplash = true
        UserDefaults.standard.set(true, forKey: "hasSeenSplash")
    }
}
