//
//  PreferenceKeys.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//


import SwiftUI

// 用於追蹤滾動位置的 PreferenceKey
struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
