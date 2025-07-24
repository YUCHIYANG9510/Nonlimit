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
    @Published var showUpgradeView: Bool = false  // 新增：控制 UpgradeView 的顯示
    @Published var isLoading: Bool = false
    
    private let maxFreeQuestions = 3
    private let dailyCountKey = "dailyQuestionCount"
    private let lastResetDateKey = "lastResetDate"
    private let premiumUserKey = "isPremiumUser"
    
    init() {
        
        
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
            print("🔍 AppState 收到購買完成通知")
            self?.upgradeToPremium()
        }
    }
    
    func markSplashAsShown() {
        hasSeenSplash = true
        UserDefaults.standard.set(true, forKey: "hasSeenSplash")
    }
    
    // 檢查是否可以提問
    func canAskQuestion() -> Bool {
        let canAsk = isPremiumUser || dailyQuestionCount < maxFreeQuestions
        print("🔍 canAskQuestion: isPremium=\(isPremiumUser), count=\(dailyQuestionCount), canAsk=\(canAsk)")
        return canAsk
    }
    
    // 嘗試使用一次提問機會
    func useQuestionAttempt() -> Bool {
        print("🔍 useQuestionAttempt 開始: isPremium=\(isPremiumUser), count=\(dailyQuestionCount)")
        
        if isPremiumUser {
            print("🔍 付費用戶，允許提問")
            return true // 付費用戶無限制
        }

        if dailyQuestionCount < maxFreeQuestions {
            dailyQuestionCount += 1
            UserDefaults.standard.set(dailyQuestionCount, forKey: dailyCountKey)
            print("🔍 免費用戶提問成功，剩餘次數: \(maxFreeQuestions - dailyQuestionCount)")
            return true
        } else {
            print("🔍 免費用戶提問次數用完，顯示升級對話框")
            // ✅ 先顯示 alert dialog
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
        print("🔍 AppState upgradeToPremium 被調用")
        print("🔍 升級前狀態: isPremium=\(isPremiumUser)")
        
        isPremiumUser = true
        UserDefaults.standard.set(true, forKey: premiumUserKey)
        
        print("🔍 升級後狀態: isPremium=\(isPremiumUser)")
        
        // 升級成功後關閉所有升級相關的 UI
        showUpgradeView = false
        showUpgradeDialog = false
        
        print("🔍 UI 狀態已重置: showUpgradeView=\(showUpgradeView), showUpgradeDialog=\(showUpgradeDialog)")
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
