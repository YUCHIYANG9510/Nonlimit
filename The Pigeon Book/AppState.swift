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
    @Published var showUpgradeView: Bool = false
    @Published var isLoading: Bool = false
    
    private let maxFreeQuestions = 3
    private let dailyCountKey = "dailyQuestionCount"
    private let lastResetDateKey = "lastResetDate"
    private let premiumUserKey = "isPremiumUser"
    
    init() {
           // Check if splash has been shown before
           self.hasSeenSplash = UserDefaults.standard.bool(forKey: "hasSeenSplash")
           
           // 修改：初始化時默認為免費用戶，等待 RevenueCat 檢查後再更新
           self.isPremiumUser = false
           
           // Check if we need to reset daily count
           checkAndResetDailyCount()
           
           // Load daily question count
           self.dailyQuestionCount = UserDefaults.standard.integer(forKey: dailyCountKey)
           
           // 新增：監聽 RevenueCat 狀態變化
           setupRevenueCatObserver()
           
           // ✅ 收到 RevenueCat 的通知就升級
           NotificationCenter.default.addObserver(
               forName: .purchaseCompleted,
               object: nil,
               queue: .main
           ) { [weak self] _ in
               print("🔍 AppState 收到購買完成通知")
               Task { @MainActor in
                   await self?.syncWithRevenueCat()
               }
           }
       }
    
    // 🔥 新增：設置 RevenueCat 觀察者
       private func setupRevenueCatObserver() {
           // 初始同步
           Task { @MainActor in
               await syncWithRevenueCat()
           }
           
           // 定期檢查（可選，作為備份機制）
           Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { [weak self] _ in
               Task { @MainActor in
                   await self?.syncWithRevenueCat()
               }
           }
       }
    
    // 🔥 修改：與 RevenueCat 同步狀態
       @MainActor
       private func syncWithRevenueCat() async {
           DebugLogger.info("開始同步 RevenueCat 狀態...")
           let revenueCat = RevenueCatManager.shared
           await revenueCat.checkSubscriptionStatus()
           
           let newPremiumStatus = revenueCat.isPremiumUser
           
           DebugLogger.debug("RevenueCat 狀態: \(newPremiumStatus)")
           
           if isPremiumUser != newPremiumStatus {
               DebugLogger.info("AppState 同步 RevenueCat: \(isPremiumUser) -> \(newPremiumStatus)")
               isPremiumUser = newPremiumStatus
               UserDefaults.standard.set(newPremiumStatus, forKey: premiumUserKey)
               
               // 如果升級成功，關閉升級相關 UI
               if newPremiumStatus {
                   showUpgradeView = false
                   showUpgradeDialog = false
                   DebugLogger.info("已升級為付費用戶，關閉升級 UI")
               }
           }
       }
    
    func markSplashAsShown() {
        hasSeenSplash = true
        UserDefaults.standard.set(true, forKey: "hasSeenSplash")
    }
    
    // 檢查是否可以提問
    func canAskQuestion() -> Bool {
        let canAsk = isPremiumUser || dailyQuestionCount < maxFreeQuestions
        DebugLogger.debug("canAskQuestion: isPremium=\(isPremiumUser), count=\(dailyQuestionCount), result=\(canAsk)")
        return canAsk
    }
    
    // 嘗試使用一次提問機會
    func useQuestionAttempt() -> Bool {
        DebugLogger.debug("useQuestionAttempt: isPremium=\(isPremiumUser), count=\(dailyQuestionCount)")
        
        if isPremiumUser {
            DebugLogger.info("付費用戶，允許提問")
            return true
        }

        if dailyQuestionCount < maxFreeQuestions {
            dailyQuestionCount += 1
            UserDefaults.standard.set(dailyQuestionCount, forKey: dailyCountKey)
            DebugLogger.info("免費提問成功，剩餘: \(maxFreeQuestions - dailyQuestionCount)")
            return true
        } else {
            DebugLogger.warning("免費次數已用完")
            // 🔥 修改：在顯示升級對話框前先檢查一次狀態
            Task { @MainActor in
                await syncWithRevenueCat()
                if !isPremiumUser {
                    showUpgradeDialog = true
                }
            }
            return false
        }
    }

    // 獲取剩餘免費次數
    func getRemainingFreeQuestions() -> Int {
        return isPremiumUser ? -1 : max(0, maxFreeQuestions - dailyQuestionCount)
    }
    
    // 升級為付費用戶 - 保留但主要用於手動觸發
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
    
    // 🔥 新增：重置所有狀態（用於測試或清除數據）
       func resetAllStates() {
           print("🔍 重置所有應用狀態")
           isPremiumUser = false
           dailyQuestionCount = 0
           showUpgradeDialog = false
           showUpgradeView = false
           
           // 清除 UserDefaults
           UserDefaults.standard.removeObject(forKey: premiumUserKey)
           UserDefaults.standard.set(0, forKey: dailyCountKey)
           UserDefaults.standard.set(Date(), forKey: lastResetDateKey)
           
           // 重新同步 RevenueCat 狀態
           Task { @MainActor in
               await syncWithRevenueCat()
           }
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
