//
//  LunarCalendarDataManager.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/24.
//

import Foundation

// MARK: - Lunar Calendar Data Model
struct LunarCalendarData {
    let lunarTerm: String
    let suitableActivities: String
    let unsuitableActivities: String
    let idiom: String
    let idiomDescription: String
    let idiomImageName: String
}

// MARK: - Lunar Calendar Data Manager
class LunarCalendarDataManager {
    static let shared = LunarCalendarDataManager()
    
    private init() {} // 確保單例模式
    
    private let calendarData: [String: LunarCalendarData] = [
        // 使用 "MM-dd" 格式作為 key，方便查詢
        "05-22": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜出行、會友",
            unsuitableActivities: "忌造廟、掘井",
            idiom: "勢在必行",
            idiomDescription: "形容迫於情勢，非做不可。",
            idiomImageName: "day142"
        ),
        
        "05-23": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜出行、會友",
            unsuitableActivities: "忌造廟、掘井",
            idiom: "勢在必行",
            idiomDescription: "形容迫於情勢，非做不可。",
            idiomImageName: "day143"
        ),
        
        "05-24": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜出行、會友",
            unsuitableActivities: "忌造廟、掘井",
            idiom: "一事無成",
            idiomDescription: "一件事也沒做成。指事業毫無成就。語出唐·白居易《除夜寄微之》詩。",
            idiomImageName: "day144"
        ),
        "05-25": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜祈福、納財",
            unsuitableActivities: "忌蓋屋、安葬",
            idiom: "鬼鬼祟祟",
            idiomDescription: "形容行事不光明，偷偷摸摸的樣子。",
            idiomImageName: "day145"
        ),
        "05-26": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜開市、立券",
            unsuitableActivities: "忌動土、修造",
            idiom: "一天三杯",
            idiomDescription: "指一天至少需要喝三杯手搖飲料，才有益於身心健康，專家建議早中晚各來一杯。",
            idiomImageName: "day146"
        ),

        
        // 六月資料
        "06-01": LunarCalendarData(
            lunarTerm: "芒種",
            suitableActivities: "宜種植、收穫",
            unsuitableActivities: "忌搬家、動土",
            idiom: "豐收在望",
            idiomDescription: "預期會有好的收成。比喻事業或學業即將獲得成功。",
            idiomImageName: "day152"
        ),
        
        // 七月資料
        "07-01": LunarCalendarData(
            lunarTerm: "小暑",
            suitableActivities: "宜靜心、讀書",
            unsuitableActivities: "忌躁動、爭執",
            idiom: "心靜自然涼",
            idiomDescription: "心境平靜，自然感覺涼爽。比喻心靜則身安，煩躁則增熱。",
            idiomImageName: "day182"
        )
    ]
    
    // 預設資料，當找不到特定日期資料時使用
    private let defaultData = LunarCalendarData(
        lunarTerm: "節氣",
        suitableActivities: "宜平常心",
        unsuitableActivities: "忌急躁",
        idiom: "平安如意",
        idiomDescription: "平平安安，事事如意。表達對美好生活的期望。",
        idiomImageName: "day144"
    )
    
    // MARK: - Public Methods
    
    /// 根據日期獲取農曆資料
    /// - Parameter date: 要查詢的日期
    /// - Returns: 對應的農曆資料，如果找不到則返回預設資料
    func getData(for date: Date) -> LunarCalendarData {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        let dateKey = formatter.string(from: date)
        
        return calendarData[dateKey] ?? defaultData
    }
    
    /// 檢查特定日期是否有資料
    /// - Parameter date: 要檢查的日期
    /// - Returns: 是否有該日期的資料
    func hasData(for date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        let dateKey = formatter.string(from: date)
        
        return calendarData[dateKey] != nil
    }
    
    /// 獲取所有已設定資料的日期
    /// - Returns: 所有有資料的日期字串陣列 (MM-dd 格式)
    func getAllAvailableDates() -> [String] {
        return Array(calendarData.keys).sorted()
    }
}
