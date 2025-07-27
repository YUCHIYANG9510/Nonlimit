//
//  RevenueCatManager.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/7/24.
//

import Foundation
import RevenueCat

@MainActor
class RevenueCatManager: ObservableObject {
    static let shared = RevenueCatManager()

    @Published var isPremiumUser: Bool = false
    @Published var isTrialUser: Bool = false
    @Published var trialDaysLeft: Int = 0
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    let monthlyID = "com.nonlimit.monthly"
    let lifetimeID = "com.nonlimit.lifetime"
    let lifetimeTrialID = "com.nonlimit.lifetime_trial"

    private var isInitialCheck = true

    init() {
        Task {
            await refreshStatus()
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

            if let productID = entitlement?.productIdentifier,
               productID == lifetimeTrialID,
               let purchaseDate = entitlement?.latestPurchaseDate {

                let daysSince = Calendar.current.dateComponents([.day], from: purchaseDate, to: Date()).day ?? 0

                if daysSince < 7 {
                    // 試用中
                    isTrialUser = true
                    trialDaysLeft = 7 - daysSince
                    isPremiumUser = true
                } else {
                    // 試用過期
                    isTrialUser = false
                    trialDaysLeft = 0
                    isPremiumUser = false
                }

            } else {
                // 不是 lifetime_trial，用一般邏輯判斷
                isTrialUser = false
                trialDaysLeft = 0
                isPremiumUser = isActive
            }

            let wasNotPremium = !isPremiumUser
            if !isInitialCheck && isPremiumUser && wasNotPremium {
                NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                print("🎉 狀態改變：已升級為付費用戶，發送通知")
            }

            isInitialCheck = false
            print("🔍 Premium Status: \(isPremiumUser), Trial: \(isTrialUser), Days Left: \(trialDaysLeft)")

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

                if wasNotPremium {
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                    print("🎉 購買成功，發送升級通知")
                }

                print("🎉 購買成功：\(productID)")
            } else {
                errorMessage = "購買未成功"
                await checkSubscriptionStatus()
            }

        } catch {
            errorMessage = "購買失敗：\(error.localizedDescription)"
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

                if wasNotPremium {
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                    print("🎉 恢復購買成功，發送升級通知")
                }

                print("✅ 成功恢復購買")
            } else {
                errorMessage = "沒有找到有效的訂閱"
            }
        } catch {
            errorMessage = "恢復購買失敗：\(error.localizedDescription)"
            print("❌ Restore error: \(error)")
        }
    }
}

extension Notification.Name {
    static let purchaseCompleted = Notification.Name("PurchaseCompleted")
}
