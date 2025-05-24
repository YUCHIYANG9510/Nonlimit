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
        "01-01": LunarCalendarData(
            lunarTerm: "初一",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌開市、動土",
            idiom: "萬象更新",
            idiomDescription: "宇宙間一切景象都煥然一新。多用來形容新年新氣象。",
            idiomImageName: "day001"
        ),
        
        "01-02": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜出行、納財",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "吉星高照",
            idiomDescription: "吉祥的星宿高高照臨。比喻運氣好，得到幸運。",
            idiomImageName: "day002"
        ),
        
        "01-03": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜會友、納采",
            unsuitableActivities: "忌造屋、破土",
            idiom: "三陽開泰",
            idiomDescription: "《易經》稱爻連的為陽卦，斷的為陰卦，正月為泰卦，三陽生於下；冬去春來，陰消陽長，有吉亨之象。常用以稱頌歲首或寓意吉祥。",
            idiomImageName: "day003"
        ),
        
        "01-04": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜祈福、修造",
            unsuitableActivities: "忌出行、開倉",
            idiom: "四季平安",
            idiomDescription: "一年四季都平平安安。常用作祝福語。",
            idiomImageName: "day004"
        ),
        
        "01-05": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜開市、納財",
            unsuitableActivities: "忌嫁娶、移徙",
            idiom: "五福臨門",
            idiomDescription: "指長壽、富貴、康寧、好德、善終五種福氣同時降臨。",
            idiomImageName: "day005"
        ),
        
        "01-06": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜沐浴、理髮",
            unsuitableActivities: "忌祭祀、安床",
            idiom: "六六大順",
            idiomDescription: "祝願事事順利的吉祥話。六在中國傳統文化中是吉祥數字。",
            idiomImageName: "day006"
        ),
        
        "01-07": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜會友、宴會",
            unsuitableActivities: "忌動土、栽種",
            idiom: "七星高照",
            idiomDescription: "北斗七星高高照耀，比喻運氣好，前程光明。",
            idiomImageName: "day007"
        ),
        
        "01-08": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜祈福、開光",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "八面玲瓏",
            idiomDescription: "原指窗戶明亮軒敞。後用來形容人處世圓滑，待人接物面面俱到。",
            idiomImageName: "day008"
        ),
        
        "01-09": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜出行、交易",
            unsuitableActivities: "忌破土、動工",
            idiom: "九九歸一",
            idiomDescription: "歸根結底。指事物發展的最終結果。",
            idiomImageName: "day009"
        ),
        
        "01-10": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜納財、開倉",
            unsuitableActivities: "忌安葬、修墳",
            idiom: "十全十美",
            idiomDescription: "各方面都非常完美，毫無缺陷。",
            idiomImageName: "day010"
        ),
        
        "01-11": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜修造、裝修",
            unsuitableActivities: "忌嫁娶、出行",
            idiom: "一帆風順",
            idiomDescription: "船掛滿帆，順風行駛。比喻非常順利，沒有任何阻礙。",
            idiomImageName: "day011"
        ),
        
        "01-12": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜祭祀、上樑",
            unsuitableActivities: "忌開市、立券",
            idiom: "一心一意",
            idiomDescription: "只有一個心眼兒，沒有別的考慮。",
            idiomImageName: "day012"
        ),
        
        "01-13": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜沐浴、掃舍",
            unsuitableActivities: "忌動土、造廟",
            idiom: "一鳴驚人",
            idiomDescription: "一叫就使人震驚。比喻平時沒有突出的表現，一下子做出驚人的成績。",
            idiomImageName: "day013"
        ),
        
        "01-14": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜會友、納采",
            unsuitableActivities: "忌嫁娶、安床",
            idiom: "一步登天",
            idiomDescription: "一步跨上青天。比喻一下子就達到很高的境界或程度。有時也用來比喻人突然得志，爬上高位。",
            idiomImageName: "day014"
        ),
        
        "01-15": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜祈福、賞燈",
            unsuitableActivities: "忌破土、掘井",
            idiom: "月圓人團圓",
            idiomDescription: "月亮圓滿，人也團圓。寓意闔家團聚，美滿幸福。",
            idiomImageName: "day015"
        ),
        
        "01-16": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜出行、開市",
            unsuitableActivities: "忌安葬、修墳",
            idiom: "一日千里",
            idiomDescription: "一天能走一千里。形容速度驚人。",
            idiomImageName: "day016"
        ),
        
        "01-17": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜納財、交易",
            unsuitableActivities: "忌嫁娶、移徙",
            idiom: "一見如故",
            idiomDescription: "初次見面就象老朋友一樣合得來。",
            idiomImageName: "day017"
        ),
        
        "01-18": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜修造、安門",
            unsuitableActivities: "忌祭祀、開光",
            idiom: "一片丹心",
            idiomDescription: "一片赤誠的心。形容心地純正忠誠。",
            idiomImageName: "day018"
        ),
        
        "01-19": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜祈福、沐浴",
            unsuitableActivities: "忌動土、造屋",
            idiom: "一往無前",
            idiomDescription: "一直往前，無所阻擋。形容勇猛無畏地前進。",
            idiomImageName: "day019"
        ),
        
        "01-20": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜會友、宴會",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "二十不惑",
            idiomDescription: "年輕時就有明確的人生方向，不迷惑。",
            idiomImageName: "day020"
        ),
        
        "01-21": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜出行、納采",
            unsuitableActivities: "忌安葬、破土",
            idiom: "一諾千金",
            idiomDescription: "許下的一個諾言有千金的價值。比喻說話算數，極有信用。",
            idiomImageName: "day021"
        ),
        
        "01-22": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜開市、立券",
            unsuitableActivities: "忌祭祀、修墳",
            idiom: "一舉兩得",
            idiomDescription: "做一件事得到兩方面的好處。",
            idiomImageName: "day022"
        ),
        
        "01-23": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜祈福、謝土",
            unsuitableActivities: "忌嫁娶、移徙",
            idiom: "一氣呵成",
            idiomDescription: "一口氣做成。形容文章結構緊湊，文氣連貫。也比喻做一件事安排緊湊，迅速不間斷地完成。",
            idiomImageName: "day023"
        ),
        
        "01-24": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜沐浴、理髮",
            unsuitableActivities: "忌動土、造廟",
            idiom: "一馬當先",
            idiomDescription: "原指作戰時策馬衝鋒在前。形容領先。也比喻工作走在群眾前面，積極帶頭。",
            idiomImageName: "day024"
        ),
        
        "01-25": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜會友、交易",
            unsuitableActivities: "忌安床、開倉",
            idiom: "一蹴而就",
            idiomDescription: "蹴：踏；就：成功。踏一步就成功。比喻事情輕而易舉，一下子就成功。",
            idiomImageName: "day025"
        ),
        
        "01-26": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜修造、上樑",
            unsuitableActivities: "忌嫁娶、出行",
            idiom: "一石二鳥",
            idiomDescription: "扔一顆石子打到兩隻鳥。比喻做一件事情得到兩種好處。",
            idiomImageName: "day026"
        ),
        
        "01-27": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜祭祀、開光",
            unsuitableActivities: "忌破土、掘井",
            idiom: "一絲不苟",
            idiomDescription: "苟：苟且，馬虎。指做事認真細緻，一點兒不馬虎。",
            idiomImageName: "day027"
        ),
        
        "01-28": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜納財、開市",
            unsuitableActivities: "忌安葬、修墳",
            idiom: "一生一世",
            idiomDescription: "一輩子。",
            idiomImageName: "day028"
        ),
        
        "01-29": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜出行、會友",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "一朝千里",
            idiomDescription: "比喻才能得到發揮，地位提升很快。",
            idiomImageName: "day029"
        ),
        
        "01-30": LunarCalendarData(
            lunarTerm: "三十",
            suitableActivities: "宜祈福、除舊",
            unsuitableActivities: "忌動土、造屋",
            idiom: "除舊布新",
            idiomDescription: "清除舊的，建立新的。以新的代替舊的。",
            idiomImageName: "day030"
        ),
        
        "01-31": LunarCalendarData(
            lunarTerm: "卅一",
            suitableActivities: "宜沐浴、掃除",
            unsuitableActivities: "忌開市、立券",
            idiom: "歲月如流",
            idiomDescription: "時光如流水般逝去。形容時間過得很快。",
            idiomImageName: "day031"
        ),
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
