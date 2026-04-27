//
//  CardConfiguration.swift
//  Nonlimit
//
//  Created by Designer
//

import SwiftUI

// MARK: - Card Configuration
struct CardConfiguration {
    let cardType: CardType
    let imageName: String
    let title: String
    let color: Color
    let detailIcon: String
    
    var selectionInfo: CardSelectionInfo {
        CardSelectionInfo(
            imageName: imageName,
            title: title,
            color: color,
            cardType: cardType,
            detailIcon: detailIcon
        )
    }
    
    static let all: [CardConfiguration] = [
        CardConfiguration(
            cardType: .work,
            imageName: "work-icon",
            title: "工作",
            color: .appPurple,
            detailIcon: "briefcase.fill"
        ),
        CardConfiguration(
            cardType: .love,
            imageName: "love-icon",
            title: "愛情",
            color: .appPink,
            detailIcon: "heart.fill"
        ),
        CardConfiguration(
            cardType: .future,
            imageName: "future-icon",
            title: "未來",
            color: .appGreen,
            detailIcon: "sparkles"
        ),
        CardConfiguration(
            cardType: .lunch,
            imageName: "lunch-icon",
            title: "午餐",
            color: .appOrange,
            detailIcon: "fork.knife"
        ),
        CardConfiguration(
            cardType: .drink,
            imageName: "drink-icon",
            title: "飲料",
            color: .appBlue,
            detailIcon: "cup.and.saucer.fill"
        )
    ]
}
