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
        
        "01-01": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜出行、納財",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "一元復始",
            idiomDescription: "天地之氣在新的一年又回到起點重新運轉。借指新的一年開始。",
            idiomImageName: "day001"
        ),

        "01-02": LunarCalendarData(
            lunarTerm: "初三",
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
            idiomDescription: "一杯水澆救不了車上燃燒的柴薪，比喻力量太小救不了急。",
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
            idiomDescription: "能坐就不站，能躺就不坐。",
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
            idiomImageName: "day042"
        ),

        "02-12": LunarCalendarData(
            lunarTerm: "元宵節",
            suitableActivities: "宜開光、祈福",
            unsuitableActivities: "忌入宅、伐木",
            idiom: "用愛發電",
            idiomDescription: "指無償為自己喜歡的事物作貢獻。",
            idiomImageName: "day043"
        ),

        "02-13": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜祭祀、合帳",
            unsuitableActivities: "忌出火、入宅",
            idiom: "自掏腰包",
            idiomDescription: "由自己付錢。",
            idiomImageName: "day044"
        ),

        "02-14": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜伐木、作樑",
            unsuitableActivities: "忌納畜、牧養",
            idiom: "若有若無",
            idiomDescription: "指的是好像有又好像沒有，形容模糊不清、不明顯的樣子，",
            idiomImageName: "day045"
        ),

        "02-15": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌入宅、安香",
            idiom: "奇奇怪怪",
            idiomDescription: "奇異，出乎意料、不合常理。",
            idiomImageName: "day046"
        ),

        "02-16": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜會友、安床",
            unsuitableActivities: "忌入宅、作灶",
            idiom: "大吉大利",
            idiomDescription: "非常吉祥、順利，一切都很好。",
            idiomImageName: "day047"
        ),

        "02-17": LunarCalendarData(
            lunarTerm: "廿十",
            suitableActivities: "無",
            unsuitableActivities: "忌行喪、牧養",
            idiom: "南柯一夢",
            idiomDescription: "形容人生如夢，也形容一場空歡喜。",
            idiomImageName: "day048"
        ),

        "02-18": LunarCalendarData(
            lunarTerm: "雨水",
            suitableActivities: "宜納采、訂盟",
            unsuitableActivities: "忌開光、蓋屋",
            idiom: "光陰似箭",
            idiomDescription: "形容時間消逝如飛箭般迅速。",
            idiomImageName: "day049"
        ),

        "02-19": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜動土、嫁娶",
            unsuitableActivities: "忌開示、入宅",
            idiom: "飛鴿傳書",
            idiomDescription: "古代因缺少專門的郵差，所以只有利用飛鴿來幫人們傳遞消息。",
            idiomImageName: "day050"
        ),

        "02-20": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜求醫、破屋",
            unsuitableActivities: "忌正四廢",
            idiom: "湖光山色",
            idiomDescription: "形容湖的波光和山的景色，泛指美好的自然風光。",
            idiomImageName: "day051"
        ),

        "02-21": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜沐浴、合木",
            unsuitableActivities: "忌正四廢",
            idiom: "奇蹟誕生",
            idiomDescription: "表示一件非比尋常、極為珍貴且難以想像的事情出現了。",
            idiomImageName: "day052"
        ),

        "02-22": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜祭祀、結網",
            unsuitableActivities: "忌受死",
            idiom: "殺雞取卵",
            idiomDescription: "把雞殺了，取出腹中的蛋。比喻為貪圖眼前的好處而斷絕了長遠的利益。",
            idiomImageName: "day053"
        ),

        "02-23": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜理髮、栽種",
            unsuitableActivities: "忌嫁娶、伐木",
            idiom: "異星入境",
            idiomDescription: "是一部 2016 年上映的美國科幻電影，探討人類本質與語言奧秘。",
            idiomImageName: "day054"
        ),

        "02-24": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜嫁娶、祈福",
            unsuitableActivities: "忌入宅、安葬",
            idiom: "曲高和寡",
            idiomDescription: "曲調愈高雅，跟著唱和的人就愈少。比喻無法引起大眾的共鳴。",
            idiomImageName: "day055"
        ),

        "02-25": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜謝土、成服",
            unsuitableActivities: "忌栽種、針灸",
            idiom: "鬼斧神工",
            idiomDescription: "像是鬼神製作出來的。形容技藝精巧，達到鬼神靈妙的境界。",
            idiomImageName: "day056"
        ),

        "02-26": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜開光、解除",
            unsuitableActivities: "忌入宅、出行",
            idiom: "馬首是瞻",
            idiomDescription: "指士兵依據主將的馬頭來決定前進的方向，比喻服從指揮或跟隨他人進退。",
            idiomImageName: "day057"
        ),

        "02-27": LunarCalendarData(
            lunarTerm: "卅",
            suitableActivities: "宜動土、起基",
            unsuitableActivities: "忌移徙、出火",
            idiom: "麵包超人",
            idiomDescription: "臉由紅豆麵包做成，是一位又剛強又善良的正義英雄。",
            idiomImageName: "day058"
        ),

        "02-28": LunarCalendarData(
            lunarTerm: "二月",
            suitableActivities: "宜冠笄、會友",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "白色恐怖",
            idiomDescription: "你是忘記了，還是害怕想起來？",
            idiomImageName: "day059"
        ),

        "03-01": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜作灶、解除",
            unsuitableActivities: "忌祭祀、祈福",
            idiom: "無肉不歡",
            idiomDescription: "每一餐都一定要吃到肉，因為得了一 種沒有吃到肉會死的病。",
            idiomImageName: "day060"
        ),

        "03-02": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜嫁娶、置產",
            unsuitableActivities: "忌經絡、探病",
            idiom: "屍速列車",
            idiomDescription: "是一部於2016年上映的韓國災難電影，探討了人性在極端情況下的表現。",
            idiomImageName: "day061"
        ),

        "03-03": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜出行、動土",
            unsuitableActivities: "忌開市、入宅",
            idiom: "雞生蛋？",
            idiomDescription: "蛋源自於母雞的卵巢深處。",
            idiomImageName: "day062"
        ),

        "03-04": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜沐浴、理髮",
            unsuitableActivities: "忌月破",
            idiom: "蛋生雞？",
            idiomDescription: "蛋又是雞的來源。指事情的發生是循環不斷，互相依賴的，沒有明確的起點或終點。",
            idiomImageName: "day063"
        ),

        "03-05": LunarCalendarData(
            lunarTerm: "驚蟄",
            suitableActivities: "宜破屋、求醫",
            unsuitableActivities: "忌月破",
            idiom: "不堪負荷",
            idiomDescription: "無法承受、負擔。",
            idiomImageName: "day064"
        ),

        "03-06": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜訂盟、納采",
            unsuitableActivities: "忌開光、出貨",
            idiom: "守株待兔",
            idiomDescription: "指拘泥守成，不知變通，或妄想不勞而獲。",
            idiomImageName: "day065"
        ),

        "03-07": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜塑繪、拆卸",
            unsuitableActivities: "忌伐木、栽種",
            idiom: "神奇海螺",
            idiomDescription: "是《海綿寶寶》第42集中出現的一種玩具。當有人對某件事情感到疑惑時，可以拉動神奇海螺的繩子，它會隨機播放一段預錄好的聲音來回答問題。",
            idiomImageName: "day066"
        ),

        "03-08": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜裁衣、納財",
            unsuitableActivities: "忌作灶、開市",
            idiom: "冰美式 a-a",
            idiomDescription: "將濃縮咖啡加入冰塊和冷水調製而成，保留了咖啡的苦味和香氣，同時帶有清涼感，適合在炎熱的天氣飲用。",
            idiomImageName: "day067"
        ),

        "03-09": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜修造、入學",
            unsuitableActivities: "忌安葬、蓋屋",
            idiom: "好吃懶做",
            idiomDescription: "愛吃又懶得勞動。",
            idiomImageName: "day068"
        ),

        "03-10": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜訂盟、納采",
            unsuitableActivities: "忌入宅、安香",
            idiom: "瑪利歐",
            idiomDescription: "是一位義大利裔美國人，職業是水管工，性格外向、自信且富有正義感。",
            idiomImageName: "day069"
        ),

        "03-11": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜出行、安床",
            unsuitableActivities: "忌動土、入宅",
            idiom: "沒齒難忘",
            idiomDescription: "指永遠難以忘記。",
            idiomImageName: "day070"
        ),

        "03-12": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜塞穴",
            unsuitableActivities: "忌受死",
            idiom: "歸心似箭",
            idiomDescription: "形容想回家的心情非常急切，就像射出的箭一樣快。",
            idiomImageName: "day071"
        ),

        "03-13": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜開光、合帳",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "小心慢行",
            idiomDescription: "用以警告車輛駕駛人前面路況變遷，應減速慢行。",
            idiomImageName: "day072"
        ),

        "03-14": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜祭祀、安葬",
            unsuitableActivities: "忌真滅沒",
            idiom: "冷若冰霜",
            idiomDescription: "形容態度極為冷淡。",
            idiomImageName: "day073"
        ),

        "03-15": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜會友、放水",
            unsuitableActivities: "忌伐木、作樑",
            idiom: "阿里山茶",
            idiomDescription: "在台灣嘉義縣阿里山茶區所產的茶葉，以其獨特的清香、甘醇的滋味和豐富的香氣而聞名，是台灣頂級高山茶的代表之一。",
            idiomImageName: "day074"
        ),

        "03-16": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜入學、赴任",
            unsuitableActivities: "忌入宅、安門",
            idiom: "情非得已",
            idiomDescription: "指在當時的情況下，不得不如此做。",
            idiomImageName: "day075"
        ),

        "03-17": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜祭祀、破屋",
            unsuitableActivities: "忌月破",
            idiom: "風和日麗",
            idiomDescription: "微風和煦，陽光明媚，形容天氣晴朗，適合戶外活動。",
            idiomImageName: "day076"
        ),

        "03-18": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜交易、認養",
            unsuitableActivities: "忌開光、安葬",
            idiom: "安心豚",
            idiomDescription: "台糖旗下的一個豬肉品牌，以其嚴格的品質控管和產銷履歷著稱。",
            idiomImageName: "day077"
        ),

        "03-19": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜開市、掛匾",
            unsuitableActivities: "忌四離",
            idiom: "十年樹木",
            idiomDescription: "栽植樹木需要十年。",
            idiomImageName: "day078"
        ),

        "03-20": LunarCalendarData(
            lunarTerm: "春分",
            suitableActivities: "宜理髮、冠笄",
            unsuitableActivities: "忌置產、伐木",
            idiom: "百年樹人",
            idiomDescription: "培養人才需要百年。比喻培養人才非常不易或培育人才是長久之計。",
            idiomImageName: "day079"
        ),

        "03-21": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜求嗣、移徙",
            unsuitableActivities: "忌合帳、開市",
            idiom: "順手牽羊",
            idiomDescription: "趁機會就下手拿東西。喻偷竊的行為。",
            idiomImageName: "day080"
        ),

        "03-22": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜安床、伐木",
            unsuitableActivities: "忌嫁娶、開光",
            idiom: "苟且偷生",
            idiomDescription: "得過且過，勉強地活下去，形容不顧一切只求暫時活命，缺乏長遠規劃和擔當。",
            idiomImageName: "day081"
        ),

        "03-23": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜祭祀、出行",
            unsuitableActivities: "忌祈福、動土",
            idiom: "天使下凡",
            idiomDescription: "比喻某人或某事物的出現帶來了希望、美好或改變，如同天使帶來光明。",
            idiomImageName: "day082"
        ),

        "03-24": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜塞穴、捕捉",
            unsuitableActivities: "忌受死",
            idiom: "即刻救援",
            idiomDescription: "2008年的法國動作驚悚電影，講述一位前特種部隊探員的女兒在巴黎遭綁架，他必須在極短時間內靠著自己的情報技能將其救出的故事。",
            idiomImageName: "day083"
        ),

        "03-25": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜納財、蓋屋",
            unsuitableActivities: "忌動土、破土",
            idiom: "非禮勿言",
            idiomDescription: "不符合禮儀規範的話，就不要說。",
            idiomImageName: "day084"
        ),

        "03-26": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌開倉、出貨",
            idiom: "機密文件",
            idiomDescription: "指的是重要且必須保密的公文、書信等。",
            idiomImageName: "day085"
        ),

        "03-27": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌動土、伐木",
            idiom: "普天同慶",
            idiomDescription: "指全天下的人共同慶祝。",
            idiomImageName: "day086"
        ),

        "03-28": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜出行、解除",
            unsuitableActivities: "忌真滅沒",
            idiom: "三色糰子",
            idiomDescription: "是日本的一種傳統和菓子，通常由粉色、白色和綠色三種顏色的糰子組成。",
            idiomImageName: "day087"
        ),

        "03-29": LunarCalendarData(
            lunarTerm: "三月",
            suitableActivities: "宜破屋、求醫",
            unsuitableActivities: "忌月破",
            idiom: "樂不思蜀",
            idiomDescription: "快樂到一點也不想回去蜀國。比喻人因留戀異地而不想返回故鄉，或形容快樂得忘了歸去。",
            idiomImageName: "day088"
        ),

        "03-30": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜納采、交易",
            unsuitableActivities: "忌嫁娶、開光",
            idiom: "一文不值",
            idiomDescription: "形容事物或人毫無用處、價值。",
            idiomImageName: "day089"
        ),

        "03-31": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜沐浴、理髮",
            unsuitableActivities: "忌定磉、合木",
            idiom: "阿婆鐵蛋",
            idiomDescription: "因為過於忙碌無意間將蛋滷得太久，沒想到硬硬的滷蛋讓許多客人吃了之後都讚不絕口…",
            idiomImageName: "day090"
        ),

        "04-01": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜祈福、納財",
            unsuitableActivities: "忌安葬、入學",
            idiom: "大智若愚",
            idiomDescription: "表面上看起來很愚笨，實際上卻是大智大慧的人。",
            idiomImageName: "day091"
        ),

        "04-02": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜嫁娶、訂盟",
            unsuitableActivities: "忌開示、交易",
            idiom: "四通八達",
            idiomDescription: "形容交通非常便利。",
            idiomImageName: "day092"
        ),

        "04-03": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜立券、交易",
            unsuitableActivities: "忌祈福、入宅",
            idiom: "花花世界",
            idiomDescription: "形容繁華熱鬧的景象，通常指都市或人世間的繁華熱鬧景象。",
            idiomImageName: "day093"
        ),

        "04-04": LunarCalendarData(
            lunarTerm: "清明",
            suitableActivities: "宜會友、出行",
            unsuitableActivities: "忌動土、起基",
            idiom: "兒童快樂",
            idiomDescription: "祝願孩子們在兒童節這天，都能開心、快樂地度過。",
            idiomImageName: "day094"
        ),

        "04-05": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜出行、立券",
            unsuitableActivities: "忌安床、上官",
            idiom: "慎終追遠",
            idiomDescription: "謹慎地辦理父母的喪事，虔誠地追念遠代的祖先。",
            idiomImageName: "day095"
        ),

        "04-06": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌嫁娶、納財",
            idiom: "無所事事",
            idiomDescription: "什麼事也不做，形容閒蕩無事的樣子。",
            idiomImageName: "day096"
        ),

        "04-07": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜出行、開市",
            unsuitableActivities: "忌謝土、祈福",
            idiom: "睡前頌缽",
            idiomDescription: "每天睡前進行10-15分鐘的頌缽練習，能有效安撫心靈，為入睡做好準備。",
            idiomImageName: "day097"
        ),

        "04-08": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜祭祀、破土",
            unsuitableActivities: "忌出貨、求財",
            idiom: "畫蛇添足",
            idiomDescription: "比喻多此一舉，反而把事情弄糟。",
            idiomImageName: "day098"
        ),

        "04-09": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌認養、出行",
            idiom: "見錢眼開",
            idiomDescription: "形容人貪婪愛財，唯利是圖。",
            idiomImageName: "day099"
        ),

        "04-10": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌動土、開市",
            idiom: "只給香蕉",
            idiomDescription: "只請得到猴子。比喻了低薪酬和不理想的工作環境會導致人才流失，或是無法吸引到好的人才。",
            idiomImageName: "day100"
        ),

        "04-11": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜祭祀、求醫治病",
            unsuitableActivities: "忌月破",
            idiom: "猴子是偶",
            idiomDescription: "形容薪水很低，或者工作很辛苦、收入卻很少的情況。",
            idiomImageName: "day101"
        ),

        "04-12": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "諸事不宜",
            unsuitableActivities: "忌受死",
            idiom: "一舉成名",
            idiomDescription: "舊指一次科舉便及第成名。 今泛稱做成一件事就因此聲名遠播。",
            idiomImageName: "day102"
        ),

        "04-13": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌交易、牧養",
            idiom: "非禮勿視",
            idiomDescription: "不合乎禮的要求，就不要去看。",
            idiomImageName: "day103"
        ),

        "04-14": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜解除、破屋",
            unsuitableActivities: "忌季月紅紗",
            idiom: "否極泰來",
            idiomDescription: "指逆境達到極點，就會向順境轉化，比喻厄運到了盡頭，好運就會來臨。",
            idiomImageName: "day104"
        ),

        "04-15": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜安床、出行",
            unsuitableActivities: "忌祭祀、安葬",
            idiom: "地獄使者",
            idiomDescription: "在宗教或文學作品中，受命將靈魂帶往地獄的使者或生物。",
            idiomImageName: "day105"
        ),

        "04-16": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜祭祀、立券",
            unsuitableActivities: "忌掘井、探病",
            idiom: "心有餘悸",
            idiomDescription: "形容危險不安的事情雖然已經過去，但回想起來心裡仍緊張、害怕。",
            idiomImageName: "day106"
        ),

        "04-17": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜祭祀、出行",
            unsuitableActivities: "忌開光、伐木",
            idiom: "老當益壯",
            idiomDescription: "比喻年紀大了，身體卻更加強壯，精神更加飽滿。",
            idiomImageName: "day107"
        ),

        "04-18": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌安葬、蓋屋",
            idiom: "覆水難收",
            idiomDescription: "已經潑出去的水很難收回。比喻離異的夫妻很難再復合。",
            idiomImageName: "day108"
        ),

        "04-19": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜沐浴、出行",
            unsuitableActivities: "忌出火、置產",
            idiom: "回頭是岸",
            idiomDescription: "比喻做錯事的人，只要真心悔改，就有出路。",
            idiomImageName: "day109"
        ),

        "04-20": LunarCalendarData(
            lunarTerm: "穀雨",
            suitableActivities: "宜祭祀、安灶",
            unsuitableActivities: "忌安床、治病",
            idiom: "天外奇蹟",
            idiomDescription: "是一部2009年的皮克斯動畫電影，講述卡爾老爺爺和童子軍小羅，兩人一場驚險又感人的冒險故事。",
            idiomImageName: "day110"
        ),

        "04-21": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌齋醮、開光",
            idiom: "粒粒皆辛苦",
            idiomDescription: "每一粒米飯都是農民辛苦勞動的成果，勸誡人們要珍惜糧食，不要浪費。",
            idiomImageName: "day111"
        ),

        "04-22": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌動土、破土",
            idiom: "不速之客",
            idiomDescription: "不經邀請，自己出現的客人。",
            idiomImageName: "day112"
        ),

        "04-23": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "一命嗚呼",
            idiomDescription: "即死了，謔稱人的死亡。",
            idiomImageName: "day113"
        ),

        "04-24": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜沐浴、掃捨",
            unsuitableActivities: "忌祈福、安葬",
            idiom: "飽讀詩書",
            idiomDescription: "讀過很多書，很有學問。",
            idiomImageName: "day114"
        ),

        "04-25": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌納採、問名",
            idiom: "鞠躬盡瘁",
            idiomDescription: "不辭勞苦，不懼艱鉅，對於國事盡忠盡力，毫不懈怠。",
            idiomImageName: "day115"
        ),

        "04-26": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜祭祀、修門",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "如履薄冰",
            idiomDescription: "比喻行事非常謹慎小心，生怕稍有不慎就會發生危險。",
            idiomImageName: "day116"
        ),

        "04-27": LunarCalendarData(
            lunarTerm: "三十",
            suitableActivities: "宜出行、交車",
            unsuitableActivities: "忌祭祀、入殮",
            idiom: "皮卡皮卡",
            idiomDescription: "皮卡丘是一種電屬性寶可夢，外形像一隻小老鼠，有著黃色的毛皮、紅色的臉頰、棕色的背紋和一條閃電狀的尾巴。",
            idiomImageName: "day117"
        ),

        "04-28": LunarCalendarData(
            lunarTerm: "四月",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌入宅、作竈",
            idiom: "盲人摸象",
            idiomDescription: "比喻對事物只憑片面的認識，就妄下判斷，以致以偏概全，無法了解事情的全貌。",
            idiomImageName: "day118"
        ),

        "04-29": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜祭祀、餘事勿取",
            unsuitableActivities: "忌開光、修造",
            idiom: "貓空纜車",
            idiomDescription: "位於臺北市文山區的一條觀光纜車，全長4.03公里，於2007年7月4日啟用，由臺北捷運公司營運。",
            idiomImageName: "day119"
        ),

        "04-30": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜移徙、入宅",
            unsuitableActivities: "忌納採、出行",
            idiom: "求神拜佛",
            idiomDescription: "向神佛祈禱保祐。",
            idiomImageName: "day120"
        ),

        "05-01": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜祭祀、塑繪",
            unsuitableActivities: "忌祈福、入宅",
            idiom: "為五斗米折腰",
            idiomDescription: "願為微薄的俸祿而卑躬屈膝、諂媚奉承。",
            idiomImageName: "day121"
        ),

        "05-02": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜祭祀、作竈",
            unsuitableActivities: "忌安床、入宅",
            idiom: "黃金烏龍拿鐵",
            idiomDescription: "它結合了烏龍茶的茶香和奶香，口感順滑。",
            idiomImageName: "day122"
        ),

        "05-03": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌移徙、入宅",
            idiom: "一刀兩斷",
            idiomDescription: "比喻斷絕關係。",
            idiomImageName: "day123"
        ),

        "05-04": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜出行、起基",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "大雨滂沱",
            idiomDescription: "形容雨勢盛大。《三國演義》第二八回：「行了數日，忽值大雨滂沱，行裝盡溼。」",
            idiomImageName: "day124"
        ),

        "05-05": LunarCalendarData(
            lunarTerm: "立夏",
            suitableActivities: "宜開光、出行",
            unsuitableActivities: "忌入宅、伐木",
            idiom: "虎虎生風",
            idiomDescription: "形容雄壯威武，氣勢非凡。",
            idiomImageName: "day125"
        ),

        "05-06": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜解除、破屋",
            unsuitableActivities: "忌諸事不宜",
            idiom: "落葉歸根",
            idiomDescription: "比喻長期居住在外，終究要回返家園。",
            idiomImageName: "day126"
        ),

        "05-07": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜安門、修造",
            unsuitableActivities: "忌安葬、行船",
            idiom: "當心動物",
            idiomDescription: "用以促使車輛駕駛人注意慢行。",
            idiomImageName: "day127"
        ),

        "05-08": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌入宅、移徙",
            idiom: "小心火燭",
            idiomDescription: "提醒大家要注意用火安全，防止發生火災。",
            idiomImageName: "day128"
        ),

        "05-09": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜結網、解除",
            unsuitableActivities: "忌諸事不宜",
            idiom: "飲鴆止渴",
            idiomDescription: "比喻只求解決眼前困難，而不顧將來更大的禍患。",
            idiomImageName: "day129"
        ),

        "05-10": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌納畜、入宅",
            idiom: "狐朋狗友",
            idiomDescription: "比喻相互勾結，為非作惡的人。",
            idiomImageName: "day130"
        ),

        "05-11": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜修造、動土",
            unsuitableActivities: "忌開光、掘井",
            idiom: "風流可愛",
            idiomDescription: "形容人具有一種瀟灑、不拘小節，又帶有魅力和討人喜歡的氣質。",
            idiomImageName: "day131"
        ),

        "05-12": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜解除、掃捨",
            unsuitableActivities: "忌諸事不宜",
            idiom: "偷天換日",
            idiomDescription: "比喻騙局之大與技巧之妙。",
            idiomImageName: "day132"
        ),

        "05-13": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜立券、掛匾",
            unsuitableActivities: "忌嫁娶、安床",
            idiom: "任勞任怨",
            idiomDescription: "形容人做事熱心負責，不辭勞苦，不怕嫌怨。",
            idiomImageName: "day133"
        ),

        "05-14": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜開市、會友",
            unsuitableActivities: "忌塞穴、上梁",
            idiom: "靈光一閃",
            idiomDescription: "靈機一動，突發的想法。",
            idiomImageName: "day134"
        ),

        "05-15": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜掃捨、入殮",
            unsuitableActivities: "忌嫁娶、移徙",
            idiom: "冰山一角",
            idiomDescription: "比喻顯露出來的只是事物的一小部分，還有更多隱藏著。",
            idiomImageName: "day135"
        ),

        "05-16": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜出行、拆卸",
            unsuitableActivities: "忌安床、栽種",
            idiom: "貓有九命",
            idiomDescription: "“A cat has nine lives”，形容貓咪生命力頑強、總能化險為夷。",
            idiomImageName: "day136"
        ),

        "05-17": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜冠笄、伐木",
            unsuitableActivities: "忌出行、破土",
            idiom: "三色豆子",
            idiomDescription: "是由玉米粒（黃色）、胡蘿蔔丁（橘色）、豌豆仁（綠色）構成的蔬菜組合，常以冷凍蔬菜的形式出現。",
            idiomImageName: "day137"
        ),

        "05-18": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "招蜂引蝶",
            idiomDescription: "形容一個人因為外表漂亮、舉止吸引人，從而吸引了許多異性前來追求或關注。",
            idiomImageName: "day138"
        ),

        "05-19": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜納採、訂婚",
            unsuitableActivities: "忌開市、立券",
            idiom: "無精打采",
            idiomDescription: "指一個人缺乏精神和活力，顯得懶散、提不起勁，對周圍的事物沒有興趣或熱情。",
            idiomImageName: "day139"
        ),

        "05-20": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌掘井、入宅",
            idiom: "長風破浪",
            idiomDescription: "比喻排除萬難，奮勇前進。",
            idiomImageName: "day140"
        ),

        "05-21": LunarCalendarData(
            lunarTerm: "小滿",
            suitableActivities: "宜解除、出行",
            unsuitableActivities: "忌祭祀、伐木",
            idiom: "越俎代庖",
            idiomDescription: "比喻踰越職分，代他人做事。",
            idiomImageName: "day141"
        ),

        "05-22": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜造倉、置產",
            unsuitableActivities: "忌入宅、修造",
            idiom: "孔融讓梨",
            idiomDescription: "比喻懂得謙讓、禮讓他人，尤其是年幼者尊敬年長者。",
            idiomImageName: "day142"
        ),

        "05-23": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜畋獵、取漁",
            unsuitableActivities: "忌安床、開渠",
            idiom: "非禮勿聽",
            idiomDescription: "不符合禮制的事情不要聽。",
            idiomImageName: "day143"
        ),

        "05-24": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜塞穴、斷蟻",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "風馳電掣",
            idiomDescription: "形容速度極快，像風一樣奔跑，像閃電一樣快速掠過，出自《六韜·龍韜·王翼》。",
            idiomImageName: "day144"
        ),

        "05-25": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜納採、訂婚",
            unsuitableActivities: "忌作竈、安床",
            idiom: "振筆疾書",
            idiomDescription: "形容文思泉湧，飛快地寫字。",
            idiomImageName: "day145"
        ),

        "05-26": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜開光、納採",
            unsuitableActivities: "忌伐木、作梁",
            idiom: "木已成舟",
            idiomDescription: "木頭已經做成了船。比喻事情已成定局，沒有辦法再挽回或是不可能再改變了。",
            idiomImageName: "day146"
        ),

        "05-27": LunarCalendarData(
            lunarTerm: "五月",
            suitableActivities: "宜納採、嫁娶",
            unsuitableActivities: "忌伐木、安葬",
            idiom: "晴天霹靂",
            idiomDescription: "晴天中突然打的響雷。喻突然發生的令人震驚的事件。",
            idiomImageName: "day147"
        ),

        "05-28": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜齋醮、出行",
            unsuitableActivities: "忌作竈、嫁娶",
            idiom: "蝦兵蟹將",
            idiomDescription: "比喻未經訓練，雜湊而成的小嘍囉。",
            idiomImageName: "day148"
        ),

        "05-29": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜動土、修造",
            unsuitableActivities: "忌開市、立券",
            idiom: "布丁狗狗",
            idiomDescription: "是一隻性格呆萌、樂觀又慵懶的黃金獵犬。 他最喜歡的事情是和朋友們一起午睡、喝布丁口味的奶昔，或是窩在自己的毛線帽裡耍廢。",
            idiomImageName: "day149"
        ),

        "05-30": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜沐浴、解除",
            unsuitableActivities: "忌開光、安葬",
            idiom: "功成名就",
            idiomDescription: "事業有所成就，而且有名望。",
            idiomImageName: "day150"
        ),

        "05-31": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜訂婚、納採",
            unsuitableActivities: "忌作竈、開市",
            idiom: "種瓜得瓜",
            idiomDescription: "比喻種什麼因就得什麼果。",
            idiomImageName: "day151"
        ),

        "06-01": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌安床、上樑",
            idiom: "一天三杯",
            idiomDescription: "指一天至少需要喝三杯手搖飲料，才有益於身心健康，專家建議早中晚各來一杯。",
            idiomImageName: "day152"
        ),

        "06-02": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌探病、嫁娶",
            idiom: "三陽開泰",
            idiomDescription: "新春頌詞，表示正月新春，萬象更新。",
            idiomImageName: "day153"
        ),

        "06-03": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌入宅、安門",
            idiom: "虎背熊腰",
            idiomDescription: "形容人的體格健壯，體型魁武，背部和腰部都很寬厚有力。",
            idiomImageName: "day154"
        ),

        "06-04": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜嫁娶、冠笄",
            unsuitableActivities: "忌蓋屋、造橋",
            idiom: "十惡不赦",
            idiomDescription: "形容罪大惡極，不可饒恕。",
            idiomImageName: "day155"
        ),

        "06-05": LunarCalendarData(
            lunarTerm: "芒種",
            suitableActivities: "宜求嗣、嫁娶",
            unsuitableActivities: "忌安葬、出行",
            idiom: "鱷魚眼淚",
            idiomDescription: "形容那些虛偽、假裝悲傷的人。",
            idiomImageName: "day156"
        ),

        "06-06": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌諸事不宜",
            idiom: "殺雞儆猴",
            idiomDescription: "比喻懲罰一個人以警告其他人。",
            idiomImageName: "day157"
        ),

        "06-07": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌安葬、行喪",
            idiom: "布丁蛋糕",
            idiomDescription: "餐後甜點，其口感綿密、組織Q軟，風味獨特。",
            idiomImageName: "day158"
        ),

        "06-08": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜開光、求嗣",
            unsuitableActivities: "忌置產、安床",
            idiom: "蝸角之爭",
            idiomDescription: "比喻因細小的緣故而引起的爭端。",
            idiomImageName: "day159"
        ),

        "06-09": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜祭祀、理髮",
            unsuitableActivities: "忌出行、安門",
            idiom: "環遊世界",
            idiomDescription: "指透過旅行的方式，走遍地球上的各個角落，完成一趟繞地球一周的旅程。",
            idiomImageName: "day160"
        ),

        "06-10": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌無",
            idiom: "面面相覷",
            idiomDescription: "你看我，我看你，大家相視無言，不知所措。",
            idiomImageName: "day161"
        ),

        "06-11": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "金吉檸檬",
            idiomDescription: "能生津止渴，還能促進消化、增強免疫力，是夏日消暑和冬季潤喉的理想選擇。",
            idiomImageName: "day162"
        ),

        "06-12": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "洗心革面",
            idiomDescription: "比喻澈底悔悟，改過遷善。",
            idiomImageName: "day163"
        ),

        "06-13": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜開市、修造",
            unsuitableActivities: "忌嫁娶、造橋",
            idiom: "東京鐵塔",
            idiomDescription: "建於1958年。 高332.9公尺，是日本第二高的結構物，僅次於東京晴空塔。",
            idiomImageName: "day164"
        ),

        "06-14": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜開市、安床",
            unsuitableActivities: "忌嫁娶、出火",
            idiom: "掩耳盜鈴",
            idiomDescription: "比喻妄想瞞騙他人，結果卻只是欺騙自己而已。",
            idiomImageName: "day165"
        ),

        "06-15": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜祭祀、作灶",
            unsuitableActivities: "忌諸事不宜",
            idiom: "畫龍點睛",
            idiomDescription: "比喻繪畫、作文時在最重要之處加上一筆，使全體更加生動傳神。",
            idiomImageName: "day166"
        ),

        "06-16": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜解除、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "愚公移山",
            idiomDescription: "比喻努力不懈，終能達成目標。或比喻效率不佳。",
            idiomImageName: "day167"
        ),

        "06-17": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜修造、動土",
            unsuitableActivities: "忌嫁娶、掘井",
            idiom: "步步為營",
            idiomDescription: "形容小心謹慎，防備周全的態度或做法。",
            idiomImageName: "day168"
        ),

        "06-18": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜祭祀、教牛馬",
            unsuitableActivities: "忌齋醮、移徙",
            idiom: "查理布朗",
            idiomDescription: "在《花生漫畫》中以其善良、溫和、但經常遭遇挫折的性格而聞名。 儘管他經常失敗，但仍充滿希望和決心。",
            idiomImageName: "day169"
        ),

        "06-19": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜納采、嫁娶",
            unsuitableActivities: "忌行喪、安葬",
            idiom: "忠於職守",
            idiomDescription: "忠誠地對待自己的職業崗位。",
            idiomImageName: "day170"
        ),

        "06-20": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜嫁娶、開光",
            unsuitableActivities: "忌納采、安床",
            idiom: "勢在必行",
            idiomDescription: "迫於情勢，非做不可。",
            idiomImageName: "day171"
        ),

        "06-21": LunarCalendarData(
            lunarTerm: "夏至",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌破土、出行",
            idiom: "抹茶芒果",
            idiomDescription: "抹茶的草味與芒果的清新味道完美融合，夏至不可錯過的美食。",
            idiomImageName: "day172"
        ),

        "06-22": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜嫁娶、納採",
            unsuitableActivities: "忌掘井、破土",
            idiom: "鬼鬼祟祟",
            idiomDescription: "形容行事不光明，偷偷摸摸的樣子。",
            idiomImageName: "day173"
        ),

        "06-23": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜畋獵、捕捉",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "一事無成",
            idiomDescription: "一件事也沒做成。指事業毫無成就。語出唐·白居易《除夜寄微之》詩。",
            idiomImageName: "day174"
        ),

        "06-24": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜祭祀、破屋",
            unsuitableActivities: "忌移徙、入宅",
            idiom: "不堪一擊",
            idiomDescription: "比喻脆弱，禁不起任何的攻擊或打擊。",
            idiomImageName: "day175"
        ),

        "06-25": LunarCalendarData(
            lunarTerm: "六月",
            suitableActivities: "宜祭祀、齋醮",
            unsuitableActivities: "忌出火、入宅",
            idiom: "大手一揮",
            idiomDescription: "形容一個人揮霍無度，揮一揮手就把金錢揮出去，散盡家財。",
            idiomImageName: "day176"
        ),

        "06-26": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜開市、掛匾",
            unsuitableActivities: "忌作灶、出火",
            idiom: "乘風破浪",
            idiomDescription: "比喻人志向遠大，不畏艱難，奮勇前進。",
            idiomImageName: "day177"
        ),

        "06-27": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜祭祀、結網",
            unsuitableActivities: "忌入宅、出行",
            idiom: "一顆蘋果",
            idiomDescription: "An apple a day keeps the doctor away，又譯作「每日一蘋果，醫生遠離我」，是一句提倡進食蘋果有益健康的諺語。",
            idiomImageName: "day178"
        ),

        "06-28": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜嫁娶、納采",
            unsuitableActivities: "忌行喪、安葬",
            idiom: "心花怒放",
            idiomDescription: "形容人心情非常高興、快樂，就像花朵盛開一樣。",
            idiomImageName: "day179"
        ),

        "06-29": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜嫁娶、合帳",
            unsuitableActivities: "忌安床、祈福",
            idiom: "心如止水",
            idiomDescription: "心志不為外物所動，如靜止不流動的水。",
            idiomImageName: "day180"
        ),

        "06-30": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜出行、教牛馬",
            unsuitableActivities: "忌齋醮、造屋",
            idiom: "大藝術家",
            idiomDescription: "指在藝術領域具有卓越成就或影響力的人。",
            idiomImageName: "day181"
        ),

        "07-01": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌安葬、行喪",
            idiom: "七步成詩",
            idiomDescription: "形容有才氣，文思敏捷。",
            idiomImageName: "day182"
        ),

        "07-02": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜安機械、祭祀",
            unsuitableActivities: "忌嫁娶、安床",
            idiom: "坐立難安",
            idiomDescription: "指是一個人情緒不安，坐也不是，站也不是。",
            idiomImageName: "day183"
        ),

        "07-03": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌開市、入宅",
            idiom: "披星戴月",
            idiomDescription: "在星光與月光下奔波，形容辛勤勞動或旅途辛苦。",
            idiomImageName: "day184"
        ),

        "07-04": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜嫁娶、納采",
            unsuitableActivities: "忌開光、作竈",
            idiom: "一刻千金",
            idiomDescription: "意謂極短暫的時間，卻有著千金的價值，也就表示時間是極為寶貴，教人珍惜的。",
            idiomImageName: "day185"
        ),

        "07-05": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜納采、訂盟",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "野外求生",
            idiomDescription: "指在沒有人類居住的自然環境中，運用自然常識和可利用的資源來維持生存。",
            idiomImageName: "day186"
        ),

        "07-06": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌入宅、嫁娶",
            idiom: "駕輕就熟",
            idiomDescription: "比喻對事情很熟悉，做起來很輕鬆。",
            idiomImageName: "day187"
        ),

        "07-07": LunarCalendarData(
            lunarTerm: "小暑",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "鴉雀無聲",
            idiomDescription: "指連烏鴉和麻雀的叫聲都沒有，形容非常安靜，非常寂靜。",
            idiomImageName: "day188"
        ),

        "07-08": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜嫁娶、開光",
            unsuitableActivities: "忌伐木、祭祀",
            idiom: "危機四伏",
            idiomDescription: "任何地方都可能存在著危險，需要特別小心謹慎。",
            idiomImageName: "day189"
        ),

        "07-09": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜出行、祈福",
            unsuitableActivities: "忌無",
            idiom: "化為泡影",
            idiomDescription: "變成很快就消失的泡沫和幻影。比喻希望破滅。",
            idiomImageName: "day190"
        ),

        "07-10": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜祭祀、作竈",
            unsuitableActivities: "忌安葬、經絡",
            idiom: "如影隨形",
            idiomDescription: "比喻兩個人或兩件事物關係密切，無法分離。",
            idiomImageName: "day191"
        ),

        "07-11": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌嫁娶、出行",
            idiom: "若即若離",
            idiomDescription: "形容對人保持一定距離，彼此關係不密切。",
            idiomImageName: "day192"
        ),

        "07-12": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜破土、除服",
            unsuitableActivities: "忌無",
            idiom: "雨過天晴",
            idiomDescription: "喻經過黑暗或動亂之後轉為光明平靜。",
            idiomImageName: "day193"
        ),

        "07-13": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜祭祀、出行",
            unsuitableActivities: "忌嫁娶、作竈",
            idiom: "笑裡藏刀",
            idiomDescription: "指一個人表面上和善可親，但內心卻陰險狠毒。",
            idiomImageName: "day194"
        ),

        "07-14": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌無",
            idiom: "虎視鷹瞵",
            idiomDescription: "如猛虎、老鷹般凶狠的注視。比喻強敵環繞、窺視。",
            idiomImageName: "day195"
        ),

        "07-15": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜嫁娶、開光",
            unsuitableActivities: "忌作竈、動土",
            idiom: "焦頭爛額",
            idiomDescription: "形容非常狼狽窘迫，或事情繁瑣忙碌，不知如何是好的樣子。",
            idiomImageName: "day196"
        ),

        "07-16": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌諸事不宜",
            idiom: "願者上鉤",
            idiomDescription: "指心甘情願地接受或從事某種行為，即使可能因此而遭受損失或不利。",
            idiomImageName: "day197"
        ),

        "07-17": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜入宅、安床",
            unsuitableActivities: "忌嫁娶、栽種",
            idiom: "垃圾食物",
            idiomDescription: "高油、高鹽、高糖的食物，食用有益身心健康。",
            idiomImageName: "day198"
        ),

        "07-18": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜解除、祭祀",
            unsuitableActivities: "忌移徙、安門",
            idiom: "萬箭穿心",
            idiomDescription: "它形容內心極度痛苦，就像被萬支箭穿透心臟一樣。",
            idiomImageName: "day199"
        ),

        "07-19": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "心狠手辣",
            idiomDescription: "居心狠毒，手段殘酷。",
            idiomImageName: "day200"
        ),

        "07-20": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌入宅、移徙",
            idiom: "對牛彈琴",
            idiomDescription: "指對不懂道理的人講道理，或是不看對象的講話，比喻雙方無法溝通。",
            idiomImageName: "day201"
        ),

        "07-21": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜嫁娶、訂婚",
            unsuitableActivities: "忌掘井、伐木",
            idiom: "消磨殆盡",
            idiomDescription: "指事物逐漸減少直至完全消失，不復存在。",
            idiomImageName: "day202"
        ),

        "07-22": LunarCalendarData(
            lunarTerm: "大暑",
            suitableActivities: "宜祭祀、冠笄",
            unsuitableActivities: "忌開渠、造船",
            idiom: "光芒萬丈",
            idiomDescription: "光輝燦爛，照耀遠方。比喻氣勢雄厚。",
            idiomImageName: "day203"
        ),

        "07-23": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜冠笄、開光",
            unsuitableActivities: "忌移徙、栽種",
            idiom: "文思泉湧",
            idiomDescription: "喻行文時思路的迅速豐暢。",
            idiomImageName: "day204"
        ),

        "07-24": LunarCalendarData(
            lunarTerm: "三十",
            suitableActivities: "宜經絡、祭祀",
            unsuitableActivities: "忌開光、治病",
            idiom: "飽餐一頓",
            idiomDescription: "痛快地、盡情地吃了一頓飯。",
            idiomImageName: "day205"
        ),

        "07-25": LunarCalendarData(
            lunarTerm: "閏六月",
            suitableActivities: "宜出行、裁衣",
            unsuitableActivities: "忌移徙、入宅",
            idiom: "夜長夢多",
            idiomDescription: "比喻時間拖長了，可能發生不利的變化。",
            idiomImageName: "day206"
        ),

        "07-26": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜修造、動土",
            unsuitableActivities: "忌開市、入宅",
            idiom: "投桃報李",
            idiomDescription: "你送我桃子，我回贈李子，比喻禮尚往來、互相答謝。",
            idiomImageName: "day207"
        ),

        "07-27": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜交車、開光",
            unsuitableActivities: "忌上梁、入宅",
            idiom: "好事花生",
            idiomDescription: "好事會發生，用來表達祝福，寓意著好運、吉祥和喜事。",
            idiomImageName: "day208"
        ),

        "07-28": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜畋獵、結網",
            unsuitableActivities: "忌動土、破土",
            idiom: "鸚鵡學舌",
            idiomDescription: "比喻人沒有自己的想法，只是機械地模仿或重複別人的話，沒有自己的見解和思考。",
            idiomImageName: "day209"
        ),

        "07-29": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜納採、訂婚",
            unsuitableActivities: "忌嫁娶、作竈",
            idiom: "鑽木取火",
            idiomDescription: "上古時代以尖石鑽木，藉磨擦生熱以點燃木材生火的方法。",
            idiomImageName: "day210"
        ),

        "07-30": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜祈福、解除",
            unsuitableActivities: "忌齋醮、開市",
            idiom: "開懷暢飲",
            idiomDescription: "心情無拘無束，盡情地飲酒作樂。",
            idiomImageName: "day211"
        ),

        "07-31": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "請君入甕",
            idiomDescription: "用某人自己發明的手段或方法，來對付他自己。",
            idiomImageName: "day212"
        ),

        "08-01": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜嫁娶、破土",
            unsuitableActivities: "忌祭祀、祈福",
            idiom: "斷尾求生",
            idiomDescription: "在困境中，為了保全整體，而不得不犧牲一部分，以求生存的策略。",
            idiomImageName: "day213"
        ),

        "08-02": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜訂盟、求醫",
            unsuitableActivities: "忌入宅、開市",
            idiom: "訛言謊語",
            idiomDescription: "說謊、說假話，指捏造事實，欺騙他人。",
            idiomImageName: "day214"
        ),

        "08-03": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜納采、安香",
            unsuitableActivities: "忌安葬、破土",
            idiom: "堅不可摧",
            idiomDescription: "形容非常堅固，無法摧毀，和鑽石的堅硬特性相似。",
            idiomImageName: "day215"
        ),

        "08-04": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜沐浴、治病",
            unsuitableActivities: "忌出行、造橋",
            idiom: "指鹿為馬",
            idiomDescription: "比喻故意顛倒是非，混淆黑白，也泛指不顧事實，硬說假話。",
            idiomImageName: "day216"
        ),

        "08-05": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜祭祀、除服",
            unsuitableActivities: "忌開市、入宅",
            idiom: "煮豆燃萁",
            idiomDescription: "比喻親人、同族或同伴之間互相爭鬥、傷害，令人感到悲哀和無奈。",
            idiomImageName: "day217"
        ),

        "08-06": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜修造、出行",
            unsuitableActivities: "忌動土、掘井",
            idiom: "舉棋不定",
            idiomDescription: "比喻人在面對選擇時猶豫不決，拿不定主意。",
            idiomImageName: "day218"
        ),

        "08-07": LunarCalendarData(
            lunarTerm: "立秋",
            suitableActivities: "宜祭祀、牧養",
            unsuitableActivities: "忌破土、置產",
            idiom: "野比大雄",
            idiomDescription: "是個善解人意、心地善良的小男生，雖然做什麼事都會失敗，最擅長翻花繩。",
            idiomImageName: "day219"
        ),

        "08-08": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜沐浴、掃舍",
            unsuitableActivities: "忌會親友、出行",
            idiom: "火上加油",
            idiomDescription: "比喻使情況變得更糟糕，或使對方的怒火更大。",
            idiomImageName: "day220"
        ),

        "08-09": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜塑繪、開光",
            unsuitableActivities: "忌嫁娶、納財",
            idiom: "金枷玉鎖",
            idiomDescription: "喻既是珍寶，又是包袱。",
            idiomImageName: "day221"
        ),

        "08-10": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜沐浴、修飾垣牆",
            unsuitableActivities: "忌諸事不宜",
            idiom: "風雨無阻",
            idiomDescription: "比喻做事堅定不移，不受任何阻礙或干擾。",
            idiomImageName: "day222"
        ),

        "08-11": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜開光、出行",
            unsuitableActivities: "忌嫁娶、移徙",
            idiom: "亡羊補牢",
            idiomDescription: "喻出了問題以後，想辦法補救，免得再受損失。",
            idiomImageName: "day223"
        ),

        "08-12": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜祭祀、破土",
            unsuitableActivities: "忌諸事不宜",
            idiom: "魚躍龍門",
            idiomDescription: "比喻逆流而上，奮發向上，不畏艱難的精神。",
            idiomImageName: "day224"
        ),

        "08-13": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "目不轉睛",
            idiomDescription: "形容聚精會神注視著，連眼珠也不轉動一下。",
            idiomImageName: "day225"
        ),

        "08-14": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜祭祀、結網",
            unsuitableActivities: "忌諸事不宜",
            idiom: "怒氣沖沖",
            idiomDescription: "形容一個人情緒激動，充滿怒火。",
            idiomImageName: "day226"
        ),

        "08-15": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜伐木、動土",
            unsuitableActivities: "忌栽種、針灸",
            idiom: "一日千里",
            idiomDescription: "形容馬跑得很快，後也用來比喻進步神速或事業發展得很快。",
            idiomImageName: "day227"
        ),

        "08-16": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌動土、分居",
            idiom: "花好月圓",
            idiomDescription: "比喻人事圓滿順利或美好的景象，常用於新婚祝賀的場合。",
            idiomImageName: "day228"
        ),

        "08-17": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜嫁娶、會親友",
            unsuitableActivities: "忌蓋屋、安葬",
            idiom: "脫胎換骨",
            idiomDescription: "比喻徹底的改變，多指思想、觀念上的轉變。",
            idiomImageName: "day229"
        ),

        "08-18": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜祭祀、動土",
            unsuitableActivities: "忌開光、出行",
            idiom: "臨陣脫逃",
            idiomDescription: "指軍人臨到上陣作戰時卻逃跑了。 也比喻臨場退卻，在關鍵時刻退縮、逃避。",
            idiomImageName: "day230"
        ),

        "08-19": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜安門、納財",
            unsuitableActivities: "忌安床、動土",
            idiom: "逍遙自在",
            idiomDescription: "形容一個人無拘無束，過著輕鬆愉快的生活。",
            idiomImageName: "day231"
        ),

        "08-20": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜解除、修造",
            unsuitableActivities: "忌嫁娶、出行",
            idiom: "無能為力",
            idiomDescription: "毫無辦法。語出左傳隱公四年：「衞國褊小，老夫耄矣，無能為也。」。",
            idiomImageName: "day232"
        ),

        "08-21": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜納采、拆卸",
            unsuitableActivities: "忌伐木、行喪",
            idiom: "小熊維尼",
            idiomDescription: "主要食糧是蜂蜜，而當蜂蜜吃完以後常常立刻跑去瑞比家要蜂蜜；雖然常常因為腦袋小而提供錯誤解決辦法，不過對朋友很講義氣。",
            idiomImageName: "day233"
        ),

        "08-22": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌治病、置產",
            idiom: "孔雀開屏",
            idiomDescription: "雄性孔雀，尾有長羽，能張開成扇狀，有翠綠斑紋，非常美麗，藉以吸引異性。",
            idiomImageName: "day234"
        ),

        "08-23": LunarCalendarData(
            lunarTerm: "處暑",
            suitableActivities: "宜祈福、出行",
            unsuitableActivities: "忌開市、造船",
            idiom: "鬼門開",
            idiomDescription: "在台灣民間習俗中，這一天鬼門會打開，讓陰間的鬼魂回到陽間。人們會進行中元普渡等祭祀活動，祭拜好兄弟，祈求平安。",
            idiomImageName: "day235"
        ),

        "08-24": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜破土、安葬",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "酒肉朋友",
            idiomDescription: "那些只在有吃喝玩樂時才會出現，而無法在困境中互相扶持的朋友。",
            idiomImageName: "day236"
        ),

        "08-25": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌祈福、納采",
            idiom: "攻城掠地",
            idiomDescription: "大舉進攻敵人的城池，並占有他們的土地。",
            idiomImageName: "day237"
        ),

        "08-26": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜伐木、交易",
            unsuitableActivities: "忌動土、開池",
            idiom: "花枝招展",
            idiomDescription: "形容女子裝扮豔麗，引人注意。",
            idiomImageName: "day238"
        ),

        "08-27": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜祈福、栽種",
            unsuitableActivities: "忌入宅、掘井",
            idiom: "步步高升",
            idiomDescription: "祝賀他人升官，或是在新的一年、新的開始時，表達對他人事業發展的美好祝願。",
            idiomImageName: "day239"
        ),

        "08-28": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜裁衣、修造",
            unsuitableActivities: "忌行喪、出行",
            idiom: "戚風蛋糕",
            idiomDescription: "是一種口感輕盈、蓬鬆濕潤的蛋糕，其特色是使用植物油取代奶油，並以分蛋法打發蛋白來增加蛋糕的膨鬆度。",
            idiomImageName: "day240"
        ),

        "08-29": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜嫁娶、安床",
            unsuitableActivities: "忌入宅、蓋屋",
            idiom: "遍體鱗傷",
            idiomDescription: "形容身體受外力摧殘得很厲害。",
            idiomImageName: "day241"
        ),

        "08-30": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜出行、破土",
            unsuitableActivities: "忌嫁娶、針灸",
            idiom: "苟延殘喘",
            idiomDescription: "比喻勉強維持生命或撐住場面，也指勉強維持生存。",
            idiomImageName: "day242"
        ),

        "08-31": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜訂盟、解除",
            unsuitableActivities: "忌栽種、置產",
            idiom: "法國長棍",
            idiomDescription: "是一種經典的法式麵包，以其細長的外形、酥脆的外皮和柔軟蓬鬆的內部聞名。",
            idiomImageName: "day243"
        ),

        "09-01": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜解除、祈福",
            unsuitableActivities: "忌出火、開光",
            idiom: "鵬程萬里",
            idiomDescription: "大鵬飛行的路程數萬里。比喻前程遠大，不可限量。",
            idiomImageName: "day244"
        ),

        "09-02": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜沐浴、會友",
            unsuitableActivities: "忌開市、入宅",
            idiom: "岌岌可危",
            idiomDescription: "形容十分危險，將要傾覆或滅亡。",
            idiomImageName: "day245"
        ),

        "09-03": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜祭祀、理髮",
            unsuitableActivities: "忌嫁娶、栽種",
            idiom: "哆啦A夢",
            idiomDescription: "來自未來世界二十二世紀的機器人，為避免大雄的命運走向悲慘而來。害怕老鼠，喜歡吃銅鑼燒。",
            idiomImageName: "day246"
        ),

        "09-04": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜嫁娶、納采",
            unsuitableActivities: "忌置產、造橋",
            idiom: "斜坡滑車",
            idiomDescription: "是搭乘特別製作的滑車，由山上順坡而下的休閒運動。能充分感受滑行的速度感，相當刺激。",
            idiomImageName: "day247"
        ),

        "09-05": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜普渡、捕捉",
            unsuitableActivities: "忌開市、交易",
            idiom: "壽終正寢",
            idiomDescription: "比喻事物自然消亡，例如一個計畫、政策或制度的終結。",
            idiomImageName: "day248"
        ),

        "09-06": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜沐浴、破屋",
            unsuitableActivities: "忌齋醮、開市",
            idiom: "極樂世界",
            idiomDescription: "是一個永遠的歸宿，一個沒有痛苦，只有快樂的理想國度，是佛教徒嚮往的修行境界。",
            idiomImageName: "day249"
        ),

        "09-07": LunarCalendarData(
            lunarTerm: "白露",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "病入膏肓",
            idiomDescription: "指病情嚴重到無法救治的地步，也用來比喻事情已到無法挽回的程度。",
            idiomImageName: "day250"
        ),

        "09-08": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜出行、動土",
            unsuitableActivities: "忌無",
            idiom: "不可置信",
            idiomDescription: "很難令人相信。",
            idiomImageName: "day251"
        ),

        "09-09": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜開光、安床",
            unsuitableActivities: "忌立碑、伐木",
            idiom: "三顧茅廬",
            idiomDescription: "比喻對人才真心誠意地邀請或拜訪。",
            idiomImageName: "day252"
        ),

        "09-10": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜祭祀、理髮",
            unsuitableActivities: "忌探病、開渠",
            idiom: "狡兔三窟",
            idiomDescription: "比喻有多處藏身的地方或多種避禍的準備。",
            idiomImageName: "day253"
        ),

        "09-11": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜祭祀、立碑",
            unsuitableActivities: "忌無",
            idiom: "富士山",
            idiomDescription: "是日本一座橫跨靜岡縣和山梨縣的活火山，位於東京西南方約80公里處，主峰海拔3776公尺，",
            idiomImageName: "day254"
        ),

        "09-12": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜嫁娶、出行",
            unsuitableActivities: "忌掘井、安床",
            idiom: "玩命關頭",
            idiomDescription: "是一系列以街頭賽車、動作和家庭為主題的美國動作片。 以驚險刺激的飆車場面、精彩的動作戲和對家人朋友之間的情感描寫而聞名。",
            idiomImageName: "day255"
        ),

        "09-13": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜祭祀、出行",
            unsuitableActivities: "忌諸事不宜",
            idiom: "金盆洗手",
            idiomDescription: "指舊時江湖人物宣布退隱江湖，不再參與相關事務的儀式。象徵著決心的堅定，以此告別過去的身份和活動。",
            idiomImageName: "day256"
        ),

        "09-14": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜開光、動土",
            unsuitableActivities: "忌伐木、行喪",
            idiom: "滄海一粟",
            idiomDescription: "大海中的一粒粟米，比喻渺小，微不足道。",
            idiomImageName: "day257"
        ),

        "09-15": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌行喪、乘船",
            idiom: "飛黃騰達",
            idiomDescription: "指人得到快速的升遷，在仕途或事業上快速得志，取得成功。",
            idiomImageName: "day258"
        ),

        "09-16": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌諸事不宜",
            idiom: "龜兔賽跑",
            idiomDescription: "出自《伊索寓言》，寓意著驕傲必敗，勤奮不懈終能成功。",
            idiomImageName: "day259"
        ),

        "09-17": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜嫁娶、拆卸",
            unsuitableActivities: "忌無",
            idiom: "道德兩難",
            idiomDescription: "當人在兩種或兩種以上互相衝突價值的情況之下，面臨難以選擇的局面，當事人很難決定該採取或表現哪種行為，或該下哪種決定。",
            idiomImageName: "day260"
        ),

        "09-18": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜解除、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "無法無天",
            idiomDescription: "既沒有法律約束，也不顧及天理良知，形容人肆意妄為，毫無顧忌。",
            idiomImageName: "day261"
        ),

        "09-19": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜祭祀、治病",
            unsuitableActivities: "忌諸事不宜",
            idiom: "枕戈待旦",
            idiomDescription: "枕著武器等待天明。形容人全神戒備，絲毫不敢鬆懈。",
            idiomImageName: "day262"
        ),

        "09-20": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜入宅、安床",
            unsuitableActivities: "忌開市、造橋",
            idiom: "柚香覺醒",
            idiomDescription: "將新鮮葡萄柚汁搭配輕焙烏龍茶王307，以清爽的口感和柚子香氣聞名。",
            idiomImageName: "day263"
        ),

        "09-21": LunarCalendarData(
            lunarTerm: "卅",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌破土、出行",
            idiom: "鬼門關",
            idiomDescription: "代表鬼月已經過去，不說「再見」、「留」等字眼，別讓好兄弟以為你要把他留下來。",
            idiomImageName: "day264"
        ),

        "09-22": LunarCalendarData(
            lunarTerm: "八月",
            suitableActivities: "宜嫁娶、會友",
            unsuitableActivities: "忌開倉、伐木",
            idiom: "五體投地",
            idiomDescription: "為古印度最恭敬的致敬儀式。比喻非常欽佩對方。",
            idiomImageName: "day265"
        ),

        "09-23": LunarCalendarData(
            lunarTerm: "秋分",
            suitableActivities: "宜修墳、成服",
            unsuitableActivities: "忌開市、入宅",
            idiom: "隔岸觀火",
            idiomDescription: "比喻事不干己，袖手旁觀，漠不關心。",
            idiomImageName: "day266"
        ),

        "09-24": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜解除、架馬",
            unsuitableActivities: "忌祈福、開光",
            idiom: "揠苗助長",
            idiomDescription: "比喻強求速成，有害無益。",
            idiomImageName: "day267"
        ),

        "09-25": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌動土、置產",
            idiom: "雕蟲小技",
            idiomDescription: "比喻微不足道的技能，多指刻意雕琢詞章的技能。",
            idiomImageName: "day268"
        ),

        "09-26": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜解除、求醫",
            unsuitableActivities: "忌造廟、造船",
            idiom: "電力不足",
            idiomDescription: "指電力供應無法滿足用電需求的情況。",
            idiomImageName: "day269"
        ),

        "09-27": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜納采、訂盟",
            unsuitableActivities: "忌齋醮、嫁娶",
            idiom: "舉足輕重",
            idiomDescription: "一舉腳就會影響兩邊的輕重。形容所居地位極為重要，一舉一動皆足以影響全局。",
            idiomImageName: "day270"
        ),

        "09-28": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "春風化雨",
            idiomDescription: "比喻師長和藹親切的教導。",
            idiomImageName: "day271"
        ),

        "09-29": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜開光、祈福",
            unsuitableActivities: "忌出火、入宅",
            idiom: "阿姆斯壯",
            idiomDescription: "是第一個登上月球的人，他的名言是「這是我的一小步，卻是人類的一大步」。",
            idiomImageName: "day272"
        ),

        "09-30": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜開光、解除",
            unsuitableActivities: "忌移徙、探病",
            idiom: "絡繹不絕",
            idiomDescription: "形容事物連續不斷，沒有間斷的樣子。",
            idiomImageName: "day273"
        ),

        "10-01": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜破屋、治病",
            unsuitableActivities: "忌移徙、入宅",
            idiom: "福爾摩斯",
            idiomDescription: "是一位極其出名的偵探人物，因其卓越的推理能力而聞名。",
            idiomImageName: "day274"
        ),

        "10-02": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜祈福、放水",
            unsuitableActivities: "忌開市、開倉",
            idiom: "日出而作",
            idiomDescription: "古人的生活方式，是說太陽一出來便開始一天的工作。",
            idiomImageName: "day275"
        ),

        "10-03": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜立券、入宅",
            unsuitableActivities: "忌安葬、出行",
            idiom: "同舟共濟",
            idiomDescription: "指坐同一艘船渡河，比喻同心協力，共同戰勝困難。",
            idiomImageName: "day276"
        ),

        "10-04": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜祭祀、捕捉",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "蠟燭兩頭燒",
            idiomDescription: "形容一個人從早到晚不停工作，過度消耗體力，導致身心俱疲。",
            idiomImageName: "day277"
        ),

        "10-05": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜解除、結網",
            unsuitableActivities: "忌開市、動土",
            idiom: "煙霧彌漫",
            idiomDescription: "形容陰鬱的天氣、霧氣籠罩的景象，或是用來比喻情勢不明朗。",
            idiomImageName: "day278"
        ),

        "10-06": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜沐浴、修造",
            unsuitableActivities: "忌開市、祭祀",
            idiom: "玉兔搗藥",
            idiomDescription: "傳說中，玉兔在月宮中搗製的藥丸是「蛤蟆丸」，服用後可以成仙得道，長生不老。",
            idiomImageName: "day279"
        ),

        "10-07": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜祭祀、出行",
            unsuitableActivities: "忌入宅、修造",
            idiom: "牛肉漢堡",
            idiomDescription: "是一種將牛肉製成的扁平肉餅夾在麵包中食用的美食。 漢堡的美味取決於多個因素，包括牛肉的品質、烹飪方式、以及搭配的配料。",
            idiomImageName: "day280"
        ),

        "10-08": LunarCalendarData(
            lunarTerm: "寒露",
            suitableActivities: "宜祭祀、會友",
            unsuitableActivities: "忌動土、伐木",
            idiom: "高級貴賓",
            idiomDescription: "指地位崇高的客人。",
            idiomImageName: "day281"
        ),

        "10-09": LunarCalendarData(
            lunarTerm: "十八",
            suitableActivities: "宜祈福、開光",
            unsuitableActivities: "忌安葬、修墳",
            idiom: "如釋重負",
            idiomDescription: "形容責任已盡，身心輕鬆愉快，就像放下重擔一樣。",
            idiomImageName: "day282"
        ),

        "10-10": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌嫁娶、出行",
            idiom: "時來運轉",
            idiomDescription: "指本來處境不好，遇到好機會，從逆境轉為順境。",
            idiomImageName: "day283"
        ),

        "10-11": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜畜稠、平治道塗",
            unsuitableActivities: "忌諸事不宜",
            idiom: "自掃門前雪",
            idiomDescription: "形容人只關心自己，不關心周圍的人或事。",
            idiomImageName: "day284"
        ),

        "10-12": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜破土、除服",
            unsuitableActivities: "忌無",
            idiom: "仙人掌冰",
            idiomDescription: "是澎湖的特色冰品，以仙人掌果實的紅色汁液為主要原料，呈現出獨特的紫紅色澤。",
            idiomImageName: "day285"
        ),

        "10-13": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜祭祀、破土",
            unsuitableActivities: "忌無",
            idiom: "剖蚌求珠",
            idiomDescription: "將蚌殼剖開，取出裡面的珍珠，比喻求取賢良的人才或珍貴的物品。",
            idiomImageName: "day286"
        ),

        "10-14": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌諸事不宜",
            idiom: "響徹雲霄",
            idiomDescription: "指聲音非常響亮，好像可以穿透雲層，直達高空。",
            idiomImageName: "day287"
        ),

        "10-15": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜嫁娶、納采",
            unsuitableActivities: "忌上梁、伐木",
            idiom: "沙發衝浪",
            idiomDescription: "Couchsurfing 是一種旅行方式，指透過網絡平台，免費借住在當地人家裡，與屋主交流，體驗當地生活。",
            idiomImageName: "day288"
        ),

        "10-16": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜開光、入宅",
            unsuitableActivities: "忌置產、修墳",
            idiom: "山道猴子",
            idiomDescription: "一詞源於台灣機車文化，指的是那些在山路上飆車、追求速度與刺激的騎士，且常伴隨著改裝車輛和不守規矩的行為。",
            idiomImageName: "day289"
        ),

        "10-17": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜嫁娶、祭祀",
            unsuitableActivities: "忌安葬、開市",
            idiom: "不眠不休",
            idiomDescription: "不睡覺不休息，不停的做某事。形容十分辛勞。",
            idiomImageName: "day290"
        ),

        "10-18": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜祈福、交易",
            unsuitableActivities: "忌安床、安葬",
            idiom: "牛仔很忙",
            idiomDescription: "是周杰倫於2007年發行的同名專輯中的一首主打歌，表達了年輕一代為夢想打拼、四處奔波的忙碌狀態。",
            idiomImageName: "day291"
        ),

        "10-19": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜動土、安床",
            unsuitableActivities: "忌開光、栽種",
            idiom: "騰雲駕霧",
            idiomDescription: "指在空中飛行，也可比喻奔馳疾速。",
            idiomImageName: "day292"
        ),

        "10-20": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜出行、解除",
            unsuitableActivities: "忌伐木、行喪",
            idiom: "熟能生巧",
            idiomDescription: "只要做事熟練了，自然就能領悟到其中的巧妙方法。",
            idiomImageName: "day293"
        ),

        "10-21": LunarCalendarData(
            lunarTerm: "九月",
            suitableActivities: "宜開光、拆卸",
            unsuitableActivities: "忌安葬、破土",
            idiom: "絞盡腦汁",
            idiomDescription: "形容費盡心思，想盡辦法。",
            idiomImageName: "day294"
        ),

        "10-22": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜會友、裁衣",
            unsuitableActivities: "忌出行、動土",
            idiom: "摩西分海",
            idiomDescription: "位於澎湖縣湖西鄉北寮村，在這裡可以看見因潮汐現象所產生的分海奇觀，退潮時會在海中央出現一條蜿蜒的道路，可通往對岸的小島嶼。",
            idiomImageName: "day295"
        ),

        "10-23": LunarCalendarData(
            lunarTerm: "霜降",
            suitableActivities: "宜解除、祭祀",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "拍案叫絕",
            idiomDescription: "拍桌子叫好，形容非常讚賞或感嘆。",
            idiomImageName: "day296"
        ),

        "10-24": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜破土、安葬",
            unsuitableActivities: "忌開市、入宅",
            idiom: "一箭雙鵰",
            idiomDescription: "比喻一次舉動，可以同時達成兩個目標。",
            idiomImageName: "day297"
        ),

        "10-25": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜祈福、開光",
            unsuitableActivities: "忌入宅、伐木",
            idiom: "翻山越嶺",
            idiomDescription: "形容長途跋涉，旅途艱辛。",
            idiomImageName: "day298"
        ),

        "10-26": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜沐浴、破屋",
            unsuitableActivities: "忌嫁娶、出行",
            idiom: "撒手人寰",
            idiomDescription: "描述人去世，有時候會用在比較文雅的語境中。",
            idiomImageName: "day299"
        ),

        "10-27": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜會友、經絡",
            unsuitableActivities: "忌祈福、納采",
            idiom: "愛不釋手",
            idiomDescription: "喜歡得捨不得放下，形容非常喜愛某物，愛不忍釋。",
            idiomImageName: "day300"
        ),

        "10-28": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌探病、起基",
            idiom: "關於小熊",
            idiomDescription: "是蛋堡於 2009 年發行的經典饒舌歌曲，描寫青春愛情的遺憾與回憶。",
            idiomImageName: "day301"
        ),

        "10-29": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜祭祀、會友",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "扭轉乾坤",
            idiomDescription: "喻將現有的或不利的局勢作非常大的轉變。",
            idiomImageName: "day302"
        ),

        "10-30": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜祈福、出行",
            unsuitableActivities: "忌安門、安床",
            idiom: "隨風搖曳",
            idiomDescription: "指物體隨著風的吹拂而輕輕地擺動，多用來形容像花草、樹枝等輕柔物體在風中搖晃的景象。",
            idiomImageName: "day303"
        ),

        "10-31": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜裁衣、安床",
            unsuitableActivities: "忌開示、栽種",
            idiom: "待價而沽",
            idiomDescription: "形容商品等待買家出高價購買。",
            idiomImageName: "day304"
        ),

        "11-01": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜祭祀、出行",
            unsuitableActivities: "忌開倉、動土",
            idiom: "哈囉凱蒂",
            idiomDescription: "身高是5個蘋果高，體重是3個蘋果重。開朗活潑又非常溫柔的女孩子。興趣是弄餅乾、彈鋼琴。夢想是成為鋼琴家或詩人。",
            idiomImageName: "day305"
        ),

        "11-02": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜開光、出行",
            unsuitableActivities: "忌造廟、掘井",
            idiom: "搭順風車",
            idiomDescription: "搭乘他人車輛，順路前往目的地，通常是免費或分攤部分油費的交通方式。",
            idiomImageName: "day306"
        ),

        "11-03": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜納采、交易",
            unsuitableActivities: "忌入宅、出火",
            idiom: "過街老鼠",
            idiomDescription: "比喻那些做了壞事，被大眾厭惡和唾棄的人。",
            idiomImageName: "day307"
        ),

        "11-04": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜祭祀、平治道塗",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "任重道遠",
            idiomDescription: "指責任重大，要走的路途也漫長遙遠。",
            idiomImageName: "day308"
        ),

        "11-05": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜捕捉、畋獵",
            unsuitableActivities: "忌開市、交易",
            idiom: "命在旦夕",
            idiomDescription: "指生命危在旦夕，隨時可能死去。",
            idiomImageName: "day309"
        ),

        "11-06": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜嫁娶、訂盟",
            unsuitableActivities: "忌開市、破土",
            idiom: "木馬屠城",
            idiomDescription: "出自古希臘神話故事，特洛伊戰爭中，希臘聯軍久攻特洛伊不下，便用木馬計攻破城池。",
            idiomImageName: "day310"
        ),

        "11-07": LunarCalendarData(
            lunarTerm: "立冬",
            suitableActivities: "宜開光、動土",
            unsuitableActivities: "忌栽種、入宅",
            idiom: "初來乍到",
            idiomDescription: "剛剛來到某個地方，表示對環境、事物還不熟悉，或者還沒有適應的階段。",
            idiomImageName: "day311"
        ),

        "11-08": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜破屋、壞垣",
            unsuitableActivities: "忌諸事不宜",
            idiom: "印度咖哩",
            idiomDescription: "以濃厚的香料組合和多層次的味道著稱，常用的香料包括薑黃、孜然、香菜籽和辣椒，口味通常也較為辛辣和濃稠。",
            idiomImageName: "day312"
        ),

        "11-09": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜出行、栽種",
            unsuitableActivities: "忌探病、安葬",
            idiom: "浩劫重生",
            idiomDescription: "美國災難劇情片，內容講述聯邦快遞公司一名員工在南太平洋上空遇難墜機流浪到荒島的故事。",
            idiomImageName: "day313"
        ),

        "11-10": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜開光、會友",
            unsuitableActivities: "忌入宅、出行",
            idiom: "拱手而降",
            idiomDescription: "毫不抵抗便向對方投降。",
            idiomImageName: "day314"
        ),

        "11-11": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜沐浴、結網",
            unsuitableActivities: "忌安床、交易",
            idiom: "張冠李戴",
            idiomDescription: "喻名實不符，弄錯對象。",
            idiomImageName: "day315"
        ),

        "11-12": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜解除",
            unsuitableActivities: "忌祭祀、祈福",
            idiom: "不二法門",
            idiomDescription: "是一個佛教術語，原指到達絕對真理的方法，後引申為唯一的方法或途徑。",
            idiomImageName: "day316"
        ),

        "11-13": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜安床、破土",
            unsuitableActivities: "忌入宅、嫁娶",
            idiom: "美夢成真",
            idiomDescription: "心中的想望在現實生活中實現。",
            idiomImageName: "day317"
        ),

        "11-14": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌針灸、穿耳",
            idiom: "欲哭無淚",
            idiomDescription: "指想哭卻哭不出來，形容極度哀傷或無奈的狀態。",
            idiomImageName: "day318"
        ),

        "11-15": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜入宅、掘井",
            unsuitableActivities: "忌置產、安床",
            idiom: "星星之火",
            idiomDescription: "比喻事物微小但有發展的潛力，也指事情的開端很小，卻可能發展成巨大的局面。",
            idiomImageName: "day319"
        ),

        "11-16": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜開光、安門",
            unsuitableActivities: "忌出行、伐木",
            idiom: "青竹丹楓",
            idiomDescription: "指代南北兩地，也常用來表示朋友、家人或戀人之間的離別，因為分別後可能去往不同的地方。",
            idiomImageName: "day320"
        ),

        "11-17": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜拆卸、修造",
            unsuitableActivities: "忌祈福、謝土",
            idiom: "永垂不朽",
            idiomDescription: "永遠流傳而不可磨滅。",
            idiomImageName: "day321"
        ),

        "11-18": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌栽種、掘井",
            idiom: "眉開眼笑",
            idiomDescription: "形容非常高興和喜悅的樣子。",
            idiomImageName: "day322"
        ),

        "11-19": LunarCalendarData(
            lunarTerm: "卅",
            suitableActivities: "宜針灸、解除",
            unsuitableActivities: "忌動土、造船",
            idiom: "曇花一現",
            idiomDescription: "比喻人或事物一出現就很快消失，就像曇花開花時間很短暫一樣。",
            idiomImageName: "day323"
        ),

        "11-20": LunarCalendarData(
            lunarTerm: "十月",
            suitableActivities: "宜破屋、求醫",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "待價而沽",
            idiomDescription: "形容商品等待買家出高價購買。",
            idiomImageName: "day324"
        ),

        "11-21": LunarCalendarData(
            lunarTerm: "初二",
            suitableActivities: "宜納采、訂盟",
            unsuitableActivities: "忌開倉、蓋屋",
            idiom: "膠囊列車",
            idiomDescription: "釜山海雲台藍線公園內的一種特色觀光列車，行駛於尾浦站和青沙浦站之間，以高架方式運行，提供獨特的觀景體驗。",
            idiomImageName: "day325"
        ),

        "11-22": LunarCalendarData(
            lunarTerm: "小雪",
            suitableActivities: "宜祭祀、開光",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "棄若敝屣",
            idiomDescription: "像丟棄破鞋一樣地拋棄，比喻毫不在意或毫不珍惜。",
            idiomImageName: "day326"
        ),

        "11-23": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜沐浴、掃舍",
            unsuitableActivities: "忌嫁娶、安床",
            idiom: "飛簷走壁",
            idiomDescription: "形容身手矯健、武技高超。",
            idiomImageName: "day327"
        ),

        "11-24": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜祈福、出行",
            unsuitableActivities: "忌伐木、修造",
            idiom: "心曠神怡",
            idiomDescription: "心胸開闊，精神愉快。",
            idiomImageName: "day328"
        ),

        "11-25": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜合帳、安床",
            unsuitableActivities: "忌置產、造船",
            idiom: "冒險犯難",
            idiomDescription: "不顧一切危險，不畏一切困難的精神。",
            idiomImageName: "day329"
        ),

        "11-26": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜解除、出行",
            unsuitableActivities: "忌開市、破土",
            idiom: "阿甘精神",
            idiomDescription: "通過純粹的堅持和專注，突破先天限制，實現目標，發揮個人潛能。",
            idiomImageName: "day330"
        ),

        "11-27": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜開市、求醫",
            unsuitableActivities: "忌經絡、安床",
            idiom: "剪不斷，理還亂",
            idiomDescription: "形容問題太過複雜，無從著手整理。",
            idiomImageName: "day331"
        ),

        "11-28": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜塑繪、會友",
            unsuitableActivities: "忌祈福、入宅",
            idiom: "一掃而空",
            idiomDescription: "形容某物被完全拿走或消耗殆盡。",
            idiomImageName: "day332"
        ),

        "11-29": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜開市、交易",
            unsuitableActivities: "忌造廟、謝土",
            idiom: "溜之大吉",
            idiomDescription: "形容人為了避免麻煩、責任或不利的情況，而選擇悄悄離開，不告而別。",
            idiomImageName: "day333"
        ),

        "11-30": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜嫁娶、納采",
            unsuitableActivities: "忌置產、掘井",
            idiom: "招財貓咪",
            idiomDescription: "來自日本的吉祥物，象徵著招來財運和好運。",
            idiomImageName: "day334"
        ),

        "12-01": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜嫁娶、伐木",
            unsuitableActivities: "忌破土、安門",
            idiom: "獨占鰲頭",
            idiomDescription: "在競賽中獲得第一名。",
            idiomImageName: "day335"
        ),

        "12-02": LunarCalendarData(
            lunarTerm: "十三",
            suitableActivities: "宜解除、破屋",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "夕陽西下",
            idiomDescription: "比喻人到老年，或事物走向衰落。",
            idiomImageName: "day336"
        ),

        "12-03": LunarCalendarData(
            lunarTerm: "十四",
            suitableActivities: "宜掃舍、破土",
            unsuitableActivities: "忌嫁娶、入宅",
            idiom: "清潔溜溜",
            idiomDescription: "形容非常乾淨。",
            idiomImageName: "day337"
        ),

        "12-04": LunarCalendarData(
            lunarTerm: "十五",
            suitableActivities: "宜訂盟、納采",
            unsuitableActivities: "忌移徙、出火",
            idiom: "顛倒是非",
            idiomDescription: "歪曲事實，混淆黑白。",
            idiomImageName: "day338"
        ),

        "12-05": LunarCalendarData(
            lunarTerm: "十六",
            suitableActivities: "宜祭祀、沐浴",
            unsuitableActivities: "忌嫁娶、訂盟",
            idiom: "火山爆發",
            idiomDescription: "指火山從地底將氣體、碎屑或岩漿噴出地表的現象。",
            idiomImageName: "day339"
        ),

        "12-06": LunarCalendarData(
            lunarTerm: "十七",
            suitableActivities: "宜開市、納財",
            unsuitableActivities: "忌入宅、出火",
            idiom: "蠶食鯨吞",
            idiomDescription: "像蠶吃桑葉般和緩，像鯨魚吞食般猛烈，比喻不同的侵略併吞方式。",
            idiomImageName: "day340"
        ),

        "12-07": LunarCalendarData(
            lunarTerm: "大雪",
            suitableActivities: "宜開光、解除",
            unsuitableActivities: "忌嫁娶、出行",
            idiom: "健康檢查",
            idiomDescription: "指對身體進行一系列的檢查，以評估健康狀況和及早發現潛在的疾病。",
            idiomImageName: "day341"
        ),

        "12-08": LunarCalendarData(
            lunarTerm: "十九",
            suitableActivities: "宜動土、安門",
            unsuitableActivities: "忌嫁娶、祈福",
            idiom: "昏昏欲睡",
            idiomDescription: "形容人非常疲倦，提不起精神。",
            idiomImageName: "day342"
        ),

        "12-09": LunarCalendarData(
            lunarTerm: "二十",
            suitableActivities: "宜安葬、除服",
            unsuitableActivities: "忌針灸、穿耳",
            idiom: "奉公守法",
            idiomDescription: "形容人行為端正，遵守規矩。",
            idiomImageName: "day343"
        ),

        "12-10": LunarCalendarData(
            lunarTerm: "廿一",
            suitableActivities: "宜祈福、出行",
            unsuitableActivities: "忌塑繪、行喪",
            idiom: "一桿進洞",
            idiomDescription: "在高爾夫球比賽中，球員從發球區直接將球擊入球洞的罕見壯舉。",
            idiomImageName: "day344"
        ),

        "12-11": LunarCalendarData(
            lunarTerm: "廿二",
            suitableActivities: "宜開光、修造",
            unsuitableActivities: "忌入宅、祭祀",
            idiom: "孤島求生",
            idiomDescription: "在與世隔絕的孤島上，想辦法生存下去。",
            idiomImageName: "day345"
        ),

        "12-12": LunarCalendarData(
            lunarTerm: "廿三",
            suitableActivities: "宜祭祀",
            unsuitableActivities: "忌諸事不宜",
            idiom: "杳無人煙",
            idiomDescription: "形容極為偏僻，沒有人跡的地方。",
            idiomImageName: "day346"
        ),

        "12-13": LunarCalendarData(
            lunarTerm: "廿四",
            suitableActivities: "宜入宅、安床",
            unsuitableActivities: "忌嫁娶、開市",
            idiom: "冰天雪地",
            idiomDescription: "形容非常寒冷的地方。",
            idiomImageName: "day347"
        ),

        "12-14": LunarCalendarData(
            lunarTerm: "廿五",
            suitableActivities: "宜祭祀、解除",
            unsuitableActivities: "忌諸事不宜",
            idiom: "十大奇景",
            idiomDescription: "指世界或特定地區最著名、最引人入勝的自然或人文景觀。",
            idiomImageName: "day348"
        ),

        "12-15": LunarCalendarData(
            lunarTerm: "廿六",
            suitableActivities: "宜破屋、沐浴",
            unsuitableActivities: "忌諸事不宜",
            idiom: "心有靈犀",
            idiomDescription: "比喻心靈相連，情意相通，意念相契合。",
            idiomImageName: "day349"
        ),

        "12-16": LunarCalendarData(
            lunarTerm: "廿七",
            suitableActivities: "宜安床、祈福",
            unsuitableActivities: "忌安門、栽種",
            idiom: "茶壺風暴",
            idiomDescription: "指一個團體或組織內部的爭執或風波，且多半是表面平靜，內裡卻暗潮洶湧的狀況。",
            idiomImageName: "day350"
        ),

        "12-17": LunarCalendarData(
            lunarTerm: "廿八",
            suitableActivities: "宜解除、掃舍",
            unsuitableActivities: "忌諸事不宜",
            idiom: "珍禽異獸",
            idiomDescription: "珍貴稀有的動物。",
            idiomImageName: "day351"
        ),

        "12-18": LunarCalendarData(
            lunarTerm: "廿九",
            suitableActivities: "宜祭祀、開光",
            unsuitableActivities: "忌伐木、開市",
            idiom: "肺腑之言",
            idiomDescription: "出自內心的真話或真心話。",
            idiomImageName: "day352"
        ),

        "12-19": LunarCalendarData(
            lunarTerm: "卅",
            suitableActivities: "宜祈福、安床",
            unsuitableActivities: "忌嫁娶、安葬",
            idiom: "點石成金",
            idiomDescription: "原本平凡的事物，只要稍加修改，就能變得非常有價值。",
            idiomImageName: "day353"
        ),

        "12-20": LunarCalendarData(
            lunarTerm: "十一月",
            suitableActivities: "宜沐浴、塞穴",
            unsuitableActivities: "忌入宅、掘井",
            idiom: "不慌不忙",
            idiomDescription: "形容人舉止從容不迫。",
            idiomImageName: "day354"
        ),

        "12-21": LunarCalendarData(
            lunarTerm: "冬至",
            suitableActivities: "宜交易、沐浴",
            unsuitableActivities: "忌入宅、修造",
            idiom: "冬至湯圓",
            idiomDescription: "冬至吃湯圓是華人社會重要的傳統習俗，象徵著團圓、圓滿和祈求好運。",
            idiomImageName: "day355"
        ),

        "12-22": LunarCalendarData(
            lunarTerm: "初三",
            suitableActivities: "宜求醫、治病",
            unsuitableActivities: "忌伐木、安葬",
            idiom: "禮尚往來",
            idiomDescription: "指在人際交往中，注重禮節上的相互來往和回報。",
            idiomImageName: "day356"
        ),

        "12-23": LunarCalendarData(
            lunarTerm: "初四",
            suitableActivities: "宜出行、會友",
            unsuitableActivities: "忌嫁娶、動土",
            idiom: "陰陽交錯",
            idiomDescription: "比喻各種偶然因素湊在一起所造成的誤會。",
            idiomImageName: "day357"
        ),

        "12-24": LunarCalendarData(
            lunarTerm: "初五",
            suitableActivities: "宜祭祀、除服",
            unsuitableActivities: "忌入宅、訂盟",
            idiom: "外送到府",
            idiomDescription: "把商品或餐點直接送到你家門口。",
            idiomImageName: "day358"
        ),

        "12-25": LunarCalendarData(
            lunarTerm: "初六",
            suitableActivities: "宜動土、蓋屋",
            unsuitableActivities: "忌開市、造廟",
            idiom: "聖誕快樂",
            idiomDescription: "Merry Christmas!",
            idiomImageName: "day359"
        ),

        "12-26": LunarCalendarData(
            lunarTerm: "初七",
            suitableActivities: "宜祭祀、祈福",
            unsuitableActivities: "忌破土、行喪",
            idiom: "金銀斧頭",
            idiomDescription: "意著誠實的美德和意外的收穫。",
            idiomImageName: "day360"
        ),

        "12-27": LunarCalendarData(
            lunarTerm: "初八",
            suitableActivities: "宜破屋、治病",
            unsuitableActivities: "忌移徙、入宅",
            idiom: "山珍海味",
            idiomDescription: "指各種豐盛美味的菜餚。",
            idiomImageName: "day361"
        ),

        "12-28": LunarCalendarData(
            lunarTerm: "初九",
            suitableActivities: "宜安床、伐木",
            unsuitableActivities: "忌安門、造橋",
            idiom: "草莓大福",
            idiomDescription: "冬季限定的甜點，因其酸甜多汁的草莓和綿軟的麻糬外皮而受到喜愛。",
            idiomImageName: "day362"
        ),

        "12-29": LunarCalendarData(
            lunarTerm: "初十",
            suitableActivities: "宜祈福、解除",
            unsuitableActivities: "忌伐木、動土",
            idiom: "暢行無阻",
            idiomDescription: "非常順利地通行，沒有任何阻礙。",
            idiomImageName: "day363"
        ),

        "12-30": LunarCalendarData(
            lunarTerm: "十一",
            suitableActivities: "宜沐浴、納財",
            unsuitableActivities: "忌會友、入宅",
            idiom: "自由女神",
            idiomDescription: "是美國的象徵，同時也是自由、民主、和希望的象徵。",
            idiomImageName: "day364"
        ),

        "12-31": LunarCalendarData(
            lunarTerm: "十二",
            suitableActivities: "宜解除、破土",
            unsuitableActivities: "忌開市、赴任",
            idiom: "人間煙火",
            idiomDescription: "原指古人燒煮食物的炊煙和柴火，引申為人世間的日常事務或生活。",
            idiomImageName: "day365"
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
