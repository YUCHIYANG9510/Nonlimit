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
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // 這兩個 ID 必須與 RevenueCat / App Store 的產品 ID 一致
    let monthlyID = "com.nonlimit.monthly"
    let lifetimeID = "com.nonlimit.lifetime"
    
    // 追蹤是否是初始化檢查
    private var isInitialCheck = true

    init() {
        Task {
            await checkSubscriptionStatus()
        }
    }

    /// 檢查目前用戶是否擁有 premium 訂閱（對應 RevenueCat 後台的 entitlement ID）
    func checkSubscriptionStatus() async {
        do {
            let customerInfo = try await Purchases.shared.customerInfo()
            let isActive = customerInfo.entitlements["Premium"]?.isActive == true
            
            // 🔥 修正：先保存舊狀態，再更新新狀態
            let wasNotPremium = !isPremiumUser
            isPremiumUser = isActive
            
            // 只有在非初始檢查且從非付費變為付費時才發送通知
            if !isInitialCheck && isActive && wasNotPremium {
                NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                print("🎉 狀態改變：已升級為付費用戶，發送通知")
            }
            
            isInitialCheck = false
            print("🔍 Premium Status: \(isActive)")
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

    private func purchase(productID: String) async {
        isLoading = true
        defer { isLoading = false }

        do {
            let offerings = try await Purchases.shared.offerings()
            guard let package = offerings.current?.availablePackages.first(where: {
                $0.storeProduct.productIdentifier == productID
            }) else {
                errorMessage = "找不到對應的商品"
                return
            }

            let result = try await Purchases.shared.purchase(package: package)

            if result.customerInfo.entitlements["Premium"]?.isActive == true {
                // 🔥 修正：先保存舊狀態
                let wasNotPremium = !isPremiumUser
                isPremiumUser = true
                
                // 只有從非付費變為付費時才發送通知
                if wasNotPremium {
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                    print("🎉 購買成功，發送升級通知")
                }
                
                errorMessage = nil
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
                // 🔥 修正：先保存舊狀態
                let wasNotPremium = !isPremiumUser
                isPremiumUser = true
                
                // 只有從非付費變為付費時才發送通知
                if wasNotPremium {
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                    print("🎉 恢復購買成功，發送升級通知")
                }
                
                errorMessage = nil
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
