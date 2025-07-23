//
//  InAppPurchaseManager.swift
//  The Pigeon Book
//
//  Created by Designer on 2025/7/22.
//

import SwiftUI
import StoreKit

// MARK: - 內購管理器
@MainActor
class InAppPurchaseManager: NSObject, ObservableObject {
    @Published var products: [Product] = []
    @Published var purchaseState: PurchaseState = .notStarted
    @Published var errorMessage: String?
    
    // 根據你的設計，假設你有月付和永久購買兩種方案
    private let productIDs = ["com.nonlimit.premium_monthly", "com.nonlimit.premium_lifetime"]
    
    enum PurchaseState {
        case notStarted
        case inProgress
        case completed
        case failed
        case restored
    }
    
    override init() {
        super.init()
        Task {
            await loadProducts()
            await checkPreviousPurchases()
        }
    }
    
    // 載入產品資訊
    func loadProducts() async {
        do {
            let products = try await Product.products(for: productIDs)
            self.products = products
        } catch {
            print("Failed to load products: \(error)")
            errorMessage = "無法載入產品資訊"
        }
    }
    
    // 根據產品 ID 獲取產品
    func getProduct(for productID: String) -> Product? {
        return products.first { $0.id == productID }
    }
    
    // 購買產品
    func purchase(_ product: Product) async {
        purchaseState = .inProgress
        
        do {
            let result = try await product.purchase()
            
            switch result {
            case .success(let verificationResult):
                if case .verified(let transaction) = verificationResult {
                    // 購買成功，完成交易
                    await transaction.finish()
                    purchaseState = .completed
                    
                    // 通知 AppState 用戶已升級
                    NotificationCenter.default.post(
                        name: NSNotification.Name("PurchaseCompleted"),
                        object: nil
                    )
                } else {
                    purchaseState = .failed
                    errorMessage = "購買驗證失敗"
                }
                
            case .userCancelled:
                purchaseState = .notStarted
                
            case .pending:
                purchaseState = .inProgress
                errorMessage = "購買待處理中..."
                
            @unknown default:
                purchaseState = .failed
                errorMessage = "未知錯誤"
            }
            
        } catch {
            purchaseState = .failed
            errorMessage = "購買失敗: \(error.localizedDescription)"
            print("Purchase failed: \(error)")
        }
    }
    
    // 恢復購買
    func restorePurchases() async {
        purchaseState = .inProgress
        
        do {
            try await AppStore.sync()
            await checkPreviousPurchases()
            
            if purchaseState != .restored {
                purchaseState = .failed
                errorMessage = "沒有找到之前的購買記錄"
            }
        } catch {
            purchaseState = .failed
            errorMessage = "恢復購買失敗: \(error.localizedDescription)"
        }
    }
    
    // 檢查之前的購買
    private func checkPreviousPurchases() async {
        for await result in Transaction.currentEntitlements {
            if case .verified(let transaction) = result {
                if productIDs.contains(transaction.productID) {
                    // 用戶已經是付費用戶
                    purchaseState = .restored
                    NotificationCenter.default.post(
                        name: NSNotification.Name("PurchaseCompleted"),
                        object: nil
                    )
                    break
                }
            }
        }
    }
}

// MARK: - UpgradeOption
enum UpgradeOption {
    case monthly
    case lifetime
}

// MARK: - 整合後的 UpgradeView
struct UpgradeView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject private var purchaseManager = InAppPurchaseManager()
    @State private var selectedOption: UpgradeOption = .lifetime
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 96/255, green: 103/255, blue: 204/255),
                    Color(red: 120/255, green: 84/255, blue: 216/255)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color.white.opacity(0.4))
                            .padding(16)
                    }
                }
                .padding(.top, 12)
                .padding(.trailing, 12)
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 20)
                }
                
                Spacer(minLength: 0)
                
                Image("icon_default")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(radius: 4)
                    .padding(.bottom, 16)
                
                HStack(spacing: 12) {
                    Text("The Pigeon book")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    Text("PRO")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color(red: 236/255, green: 116/255, blue: 236/255))
                        .cornerRadius(6)
                }
                .padding(.bottom, 28)
                
                VStack(alignment: .leading, spacing: 18) {
                    HStack(spacing: 12) {
                        Image(systemName: "text.bubble.fill")
                            .foregroundColor(Color(red: 170/255, green: 255/255, blue: 80/255))
                            .font(.system(size: 24))
                        Text("無限次數提問")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "face.smiling.fill")
                            .foregroundColor(Color(red: 170/255, green: 255/255, blue: 80/255))
                            .font(.system(size: 24))
                        Text("解鎖一整年 365 天貼圖")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "gift.fill")
                            .foregroundColor(Color(red: 170/255, green: 255/255, blue: 80/255))
                            .font(.system(size: 24))
                        Text("將會有更多會員專屬福利！")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 80)
                .padding(.bottom, 24)
                
                VStack(spacing: 18) {
                    // 每月訂閱按鈕
                    Button(action: {
                        selectedOption = .monthly
                    }) {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                if let monthlyProduct = purchaseManager.getProduct(for: "com.nonlimit.premium_monthly") {
                                    Text("每個月 \(monthlyProduct.displayPrice)")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text("每個月 $30.00")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                if purchaseManager.products.isEmpty {
                                    ProgressView()
                                        .scaleEffect(0.8)
                                        .tint(.white)
                                }
                            }
                            Text("可隨時取消訂閱")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 20)
                        .background(selectedOption == .monthly ? Color(red: 80/255, green: 60/255, blue: 180/255) : Color.white.opacity(0.08))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(selectedOption == .monthly ? Color.white.opacity(0.5) : Color.clear, lineWidth: 2)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(purchaseManager.purchaseState == .inProgress)
                    
                    // 永久使用按鈕
                    Button(action: {
                        selectedOption = .lifetime
                    }) {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                if let lifetimeProduct = purchaseManager.getProduct(for: "com.nonlimit.premium_lifetime") {
                                    Text("永久使用 \(lifetimeProduct.displayPrice)")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                } else {
                                    Text("永久使用 $490.00")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                Text("限時優惠")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(Color(red: 236/255, green: 116/255, blue: 236/255))
                                    .cornerRadius(6)
                            }
                            Text("前七天免費")
                                .font(.system(size: 16))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 20)
                        .background(selectedOption == .lifetime ? Color(red: 80/255, green: 60/255, blue: 180/255) : Color.white.opacity(0.08))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(selectedOption == .lifetime ? Color.white.opacity(0.5) : Color.clear, lineWidth: 2)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(purchaseManager.purchaseState == .inProgress)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 36)
                
                Button(action: {
                    if selectedOption == .monthly {
                        purchaseMonthly()
                    } else {
                        purchaseLifetime()
                    }
                }) {
                    HStack {
                        if purchaseManager.purchaseState == .inProgress {
                            ProgressView()
                                .scaleEffect(0.8)
                                .tint(Color(red: 60/255, green: 60/255, blue: 60/255))
                            Text("處理中...")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 60/255, green: 60/255, blue: 60/255))
                        } else {
                            Text(selectedOption == .monthly ? "我要升級" : "免費試用")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color(red: 60/255, green: 60/255, blue: 60/255))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(Color(red: 170/255, green: 255/255, blue: 80/255))
                    .cornerRadius(40)
                    .padding(.horizontal, 72)
                }
                .disabled(purchaseManager.purchaseState == .inProgress || purchaseManager.products.isEmpty)
                .opacity(purchaseManager.purchaseState == .inProgress || purchaseManager.products.isEmpty ? 0.7 : 1.0)
                .padding(.bottom, 40)
                
                HStack(spacing: 16) {
                    Button(action: {
                        if let url = URL(string: "https://www.notion.so/2313fc7b7fd780bea796fea0540e9b86?source=copy_link") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("服務條款")
                    }
                    .buttonStyle(PlainButtonStyle())

                    Text("|")

                    Button(action: {
                        if let url = URL(string: "https://www.notion.so/2313fc7b7fd78096b154d8a249f98d22?source=copy_link") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("隱私權")
                    }
                    .buttonStyle(PlainButtonStyle())

                    Text("|")

                    Button(action: {
                        restorePurchases()
                    }) {
                        Text("回覆購買")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(purchaseManager.purchaseState == .inProgress)
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
                .padding(.bottom, 24)
            }
            
            // 載入遮罩（如果需要全屏遮罩）
            if purchaseManager.purchaseState == .inProgress {
                Color.black.opacity(0.3)
                    .ignoresSafeArea(.all)
                    .onTapGesture { } // 防止點擊穿透
            }
        }
        .alert("購買成功！", isPresented: .constant(purchaseManager.purchaseState == .completed)) {
            Button("太棒了！") {
                dismiss()
            }
        } message: {
            Text("恭喜您成為進階會員！現在可以無限制提問了。")
        }
        .alert("錯誤", isPresented: .constant(purchaseManager.errorMessage != nil)) {
            Button("確定") {
                purchaseManager.errorMessage = nil
            }
        } message: {
            Text(purchaseManager.errorMessage ?? "")
        }
        .alert("恢復購買成功", isPresented: .constant(purchaseManager.purchaseState == .restored)) {
            Button("確定") {
                dismiss()
            }
        } message: {
            Text("您的會員資格已恢復！")
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("PurchaseCompleted"))) { _ in
            appState.upgradeToPremium()
        }
    }
    
    // MARK: - 購買邏輯
    func purchaseMonthly() {
        print("👉 開始每月訂閱流程")
        guard let product = purchaseManager.getProduct(for: "com.nonlimit.premium_monthly") else {
            print("❌ 找不到月付產品")
            return
        }
        
        Task {
            await purchaseManager.purchase(product)
        }
    }

    func purchaseLifetime() {
        print("👉 開始永久購買流程")
        guard let product = purchaseManager.getProduct(for: "com.nonlimit.premium_lifetime") else {
            print("❌ 找不到永久產品")
            return
        }
        
        Task {
            await purchaseManager.purchase(product)
        }
    }
    
    func restorePurchases() {
        print("👉 開始恢復購買")
        Task {
            await purchaseManager.restorePurchases()
        }
    }
}

#Preview {
    UpgradeView()
        .environmentObject(AppState())
}
