//
//  CardType.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/24.
//

import SwiftUI

enum CardType: CaseIterable {
    case work
    case love
    case future
    case lunch
    
    var animationName: String {
        switch self {
        case .work: return "work-result.json"
        case .love: return "love-result.json"
        case .future: return "future-result.json"
        case .lunch: return "lunch-result.json"
        }
    }
    
    var messages: [String] {
        switch self {
        case .work:
            return [
                "要記得打卡",
                "領完年終再走",
                "先跑就對了！",
                "該下班了",
                "不是你的問題",
                "相信你的直覺",
                "這裡不是你該待的地方",
                "不可能",
                "放棄吧"
            ]
        case .love:
            return [
                "感情的問題一律建議分手",
                "單身比和錯的人在一起更好",
                "愛真的需要勇氣",
                "去問你媽",
                "下一個會更好",
                "顯而易見",
                "當然",
                "怎麼可能",
                "相信你的直覺"
            ]
        case .future:
            return [
                "一切都是過程",
                "別怕未來，你可能撐不到那麼遠",
                "態度決定你的高度",
                "好好休息",
                "沒有比較就沒有傷害",
                "人生的意義在於感受迷惘",
                "該買機票了",
                "慢慢來比較快",
                "船到橋頭自然直",
                "舊的不去新的不來",
                "專注呼吸就好",
                "放下它",
                "接受它",
                "多得是～～你不知道的事"
            ]
        case .lunch:
            return [
                "拉麵 🍜",
                "披薩 🍕",
                "火鍋 🍲",
                "水餃 🥟",
                "咖哩飯 🍛",
                "三明治 🥪",
                "義大利麵 🍝",
                "漢堡薯條 🍟",
                "壽司 🍱"
            ]
        }
    }
}
