//
//  AppStorage+Extensions.swift
//  Nonlimit
//
//  Created by Code Review
//

import Foundation

// MARK: - App Storage Keys
enum AppStorageKey {
    static let hasSeenSplash = "hasSeenSplash"
    static let displayName = "displayName"
    static let dailyQuestionCount = "dailyQuestionCount"
    static let lastResetDate = "lastResetDate"
    static let isPremiumUser = "isPremiumUser"
}

// MARK: - UserDefaults Extension
extension UserDefaults {
    // 便利的存取方法，避免字串散落各處
    
    var hasSeenSplash: Bool {
        get { bool(forKey: AppStorageKey.hasSeenSplash) }
        set { set(newValue, forKey: AppStorageKey.hasSeenSplash) }
    }
    
    var displayName: String {
        get { string(forKey: AppStorageKey.displayName) ?? "🐦" }
        set { set(newValue, forKey: AppStorageKey.displayName) }
    }
    
    var dailyQuestionCount: Int {
        get { integer(forKey: AppStorageKey.dailyQuestionCount) }
        set { set(newValue, forKey: AppStorageKey.dailyQuestionCount) }
    }
    
    var lastResetDate: Date? {
        get { object(forKey: AppStorageKey.lastResetDate) as? Date }
        set { set(newValue, forKey: AppStorageKey.lastResetDate) }
    }
    
    var isPremiumUser: Bool {
        get { bool(forKey: AppStorageKey.isPremiumUser) }
        set { set(newValue, forKey: AppStorageKey.isPremiumUser) }
    }
}
