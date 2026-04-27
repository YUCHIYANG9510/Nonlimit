//
//  ColorPalette.swift
//  Nonlimit
//
//  Created by Code Review
//

import SwiftUI

// MARK: - App Color Palette
extension Color {
    // MARK: - Primary Colors
    static let appPurple = Color(red: 141/255, green: 125/255, blue: 220/255)
    static let appPink = Color(red: 236/255, green: 116/255, blue: 236/255)
    static let appGreen = Color(red: 36/255, green: 212/255, blue: 148/255)
    static let appOrange = Color(red: 255/255, green: 151/255, blue: 77/255)
    static let appBlue = Color(red: 130/255, green: 200/255, blue: 255/255)
    
    // MARK: - Gradient Colors
    static let gradientStart = Color(red: 237/255, green: 220/255, blue: 244/255)
    static let gradientEnd = Color(red: 255/255, green: 229/255, blue: 255/255)
    
    // 便利的漸層定義
    static var appGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [gradientStart, gradientEnd]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // MARK: - Upgrade View Colors
    static let upgradeGradientStart = Color(red: 96/255, green: 103/255, blue: 204/255)
    static let upgradeGradientEnd = Color(red: 120/255, green: 84/255, blue: 216/255)
    static let upgradeAccent = Color(red: 170/255, green: 255/255, blue: 80/255)
    static let upgradeSecondary = Color(red: 236/255, green: 116/255, blue: 236/255)
    
    // MARK: - UI Elements
    static let appDivider = Color(UIColor.separator)
    static let appSecondaryBackground = Color(UIColor.secondarySystemGroupedBackground)
    
    // MARK: - Special Colors
    static let pigeonBookPrimary = Color(red: 65/255, green: 70/255, blue: 151/255)
    static let pigeonBookAccent = Color(red: 254/255, green: 129/255, blue: 248/255)
    static let resultMessageBackground = Color(red: 85/255, green: 86/255, blue: 175/255)
}

// MARK: - Card Type Colors
extension CardType {
    var primaryColor: Color {
        switch self {
        case .work: return .appPurple
        case .love: return .appPink
        case .future: return .appGreen
        case .lunch: return .appOrange
        case .drink: return .appBlue
        }
    }
}
