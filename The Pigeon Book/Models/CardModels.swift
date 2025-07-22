//
//  CardModels.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI

// MARK: - Supporting Models
struct CardSelectionInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let color: Color
    let cardType: CardType
    let detailIcon: String
}

// MARK: - Day Info Model
struct DayInfo: Identifiable {
    let id = UUID()
    let date: Date
    let lunarData: LunarCalendarData
}
