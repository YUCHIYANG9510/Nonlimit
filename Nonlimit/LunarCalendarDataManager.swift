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
        
        // 一月資料
        "01-01": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜出行、納財",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "一元復始",
            idiomDescription: "天地之氣在新的一年又回到起點重新運轉。借指新的一年開始。",
            idiomImageName: "day001"
        ),
        
        "01-02": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌開市、動土",
            idiom: "萬象更新",
            idiomDescription: "宇宙間一切景象都煥然一新。多用來形容新年新氣象。",
            idiomImageName: "day002"
        ),
        
        "01-03": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜會友、納采",
            unsuitableActivities: "忌造屋、破土",
            idiom: "愛莫能助",
            idiomDescription: "指內心雖然同情，想要幫助卻無能為力。語本《詩經．大雅．烝民》。",
            idiomImageName: "day003"
        ),
        
        "01-04": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜祈福、修造",
            unsuitableActivities: "忌出行、開倉",
            idiom: "草莓蛋糕",
            idiomDescription: "適合冬天食用的甜點，吃了可以帶來幸福與快樂。",
            idiomImageName: "day004"
        ),
        
        "01-05": LunarCalendarData(
            lunarTerm: "小寒",
            suitableActivities: "宜開光、捕捉",
            unsuitableActivities: "忌開倉、蓋屋",
            idiom: "芝麻開門",
            idiomDescription: "是阿拉伯故事《一千零一夜》中《阿里巴巴與四十大盜》中的魔法咒語，這句咒語可以打開四十大盜的藏寶山洞。",
            idiomImageName: "day005"
        ),
        
        "01-06": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜裁衣、開市",
            unsuitableActivities: "忌栽種、嫁娶",
            idiom: "無邊無際",
            idiomDescription: "形容非常廣闊，沒有邊界，沒有盡頭，沒有極限。",
            idiomImageName: "day006"
        ),
        
        "01-07": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜立碑、交易",
            unsuitableActivities: "忌掘井、入宅",
            idiom: "落井下石",
            idiomDescription: "比喻乘人危難時，加以陷害。語本唐．韓愈〈柳子厚墓誌銘〉。",
            idiomImageName: "day007"
        ),
        
        "01-08": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜解除、掃舍",
            unsuitableActivities: "忌季月紅紗",
            idiom: "一帆風順",
            idiomDescription: "比喻旅程或事情進行得非常順利，沒有阻礙，就像一艘船揚起帆後順風前進。",
            idiomImageName: "day008"
        ),
        
        "01-09": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜掛匾、安床",
            unsuitableActivities: "忌出行、置產",
            idiom: "一無是處",
            idiomDescription: "沒有一點正確或值得肯定的地方。",
            idiomImageName: "day009"
        ),
        
        "01-10": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜開池、納財",
            unsuitableActivities: "忌修造、探病",
            idiom: "飲水思源",
            idiomDescription: "喝水的時候要想到水的來源。比喻不忘本，常懷感恩之心。",
            idiomImageName: "day010"
        ),
        
        "01-11": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜解除",
            unsuitableActivities: "忌齋醮、牧養",
            idiom: "灰飛煙滅",
            idiomDescription: "像灰、煙般的消逝。比喻完全消失殆盡。",
            idiomImageName: "day011"
        ),
        
        "01-12": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜會友、認養",
            unsuitableActivities: "忌栽種、出行",
            idiom: "潸然淚下",
            idiomDescription: "眼淚自然地流下來。形容因感動、悲傷或某種強烈情緒而流淚。",
            idiomImageName: "day012"
        ),
        
        "01-13": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜移徙、求嗣",
            unsuitableActivities: "忌掘井、安葬",
            idiom: "橫衝直撞",
            idiomDescription: "形容人或動物不顧一切地亂衝亂撞，動作魯莽、毫無顧忌。",
            idiomImageName: "day013"
        ),
        
        "01-14": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌月破",
            idiom: "高枕無憂",
            idiomDescription: "形容人生活安定、內心毫無憂慮，能安心入睡。",
            idiomImageName: "day014"
        ),
        
        "01-15": LunarCalendarData(
            lunarTerm: "尾牙",
            suitableActivities: "宜嫁娶、啟鑽",
            unsuitableActivities: "忌安床、伐木",
            idiom: "愛與和平",
            idiomDescription: "希望世界與人心都能溫暖、和諧、安定的願景。",
            idiomImageName: "day015"
        ),
        
        "01-16": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜祭祀、立碑",
            unsuitableActivities: "忌受死",
            idiom: "杯水車薪",
            idiomDescription: "一杯水澆救不了車上燃燒的柴薪，比喻力量太小救不了急",
            idiomImageName: "day016"
        ),
        
        "01-17": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌入宅、安香",
            idiom: "一望無際",
            idiomDescription: "一眼望去看不著邊際。形容寬廣、遼闊。",
            idiomImageName: "day017"
        ),
        
        "01-18": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜移徙、開光",
            unsuitableActivities: "忌造廟、理髮",
            idiom: "晶瑩剔透",
            idiomDescription: "形容光亮透明的樣子。",
            idiomImageName: "day018"
        ),
        
        "01-19": LunarCalendarData(
            lunarTerm: "廿十",
            suitableActivities: "宜交易、立券",
            unsuitableActivities: "忌置產、動土",
            idiom: "如夢似幻",
            idiomDescription: "像是作夢幻想般。比喻極不真實的。",
            idiomImageName: "day019"
        ),
        
        "01-20": LunarCalendarData(
            lunarTerm: "大寒",
            suitableActivities: "宜祭祀、針灸",
            unsuitableActivities: "忌季月紅紗",
            idiom: "能躺不坐",
            idiomDescription: "能坐就不站，能躺就不坐",
            idiomImageName: "day020"
        ),
        
        "01-21": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜沐浴、起基",
            unsuitableActivities: "忌入宅、謝土",
            idiom: "互踢皮球",
            idiomDescription: "比喻互相推卸責任。",
            idiomImageName: "day021"
        ),
        
        "01-22": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜開池、牧養",
            unsuitableActivities: "忌上樑、修造",
            idiom: "相親相愛",
            idiomDescription: "形容人與人之間的良好關係，例如家人、朋友、同學之間。",
            idiomImageName: "day022"
        ),
        
        "01-23": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜解除",
            unsuitableActivities: "忌移徙、針灸",
            idiom: "滴水穿石",
            idiomDescription: "比喻有志者事竟成，只要努力不懈就能夠成功。",
            idiomImageName: "day023"
        ),
        
        "01-24": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜拆卸、動土",
            unsuitableActivities: "忌出貨、安葬",
            idiom: "井底之蛙",
            idiomDescription: "住在井底的青蛙，比喻見識淺陋的人。",
            idiomImageName: "day024"
        ),
        
        "01-25": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜納采、訂盟",
            unsuitableActivities: "忌伐木、蓋屋",
            idiom: "登峰造極",
            idiomDescription: "比喻到達最高峰或最高點，也形容學問、技能等達到精通的最高境界。",
            idiomImageName: "day025"
        ),
        
        "01-26": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜祭祀、破屋",
            unsuitableActivities: "忌月破",
            idiom: "年年有餘",
            idiomDescription: "每年都有盈餘，生活富足，不虞匱乏。",
            idiomImageName: "day026"
        ),
        
        "01-27": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜嫁娶、納采",
            unsuitableActivities: "忌祈福、造廟",
            idiom: "人模狗樣",
            idiomDescription: "譏諷人的舉止和身分不相稱。",
            idiomImageName: "day027"
        ),
        
        "01-28": LunarCalendarData(
            lunarTerm: "除夕",
            suitableActivities: "宜齋醮、啟鑽",
            unsuitableActivities: "忌受死",
            idiom: "海綿寶寶",
            idiomDescription: "是一個無知、神經質、不成熟、活潑、快樂的角色，且會不惜一切完成任務。",
            idiomImageName: "day028"
        ),
        
        "01-29": LunarCalendarData(
            lunarTerm: "春節",
            suitableActivities: "宜祭祀、畋獵",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "一擲千金",
            idiomDescription: "形容不吝惜錢財，任意揮霍，花費大量金錢。",
            idiomImageName: "day029"
        ),
        
        "01-30": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜會友、入學",
            unsuitableActivities: "忌合帳、入宅",
            idiom: "說走就走",
            idiomDescription: "當一個人有了想法或計畫，不需要太多準備或考慮，立即就付諸行動，立刻開始進行。",
            idiomImageName: "day030"
        ),
        
        "01-31": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜交易、問名",
            unsuitableActivities: "忌置產、開光",
            idiom: "不為所動",
            idiomDescription: "心意已定，不被更動。",
            idiomImageName: "day031"
        ),
        
         // 二月資料
         
        "02-01": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜祭祀、馴畜",
            unsuitableActivities: "忌季月紅紗",
            idiom: "隨波逐流",
            idiomDescription: "順著水流而行。比喻人沒有確定的方向和目標，只依從環境潮流行事。",
            idiomImageName: "day032"
        ),

        "02-02": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜修造、認養",
            unsuitableActivities: "忌四離",
            idiom: "樂極生悲",
            idiomDescription: "歡樂到了極點，往往會轉生悲哀。",
            idiomImageName: "day033"
        ),

        "02-03": LunarCalendarData(
            lunarTerm: "立春",
            suitableActivities: "宜安床、會友",
            unsuitableActivities: "忌掘井",
            idiom: "惺惺相惜",
            idiomDescription: "聰明才智相當的人彼此敬慕、愛惜。",
            idiomImageName: "day034"
        ),

        "02-04": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜塑繪、針灸",
            unsuitableActivities: "忌入宅、出火",
            idiom: "如火如荼",
            idiomDescription: "指像火那樣紅、像荼那樣白。形容事物的興盛或氣氛的熱烈。",
            idiomImageName: "day035"
        ),

        "02-05": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜作灶、解除",
            unsuitableActivities: "忌栽種、出行",
            idiom: "樹大招風",
            idiomDescription: "比喻一個人名聲太大或地位太高，容易招致別人的嫉妒、批評或陷害。",
            idiomImageName: "day036"
        ),

        "02-06": LunarCalendarData(
            lunarTerm: "天公生",
            suitableActivities: "宜解除、沐浴",
            unsuitableActivities: "忌入宅、安香",
            idiom: "飛向宇宙",
            idiomDescription: "來自玩具總動員的經典台詞，也說出了許多人對前進太空的未來嚮往。",
            idiomImageName: "day037"
        ),

        "02-07": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜嫁娶、出行",
            unsuitableActivities: "忌開市、理髮",
            idiom: "浩瀚無垠",
            idiomDescription: "形容水勢或地域廣大遼闊，沒有邊際。",
            idiomImageName: "day038"
        ),

        "02-08": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜祭祀、掃舍",
            unsuitableActivities: "忌月破",
            idiom: "一飛沖天",
            idiomDescription: "比喻人一下子成名或事業上升很快。",
            idiomImageName: "day039"
        ),

        "02-09": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜出行、掛匾",
            unsuitableActivities: "忌嫁娶、作灶",
            idiom: "愛屋及烏",
            idiomDescription: "比喻愛一個人而連帶地關心與他有關的人或物。",
            idiomImageName: "day040"
        ),

        "02-10": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜結網、除服",
            unsuitableActivities: "忌受死",
            idiom: "吃藥了沒",
            idiomDescription: "貼心提醒：記得定期服用藥物，以保身體健康。",
            idiomImageName: "day041"
        ),

        "02-11": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜移徙、雇用",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "入不敷出",
            idiomDescription: "指收入不夠開支，形容非常貧窮。出自清代曹雪芹的《紅樓夢》第107回。",
            idiomImageName: "day041"
        ),
        
        "02-12": LunarCalendarData(
            lunarTerm: "元宵節",
            suitableActivities: "宜開光、祈福",
            unsuitableActivities: "忌入宅、伐木",
            idiom: "用愛發電",
            idiomDescription: "指無償為自己喜歡的事物作貢獻。",
            idiomImageName: "day041"
        ),
        
        // 五月資料

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
        "05-27": LunarCalendarData(
            lunarTerm: "五月",
            suitableActivities: "宜認養、動土",
            unsuitableActivities: "忌伐木、祭祀",
            idiom: "不堪一擊",
            idiomDescription: "比喻脆弱，禁不起任何的攻擊或打擊。",
            idiomImageName: "day147"
        ),
        
        "05-28": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜破土、修造",
            unsuitableActivities: "忌理髮、嫁娶",
            idiom: "大手一揮",
            idiomDescription: "形容一個人揮霍無度，揮一揮手就把金錢揮出去，散盡家財。",
            idiomImageName: "day148"
        ),
        
        "05-29": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜移徙、栽種",
            unsuitableActivities: "忌開市、立券",
            idiom: "乘風破浪",
            idiomDescription: "比喻人志向遠大，不畏艱難，奮勇前進。",
            idiomImageName: "day149"
        ),
        
        "05-30": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜沐浴、破屋",
            unsuitableActivities: "忌月破、百事忌",
            idiom: "一顆蘋果",
            idiomDescription: "An apple a day keeps the doctor away，又譯作「每日一蘋果，醫生遠離我」，是一句提倡進食蘋果有益健康的諺語。",
            idiomImageName: "day150"
        ),
        
        "05-31": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜解除、祈福",
            unsuitableActivities: "忌作灶、開市",
            idiom: "心花怒放",
            idiomDescription: "形容人心情非常高興、快樂，就像花朵盛開一樣。",
            idiomImageName: "day151"
        ),
        
        // 六月資料
        "06-01": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜種植、認養",
            unsuitableActivities: "忌裁衣、入宅",
            idiom: "心如止水",
            idiomDescription: "心志不為外物所動，如靜止不流動的水。",
            idiomImageName: "day152"
        ),
        
        "06-02": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜祭祀、捕捉",
            unsuitableActivities: "忌探病、嫁娶",
            idiom: "畫蛇添足",
            idiomDescription: "做多餘的事，反而壞事。",
            idiomImageName: "day153"
        ),
        
        // 七月資料
        "07-01": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜修造、移徙",
            unsuitableActivities: "忌安葬、生墳",
            idiom: "七步成詩",
            idiomDescription: "形容有才氣，文思敏捷。",
            idiomImageName: "day182"
        ),
        
        "07-02": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜沐浴、安葬",
            unsuitableActivities: "忌嫁娶、動土",
            idiom: "坐立不安",
            idiomDescription: "指是一個人情緒不安，坐也不是，站也不是。",
            idiomImageName: "day183"
        ),
        
        "07-03": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜理髮、祭祀",
            unsuitableActivities: "忌修造、出行",
            idiom: "披星戴月",
            idiomDescription: "在星光與月光下奔波，形容辛勤勞動或旅途辛苦。",
            idiomImageName: "day184"
        ),
        
        "07-04": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜移徙、出行",
            unsuitableActivities: "忌開光、蓋屋",
            idiom: "一刻千金",
            idiomDescription: "極短暫的時間，卻有著千金的價值。形容時間極其寶貴。",
            idiomImageName: "day185"
        ),
        
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
