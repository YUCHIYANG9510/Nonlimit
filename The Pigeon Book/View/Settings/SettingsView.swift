//
//  SettingsView.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI

// MARK: - Settings View
struct SettingsView: View {
    @Binding var displayName: String
    @Environment(\.dismiss) var dismiss
    @State private var tempDisplayName: String = ""
    @State private var showIconPicker = false
    @State private var showUpgradeSheet = false // 恢復 sheet 狀態
    @EnvironmentObject var appState: AppState
    @State private var showSubscriptionStatus = false

    var body: some View {
        NavigationView {
            ZStack {
                
                VStack(spacing: 0) {
                    // Header
                    Text("設定")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.accentColor)
                    .padding(.top, 24)
                    .padding(.bottom, 24)
                    
                    // Join Pro Section
                    VStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 237/255, green: 220/255, blue: 244/255),
                                        Color(red: 255/255, green: 229/255, blue: 255/255)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(height: 100)
                            .overlay(
                                HStack(spacing: 12) {
                                    Image(appState.isPremiumUser ? "premium" : "pro-icon")
                                        .resizable()
                                        .frame(width: 44, height: 44)

                                    
                                    HStack(spacing: 24) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            if appState.isPremiumUser {
                                                Text("您是 PRO 會員")
                                                    .font(.system(size: 18, weight: .bold))
                                                    .foregroundColor(.accentColor)

                                                Text("感謝您的支持！")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.accentColor.opacity(0.7))
                                            } else {
                                                Text("加入專屬會員")
                                                    .font(.system(size: 18, weight: .semibold))
                                                    .foregroundColor(.accentColor)

                                                Text("訂閱解鎖更多功能")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.accentColor.opacity(0.7))
                                            }
                                        }

                                        Button(action: {
                                            
                                            let generator = UIImpactFeedbackGenerator(style: .light)
                                                generator.impactOccurred()
                                            
                                            if appState.isPremiumUser {
                                                showSubscriptionStatus = true
                                            } else {
                                                showUpgradeSheet = true
                                            }
                                        }) {
                                            Text(appState.isPremiumUser ? "查看" : "升級")
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 24)
                                                .padding(.vertical, 10)
                                                .background(Color(red: 141/255, green: 125/255, blue: 220/255))
                                                .clipShape(Capsule())
                                        }
                                    }
                                }
                            )
                            .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 40)
                    
                    // Settings Options
                    VStack(spacing: 20) {
                        // Display Name Setting
                        HStack {
                            Text("顯示名稱")
                                .font(.system(size: 18))
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            ZStack(alignment: .trailing) {
                                if tempDisplayName.isEmpty {
                                    Text("輸入你的名字")
                                        .font(.system(size: 18))
                                        .foregroundColor(.accentColor.opacity(0.4))
                                        .padding(.trailing, 4)
                                }
                                TextField("", text: $tempDisplayName)
                                    .font(.system(size: 18))
                                    .foregroundColor(.accentColor.opacity(0.7))
                                    .multilineTextAlignment(.trailing)
                                    .onSubmit {
                                        displayName = tempDisplayName
                                        UserDefaults.standard.set(displayName, forKey: "displayName")
                                    }
                            }
                        }
                        .padding(.horizontal, 30)
                        
                        // Divider
                        Rectangle()
                            .fill(Color.accentColor.opacity(0.2))
                            .frame(height: 1)
                            .padding(.horizontal, 30)
                        
                        // Change Icon Setting
                        Button(action: {
                            
                            let generator = UIImpactFeedbackGenerator(style: .light)
                                generator.impactOccurred()
                            
                            showIconPicker = true
                        }) {
                            HStack {
                                Text("更換圖示")
                                    .font(.system(size: 18))
                                    .foregroundColor(.accentColor)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 16))
                                    .foregroundColor(.accentColor.opacity(0.5))
                            }
                            .padding(.horizontal, 30)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            tempDisplayName = UserDefaults.standard.string(forKey: "displayName") ?? displayName
        }
        .onDisappear {
                    // 當設定頁面關閉時也要更新 displayName 並存入 UserDefaults
                    displayName = tempDisplayName
                    UserDefaults.standard.set(displayName, forKey: "displayName")
                }
        .sheet(isPresented: $showIconPicker) {
            IconPickerView()
                .presentationDetents([.fraction(0.7)])
            .presentationCornerRadius(40)
        }
        .sheet(isPresented: $showUpgradeSheet) {
            UpgradeView()
                .presentationDetents([.large])
                .presentationCornerRadius(40)
        }
        .sheet(isPresented: $showSubscriptionStatus) {
            SubscriptionStatusView()
                .presentationDetents([.large])
                .presentationCornerRadius(40)
        }

    }
}

// MARK: - Icon Picker View
struct IconPickerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var pendingIcon: AppIcon? = nil

    // 取得目前 App Icon
    private var currentIcon: AppIcon {
        if let currentName = UIApplication.shared.alternateIconName {
            return AppIcon.allCases.first(where: { $0.rawValue == currentName }) ?? .default
        } else {
            return .default
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Change icon")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 24)

                    ForEach(AppIcon.allCases, id: \.rawValue) { icon in
                        Button(action: {
                            
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()
                            
                            pendingIcon = icon
                            UIApplication.shared.setAlternateIconName(icon.iconValue) { error in
                                if error == nil {
                                    // 略微延遲後關閉畫面（等系統 alert 結束）
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        dismiss()
                                    }
                                }
                            }
                        }) {
                            HStack(spacing: 16) {
                                Image(icon.previewImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(12)

                                Text(icon.rawValue)
                                    .font(.body)
                                    .foregroundColor(.primary)

                                Spacer()

                                if currentIcon == icon {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.accentColor)
                                        .font(.system(size: 24))
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.black.opacity(0.3))
                                        .font(.system(size: 24))
                                }
                            }
                            .padding(.vertical, 24)
                            .padding(.horizontal, 24)
                            .background(Color(red: 247/255, green: 247/255, blue: 247/255))
                            .cornerRadius(24)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                    }

                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

enum AppIcon: String, CaseIterable {
    case `default` = "Default"
    case pink = "Pink"
    case lightpink = "Light-Pink"
    case simpleblack = "Simple-Black"
    case deadblack = "Dead-Black"
    
    var iconValue: String? {
        switch self {
        case .default:
            return nil // 系統預設值用 nil
        default:
            return rawValue
        }
    }
    
    var previewImage: String {
        switch self {
        case .default:
            return "icon_default"
        case .pink:
            return "Pink"
        case .lightpink:
            return "Light-Pink"
        case .simpleblack:
            return "Simple-Black"
        case .deadblack:
            return "Dead-Black"
        }
    }
}
