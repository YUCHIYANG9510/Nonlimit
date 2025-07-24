//
//  RevenueCatManager.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/7/24.
//

//
//  RevenueCatManager.swift
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
            isPremiumUser = isActive
            if isActive {
                NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
            }
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
                if isPremiumUser == false {
                    isPremiumUser = true
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
                }
                errorMessage = nil
                print("🎉 購買成功：\(productID)")
            } else {
                errorMessage = "購買未成功"
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
                if isPremiumUser == false {
                    isPremiumUser = true
                    NotificationCenter.default.post(name: .purchaseCompleted, object: nil)
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

