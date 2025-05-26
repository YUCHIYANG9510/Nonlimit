//
//  CardListView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie

// MARK: - Main Tab View
struct CardListView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var showSettings = false
    @State private var displayName = "Daisy"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 使用 GeometryReader 來實現自定義滑動動畫
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    // 第一個頁面 - 卡片選擇
                    CardSelectionView()
                        .frame(width: geometry.size.width)
                    
                    // 第二個頁面 - 日曆
                    CalendarView()
                        .frame(width: geometry.size.width)
                    
                    // 第三個頁面 - 年度總覽
                    YearOverviewView()
                        .frame(width: geometry.size.width)
                }
                .offset(x: -CGFloat(selectedTab) * geometry.size.width)
                .contentShape(Rectangle()) // 確保點擊區域正確
            }
            .clipped() // 防止內容溢出顯示白底
            .edgesIgnoringSafeArea(.all)
            
            // 設定按鈕（左下角）
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        showSettings = true
                    }) {
                        Image("setting-icon")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                    .padding(.leading, 40)
                    .padding(.bottom, 5)
                    
                    Spacer()
                }
            }
            
            // 自定義底部 Tab Bar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showSettings) {
            SettingsView(displayName: $displayName)
                .presentationDetents([.fraction(0.5)])
                .presentationCornerRadius(40)
        }
    }
}

// MARK: - Settings View
struct SettingsView: View {
    @Binding var displayName: String
    @Environment(\.dismiss) var dismiss
    @State private var tempDisplayName: String = ""
    @State private var showIconPicker = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack(spacing: 0) {
                    // Header
                    Text("Setting")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.accentColor)
                    .padding(.top, 24)
                    .padding(.bottom, 40)
                    
                    // Join Pro Section
                    VStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 237/255, green: 220/255, blue: 244/255),
                                                Color(red: 255/255, green: 229/255, blue: 255/255)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            .frame(height: 100)
                            .overlay(
                                HStack(spacing: 16) {
                                    // Pro icon
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.purple.opacity(0.8),
                                                        Color.pink.opacity(0.8)
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 48, height: 48)
                                        
                                        Image(systemName: "sparkles")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Join Pro")
                                            .font(.system(size: 18, weight: .semibold))
                                            .foregroundColor(.accentColor)
                                        
                                        Text("Subscription or one-time purchase")
                                            .font(.system(size: 12))
                                            .foregroundColor(.accentColor.opacity(0.7))
                                    }
                                    
                                    
                                    Button(action: {
                                        // Handle upgrade action
                                    }) {
                                        Text("Upgrade")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                        .background(.accent)
                                        .clipShape(Capsule())
                                    }
                                }
                                .padding(.horizontal, 20)
                            )
                            .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 40)
                    
                    // Settings Options
                    VStack(spacing: 20) {
                        // Display Name Setting
                        HStack {
                            Text("Display Name")
                                .font(.system(size: 18))
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            TextField("", text: $tempDisplayName)
                                .font(.system(size: 18))
                                .foregroundColor(.accentColor.opacity(0.7))
                                .multilineTextAlignment(.trailing)
                        }
                        .padding(.horizontal, 30)
                        
                        // Divider
                        Rectangle()
                            .fill(Color.accentColor.opacity(0.2))
                            .frame(height: 1)
                            .padding(.horizontal, 30)
                        
                        // Change Icon Setting
                        Button(action: {
                            showIconPicker = true
                        }) {
                            HStack {
                                Text("Change icon")
                                    .font(.system(size: 18))
                                    .foregroundColor(.accentColor)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 16))
                                    .foregroundColor(.accentColor.opacity(0.5))
                            }
                            .padding(.horizontal, 30)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                }
            }
        }
        .onAppear {
            tempDisplayName = displayName
        }
        .sheet(isPresented: $showIconPicker) {
            IconPickerView()
                .presentationDetents([.fraction(0.7)])
            .presentationCornerRadius(40)
        }
    }
}

enum AppIcon: String, CaseIterable {
    case `default` = "Default"
    case pink = "Pink"
    case lightpink = "Light-Pink"
    case simpleblack = "Simple-Black"
    case deadblack = "Dead-Black"
    
    var iconValue: String? {
        switch self {
        case .default:
            return nil // 系統預設值用 nil
        default:
            return rawValue
        }
    }
    
    var previewImage: String {
        switch self {
        case .default:
            return "icon_default"
        case .pink:
            return "icon_pink"
        case .lightpink:
            return "icon_lightpink"
        case .simpleblack:
            return "icon_simple-black"
        case .deadblack:
            return "icon_dead-black"
        }
    }
}

// MARK: - Icon Picker View
struct IconPickerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var pendingIcon: AppIcon? = nil

    // 取得目前 App Icon
    private var currentIcon: AppIcon {
        if let currentName = UIApplication.shared.alternateIconName {
            return AppIcon.allCases.first(where: { $0.rawValue == currentName }) ?? .default
        } else {
            return .default
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Text("Change icon")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 24)

                    ForEach(AppIcon.allCases, id: \.rawValue) { icon in
                        Button(action: {
                            pendingIcon = icon
                            UIApplication.shared.setAlternateIconName(icon.iconValue) { error in
                                if error == nil {
                                    // 略微延遲後關閉畫面（等系統 alert 結束）
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        dismiss()
                                    }
                                }
                            }
                        }) {
                            HStack(spacing: 16) {
                                Image(icon.previewImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(12)

                                Text(icon.rawValue)
                                    .font(.body)
                                    .foregroundColor(.primary)

                                Spacer()

                                if currentIcon == icon {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.accentColor)
                                        .font(.system(size: 24))
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.black.opacity(0.3))
                                        .font(.system(size: 24))
                                }
                            }
                            .padding(.vertical, 24)
                            .padding(.horizontal, 24)
                            .background(Color(red: 247/255, green: 247/255, blue: 247/255))
                            .cornerRadius(24)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                    }

                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


// MARK: - Custom Tab Bar
struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: -16) {
            tabButton(
                index: 0,
                selectedImage: "ask-question-on",
                unselectedImage: "ask-question-off"
            )
            
            tabButton(
                index: 1,
                selectedImage: "calendar-on",
                unselectedImage: "calendar-off"
            )
            
            tabButton(
                index: 2,
                selectedImage: "year-overview-on",
                unselectedImage: "year-overview-off"
            )
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.5))
                
        )
        .padding(.bottom, 32)
    }
    
    private func tabButton(index: Int, selectedImage: String, unselectedImage: String) -> some View {
        Button(action: {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                selectedTab = index
            }
        }) {
            VStack {
                Image(selectedTab == index ? selectedImage : unselectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Year Overview View (方案2：使用 sheet(item:))
struct YearOverviewView: View {
    @State private var animateGradient = false
    @State private var selectedDayInfo: DayInfo?
    
    private var daysRemaining: Int {
        let now = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: now)
        let endOfYear = calendar.date(from: DateComponents(year: year, month: 12, day: 31)) ?? now
        return calendar.dateComponents([.day], from: now, to: endOfYear).day ?? 0
    }
    
    private var dayOfYear: Int {
        Calendar.current.ordinality(of: .day, in: .year, for: Date()) ?? 1
    }
    
    var body: some View {
        ZStack {
            // 背景漸層
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 237/255, green: 220/255, blue: 244/255),
                    Color(red: 255/255, green: 229/255, blue: 255/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    // 頂部空間
                    Spacer()
                        .frame(height: 80)
                    
                    // 剩餘天數標題
                    Text("\(daysRemaining) days left")
                        .font(.system(size: 16, weight: .regular, design: .monospaced))
                        .fontWeight(.medium)
                        .foregroundColor(.accentColor)
                    
                    // 365天圖片網格
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 14), spacing: 4) {
                        ForEach(1...365, id: \.self) { dayIndex in
                            if dayIndex <= dayOfYear {
                                // 已過去的日期顯示對應的成語圖片（縮小版）
                                DayImageView(
                                    dayIndex: dayIndex,
                                    isCompleted: true,
                                    onTap: {
                                        handleDayTap(dayIndex: dayIndex)
                                    }
                                )
                            } else {
                                // 未來的日期顯示圓點
                                DayImageView(
                                    dayIndex: dayIndex,
                                    isCompleted: false,
                                    onTap: nil
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    // 底部空間
                    Spacer()
                        .frame(height: 120)
                }
            }
        }
        // 使用 sheet(item:) 顯示日期和成語信息
        .sheet(item: $selectedDayInfo) { dayInfo in
            DailyIdiomDialog(
                date: dayInfo.date,
                lunarData: dayInfo.lunarData,
                isPresented: .constant(false)
            )
            .presentationDetents([.fraction(0.6)])
            .presentationCornerRadius(48)
        }
    }
    
    // 處理日期點擊的函數
    private func handleDayTap(dayIndex: Int) {
        let date = dateForDayOfYear(dayIndex)
        let dayData = LunarCalendarDataManager.shared.getData(for: date)
        
        // 創建包含日期和農曆數據的信息
        selectedDayInfo = DayInfo(date: date, lunarData: dayData)
    }
    
    // 根據一年中的第幾天計算實際日期
    private func dateForDayOfYear(_ dayOfYear: Int) -> Date {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        let startOfYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) ?? Date()
        return calendar.date(byAdding: .day, value: dayOfYear - 1, to: startOfYear) ?? Date()
    }
}

// MARK: - Day Info Model
struct DayInfo: Identifiable {
    let id = UUID()
    let date: Date
    let lunarData: LunarCalendarData
}

// MARK: - LunarCalendarData Extension
// 需要添加這個擴展讓 LunarCalendarData 遵循 Identifiable 協議
extension LunarCalendarData: Identifiable {
    public var id: String {
        return "\(lunarTerm)-\(idiom)-\(idiomImageName)"
    }
}

// MARK: - Day Image View
struct DayImageView: View {
    let dayIndex: Int
    let isCompleted: Bool
    let onTap: (() -> Void)?
    
    private func getImageForDay(_ day: Int) -> String {
        // 根據日期獲取對應的成語圖片
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        let startOfYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) ?? Date()
        let date = calendar.date(byAdding: .day, value: day - 1, to: startOfYear) ?? Date()
        let lunarData = LunarCalendarDataManager.shared.getData(for: date)
        return lunarData.idiomImageName
    }
    
    var body: some View {
        ZStack {
            if isCompleted {
                // 顯示成語圖片（縮小版）
                Button(action: {
                    onTap?()
                }) {
                    Image(getImageForDay(dayIndex))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                // 顯示圓點（不可點擊）
                Circle()
                    .fill(Color.accentColor.opacity(0.2))
                    .frame(width: 4, height: 4)
            }
        }
        .frame(width: 30, height: 30)
    }
}

// MARK: - Daily Idiom Dialog
struct DailyIdiomDialog: View {
    let date: Date
    let lunarData: LunarCalendarData
    @Binding var isPresented: Bool
    
    // 日期格式化器
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }
    
    private var weekdayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // 背景漸層
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 237/255, green: 220/255, blue: 244/255),
                        Color(red: 255/255, green: 229/255, blue: 255/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea(.all)
                
                VStack(spacing: 30) {
                    
                    // 日期顯示區域
                    HStack() {
                        Text(dateFormatter.string(from: date))
                            .font(.system(size: 14, weight: .regular, design: .monospaced))
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text(weekdayFormatter.string(from: date))
                            .font(.system(size: 14, weight: .regular, design: .monospaced))
                            .foregroundColor(.accentColor.opacity(0.7))
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 40)
                    
                    // 成語內容
                    VStack(spacing: 20) {
                        Image(lunarData.idiomImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        VStack(spacing: 12) {
                            Text(lunarData.idiom)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            
                            Text(lunarData.idiomDescription)
                                .font(.system(size: 14))
                                .foregroundColor(.accentColor.opacity(0.8))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 28)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .presentationDetents([.medium])
    }
}

// MARK: - Day Image View
struct ClickableDayImageView: View {
    let dayIndex: Int
    let isCompleted: Bool
    
    private func getImageForDay(_ day: Int) -> String {
        // 根據日期獲取對應的成語圖片
        // 這裡你需要根據實際的 LunarCalendarDataManager 來獲取對應日期的圖片
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        let date = calendar.date(from: DateComponents(year: year, day: day)) ?? Date()
        let lunarData = LunarCalendarDataManager.shared.getData(for: date)
        return lunarData.idiomImageName
    }
    
    var body: some View {
        ZStack {
            if isCompleted {
                // 顯示成語圖片（縮小版）
                Image(getImageForDay(dayIndex))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
            } else {
                // 顯示圓點
                Circle()
                    .fill(Color.accentColor.opacity(0.2))
                    .frame(width: 4, height: 4)
            }
        }
        .frame(width: 30, height: 30)
    }
}

// MARK: - Card Selection View
struct CardSelectionView: View {
    @EnvironmentObject var appState: AppState
    @State private var animateGradient = false
    
    private let cards = [
        CardSelectionInfo(
            imageName: "work-button",
            title: "Work.",
            cardType: .work,
            detailIcon: "work-card-2"
        ),
        CardSelectionInfo(
            imageName: "love-button",
            title: "Love.",
            cardType: .love,
            detailIcon: "love-card-2"
        ),
        CardSelectionInfo(
            imageName: "future-button",
            title: "Future.",
            cardType: .future,
            detailIcon: "future-card-2"
        ),
        CardSelectionInfo(
            imageName: "lunch-button",
            title: "Lunch.",
            cardType: .lunch,
            detailIcon: "lunch-card-2"
        )
    ]
    
    var body: some View {
        ZStack {
            // 背景漸層
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 237/255, green: 220/255, blue: 244/255),
                    Color(red: 255/255, green: 229/255, blue: 255/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
            
            VStack(spacing: 40) {
                
                // 標題
                Text("你在尋找哪方面的答案呢？")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 16)
                    .padding(.top, 150)
                
                // 卡片選項
                VStack(spacing: 24) {
                    ForEach(cards, id: \.id) { card in
                        CardSelectionButton(card: card)
                    }
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
        }
    }
}

// MARK: - Calendar View
struct CalendarView: View {
    @State private var currentDate = Date()
    @State private var animateGradient = false
    
    private var currentLunarData: LunarCalendarData {
        LunarCalendarDataManager.shared.getData(for: currentDate)
    }

    var body: some View {
        ZStack {
            // 背景漸層
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 237/255, green: 220/255, blue: 244/255),
                    Color(red: 255/255, green: 229/255, blue: 255/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(.all)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }

            VStack(spacing: 30) {
                // 日期資訊區塊
                VStack(spacing: 24) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(dateFormatter.string(from: currentDate))
                                .font(.system(size: 16, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor)
                            
                            Text("#\(dayOfYear)")
                                .font(.system(size: 14, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        Text(dayOfMonth)
                            .font(.system(size: 64, weight: .bold, design: .monospaced))
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(yearMonthFormatter.string(from: currentDate))
                                .font(.system(size: 16, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor)
                        }
                    }
                    
                    VStack(spacing: 4) {
                        Text(currentLunarData.lunarTerm)
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        
                        Text("\(currentLunarData.suitableActivities)  |  \(currentLunarData.unsuitableActivities)")
                            .font(.subheadline)
                            .foregroundColor(.accentColor.opacity(0.7))
                    }
                }
                .padding(.top, 100)
                .padding(.horizontal, 30)
                
                // 成語卡片
                VStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.white.opacity(0.5))
                        .frame(height: 400)
                        .overlay(
                            VStack(spacing: 20) {
                                Image(currentLunarData.idiomImageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                
                                VStack(spacing: 12) {
                                    Text(currentLunarData.idiom)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.accentColor)
                                    
                                    Text(currentLunarData.idiomDescription)
                                        .font(.system(size: 14))
                                        .foregroundColor(.accentColor.opacity(0.8))
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 28)
                                }
                            }
                        )
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
}

// MARK: - Calendar View Extensions
extension CalendarView {
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }
    
    private var yearMonthFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM"
        return formatter
    }
    
    private var dayOfYear: Int {
        Calendar.current.ordinality(of: .day, in: .year, for: currentDate) ?? 1
    }
    
    private var dayOfMonth: String {
        let day = Calendar.current.component(.day, from: currentDate)
        return String(day)
    }
    
    private var lunarDate: String {
        // TODO: 實際實現農曆轉換
        return "小滿"
    }
    
    private var suitableActivities: String {
        // TODO: 從真實農曆資料獲取
        return "宜出行、會友"
    }
    
    private var unsuitableActivities: String {
        // TODO: 從真實農曆資料獲取
        return "忌造廟、掘井"
    }
}

// MARK: - Card Selection Button
struct CardSelectionButton: View {
    let card: CardSelectionInfo
    
    var body: some View {
        NavigationLink(
            destination: CardDetailView(
                icon: card.detailIcon,
                title: card.title.uppercased().replacingOccurrences(of: ".", with: ""),
                cardType: card.cardType
            )
        ) {
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 70)
                .shadow(color: .primary.opacity(0.2), radius: 2, x: 1, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Supporting Models
struct CardSelectionInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let cardType: CardType
    let detailIcon: String
}

// MARK: - Preview
#Preview("Updated Card List View") {
    NavigationStack {
        CardListView()
            .environmentObject(AppState())
    }
}
