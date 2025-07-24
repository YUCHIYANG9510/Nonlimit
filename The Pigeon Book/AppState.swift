//
//  AppState.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/21.
//

import SwiftUI

// MARK: - AppState (更新版本)
class AppState: ObservableObject {
    @Published var hasSeenSplash: Bool = false
    @Published var selectedCardIndex: Int = 0
    @Published var isPremiumUser: Bool = false
    @Published var dailyQuestionCount: Int = 0
    @Published var showUpgradeDialog: Bool = false
    @Published var isLoading: Bool = false
    
    private let maxFreeQuestions = 3
    private let dailyCountKey = "dailyQuestionCount"
    private let lastResetDateKey = "lastResetDate"
    private let premiumUserKey = "isPremiumUser"
    
    init() {
        // Debug 強制免費（測試用）
        UserDefaults.standard.set(false, forKey: premiumUserKey)
        // Check if splash has been shown before
        self.hasSeenSplash = UserDefaults.standard.bool(forKey: "hasSeenSplash")
        
        // Load premium status
        self.isPremiumUser = UserDefaults.standard.bool(forKey: premiumUserKey)
        
        // Check if we need to reset daily count
        checkAndResetDailyCount()
        
        // Load daily question count
        self.dailyQuestionCount = UserDefaults.standard.integer(forKey: dailyCountKey)
        
        // ✅ 收到 RevenueCat 的通知就升級
            NotificationCenter.default.addObserver(
                forName: .purchaseCompleted,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                self?.upgradeToPremium()
            }
    }
    
    func markSplashAsShown() {
        hasSeenSplash = true
        UserDefaults.standard.set(true, forKey: "hasSeenSplash")
    }
    
    // 檢查是否可以提問
    func canAskQuestion() -> Bool {
        return isPremiumUser || dailyQuestionCount < maxFreeQuestions
    }
    
    // 嘗試使用一次提問機會
    func useQuestionAttempt() -> Bool {
        if isPremiumUser {
            return true // 付費用戶無限制
        }

        if dailyQuestionCount < maxFreeQuestions {
            dailyQuestionCount += 1
            UserDefaults.standard.set(dailyQuestionCount, forKey: dailyCountKey)
            return true
        } else {
            // ✅ 安全地在下一個 UI loop 中改變 @Published 狀態
            DispatchQueue.main.async {
                self.showUpgradeDialog = true
            }
            return false
        }
    }

    // 獲取剩餘免費次數
    func getRemainingFreeQuestions() -> Int {
        return isPremiumUser ? -1 : max(0, maxFreeQuestions - dailyQuestionCount)
    }
    
    // 升級為付費用戶
    func upgradeToPremium() {
        isPremiumUser = true
        UserDefaults.standard.set(true, forKey: premiumUserKey)
    }
    
    // 檢查並重置每日計數
    private func checkAndResetDailyCount() {
        let today = Calendar.current.startOfDay(for: Date())
        
        if let lastResetDate = UserDefaults.standard.object(forKey: lastResetDateKey) as? Date {
            let lastReset = Calendar.current.startOfDay(for: lastResetDate)
            
            if today > lastReset {
                // 新的一天，重置計數
                UserDefaults.standard.set(0, forKey: dailyCountKey)
                UserDefaults.standard.set(today, forKey: lastResetDateKey)
            }
        } else {
            // 第一次使用，設置今天為重置日期
            UserDefaults.standard.set(today, forKey: lastResetDateKey)
            UserDefaults.standard.set(0, forKey: dailyCountKey)
        }
    }
    

}

