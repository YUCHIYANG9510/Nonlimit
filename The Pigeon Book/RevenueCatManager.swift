//
//  RevenueCatManager.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/7/24.
//

import Foundation
import RevenueCat
import SwiftUI

@MainActor
class RevenueCatManager: ObservableObject {
    static let shared = RevenueCatManager()

    @Published var isPremiumUser: Bool = false
    @Published var isTrialUser: Bool = false
    @Published var hasTriedBefore: Bool = false
    @Published var trialDaysLeft: Int = 0
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    let monthlyID = "com.nonlimit.monthly"
    let lifetimeID = "com.nonlimit.lifetime"
    let lifetimeTrialID = "com.nonlimit.lifetime_trial"

    private var isInitialCheck = true
    
    // 計算屬性：是否可以免費試用
    var canStartTrial: Bool {
        return !hasTriedBefore && !isPremiumUser
    }

    init() {
        Task {
            await refreshStatus()
            // 開始定期檢查狀態（每30秒檢查一次）
            startPeriodicStatusCheck()
        }
    }
    
    // 定期檢查狀態，確保試用過期能及時更新
    private func startPeriodicStatusCheck() {
        Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { _ in
            Task { @MainActor in
                await self.checkSubscriptionStatus()
            }
        }
    }

    /// 外部可呼叫的狀態刷新（用於畫面開啟時更新）
    func refreshStatus() async {
        await checkSubscriptionStatus()
    }

    /// 檢查用戶是否為 Premium、是否在試用期中
    func checkSubscriptionStatus() async {
        do {
            let customerInfo = try await Purchases.shared.customerInfo()
            let entitlement = customerInfo.entitlements["Premium"]
            let isActive = entitlement?.isActive == true
            
            let previousPremiumStatus = isPremiumUser
            
            // 🔧 修正：先檢查是否曾經購買過試用版本
            let hasTrialHistory = customerInfo.allPurchasedProductIdentifiers.contains(lifetimeTrialID)
            
            print("🔍 [DEBUG] allPurchasedProductIdentifiers: \(customerInfo.allPurchasedProductIdentifiers)")
            print("🔍 [DEBUG] hasTrialHistory: \(hasTrialHistory)")

            if let productID = entitlement?.productIdentifier,
               productID == lifetimeTrialID,
               let purchaseDate = entitlement?.latestPurchaseDate {

                /*    let daysSince = 10  // 👈 模擬已過 10 天 */

              let daysSince = Calendar.current.dateComponents([.day], from: purchaseDate, to: Date()).day ?? 0
                hasTriedBefore = true  // 有試用記錄

                if daysSince < 7 {
                    // 試用中
                    isTrialUser = true
                    trialDaysLeft = 7 - daysSince
                    isPremiumUser = true
                    print("🔍 [DEBUG] 用戶正在試用中，剩餘 \(trialDaysLeft) 天")
                } else {
                    // 試用過期
                    isTrialUser = false
                    trialDaysLeft = 0
                    isPremiumUser = false
                    print("🔍 [DEBUG] 試用已過期")
                }

            } else {
                // 不是當前的 lifetime_trial 訂閱
                isTrialUser = false
                trialDaysLeft = 0
                isPremiumUser = isActive
                
                // 🔧 修正：使用購買歷史判斷是否試用過
                hasTriedBefore = hasTrialHistory
                
                if hasTrialHistory {
                    print("🔍 [DEBUG] 用戶曾經試用過，但現在不是試用狀態")
                } else {
                    print("🔍 [DEBUG] 用戶從未試用過")
                }
            }
            
            // 如果從購買歷史中發現試用記錄，但當前沒有活躍訂閱，可能是試用過期
            if hasTrialHistory && !isActive && entitlement?.productIdentifier != lifetimeTrialID {
                print("🔍 [DEBUG] 檢測到試用過期情況")
                isPremiumUser = false
                isTrialUser = false
                hasTriedBefore = true
            }
            
            // 同步到 AppStorage（為了向後兼容）
            UserDefaults.standard.set(isPremiumUser, forKey: "isPremiumUser")

            // 如果狀態從付費變為免費，發送通知
            if previousPremiumStatus && !isPremiumUser {
                NotificationCenter.default.post(name: .trialExpired, object: nil)
                print("⚠️ 試用已過期，從付費用戶變為免費用戶")
            }

            let wasNotPremium = !previousPremiumStatus
            if !isInitialCheck && isPremiumUser && wasNotPremium {
                NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                print("🎉 狀態改變：已升級為付費用戶，發送通知")
            }

            isInitialCheck = false
            print("🔍 Premium: \(isPremiumUser), Trial: \(isTrialUser), Days Left: \(trialDaysLeft), Has Tried: \(hasTriedBefore), Can Start Trial: \(canStartTrial)")

        } catch {
            errorMessage = "無法獲取用戶訂閱狀態"
            print("❌ Error fetching subscription info: \(error)")
        }
    }

    func purchaseMonthly() async {
        await purchase(productID: monthlyID)
    }

    func purchaseLifetime() async {
        await purchase(productID: lifetimeID)
    }

    func purchaseLifetimeTrial() async {
        await purchase(productID: lifetimeTrialID)
    }

    private func purchase(productID: String) async {
        isLoading = true
        defer { isLoading = false }

        do {
            let offerings = try await Purchases.shared.offerings()

            print("📦 [DEBUG] 目前 Offering 中的可用商品：")
            for pkg in offerings.current?.availablePackages ?? [] {
                print("🛒 \(pkg.storeProduct.productIdentifier)")
            }

            guard let package = offerings.current?.availablePackages.first(where: {
                $0.storeProduct.productIdentifier == productID
            }) else {
                errorMessage = "找不到對應的商品"
                return
            }

            let result = try await Purchases.shared.purchase(package: package)

            if result.customerInfo.entitlements["Premium"]?.isActive == true {
                let wasNotPremium = !isPremiumUser
                isPremiumUser = true
                errorMessage = nil
                
                // 同步到 AppStorage
                UserDefaults.standard.set(true, forKey: "isPremiumUser")
                
                // 如果購買的是試用版本，更新試用狀態
                if productID == lifetimeTrialID {
                    hasTriedBefore = true
                    isTrialUser = true
                    trialDaysLeft = 7
                }

                if wasNotPremium {
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                    print("🎉 購買成功，發送升級通知")
                }

                print("🎉 購買成功：\(productID)")
            } else {
                errorMessage = "購買未成功"
                // 🔧 修正：購買失敗後強制刷新狀態
                print("⚠️ 購買失敗，可能是重複購買試用版本")
                await checkSubscriptionStatus()
            }

        } catch {
            // 🔧 修正：捕捉到錯誤後也要刷新狀態
            if error.localizedDescription.contains("already purchased") ||
               error.localizedDescription.contains("試用") {
                print("⚠️ 檢測到重複試用錯誤，刷新狀態")
                await checkSubscriptionStatus()
                errorMessage = "您已經使用過免費試用"
            } else {
                errorMessage = "購買失敗：\(error.localizedDescription)"
            }
            print("❌ Purchase error: \(error)")
        }
    }

    func restorePurchases() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let info = try await Purchases.shared.restorePurchases()
            if info.entitlements["Premium"]?.isActive == true {
                let wasNotPremium = !isPremiumUser
                isPremiumUser = true
                errorMessage = nil
                
                // 同步到 AppStorage
                UserDefaults.standard.set(true, forKey: "isPremiumUser")

                if wasNotPremium {
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                    print("🎉 恢復購買成功，發送升級通知")
                }

                print("✅ 成功恢復購買")
            } else {
                errorMessage = "沒有找到有效的訂閱"
            }
            
            // 🔧 修正：無論恢復成功與否都刷新狀態
            await checkSubscriptionStatus()
            
        } catch {
            errorMessage = "恢復購買失敗：\(error.localizedDescription)"
            print("❌ Restore error: \(error)")
        }
    }
}

extension Notification.Name {
    static let purchaseCompleted = Notification.Name("PurchaseCompleted")
    static let trialExpired = Notification.Name("TrialExpired")
}
