//
//  YearOverviewView.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//  Updated for multi-year support
//


import SwiftUI

// MARK: - Year Overview View
struct YearOverviewView: View {
    // ✅ 測試模式：設定為 nil 使用真實日期，或設定測試日期
    private let testDate: Date? = Calendar.current.date(from: DateComponents(year: 2026, month: 1, day: 3))
    // private let testDate: Date? = nil // 正式版請使用這行
    
    @State private var animateGradient = false
    @State private var selectedDayInfo: DayInfo?
    @State private var scrollOffset: CGFloat = 0
    @State private var isShowingUpgrade = false
    @State private var selectedYear: Int?
    @State private var showYearMenu = false // 改為 menu
    @StateObject private var revenueCat = RevenueCatManager.shared
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isiPad: Bool {
        horizontalSizeClass == .regular
    }
    
    // ✅ 當前日期（支援測試模式）
    private var currentDate: Date {
        testDate ?? Date()
    }
    
    // ✅ 當前年份
    private var currentYear: Int {
        Calendar.current.component(.year, from: currentDate)
    }
    
    // ✅ 實際選中的年份（確保初始值正確）
    private var actualSelectedYear: Int {
        selectedYear ?? currentYear
    }
    
    // ✅ 只返回當前年份及之前的年份
    private var availableYears: [Int] {
        LunarCalendarDataManager.shared.getSupportedYears().filter { $0 <= currentYear }
    }
    
    // ✅ 計算選定年份的剩餘天數
    private var daysRemaining: Int {
        let calendar = Calendar.current
        let now = currentDate // 使用 currentDate
        let currentYearValue = calendar.component(.year, from: now)
        
        // 只有當前年份才顯示剩餘天數
        if actualSelectedYear == currentYearValue {
            let endOfYear = calendar.date(from: DateComponents(year: actualSelectedYear, month: 12, day: 31)) ?? now
            return calendar.dateComponents([.day], from: now, to: endOfYear).day ?? 0
        } else {
            // 過去年份顯示 0（已完成）
            return 0
        }
    }
    
    // ✅ 計算選定年份的當前天數
    private var dayOfYear: Int {
        let calendar = Calendar.current
        let currentYearValue = calendar.component(.year, from: currentDate) // 使用 currentDate
        
        if actualSelectedYear == currentYearValue {
            return calendar.ordinality(of: .day, in: .year, for: currentDate) ?? 1 // 使用 currentDate
        } else {
            // 過去年份顯示該年總天數（全部完成）
            return isLeapYear(actualSelectedYear) ? 366 : 365
        }
    }
    
    // ✅ 取得選定年份的總天數
    private var totalDaysInYear: Int {
        isLeapYear(actualSelectedYear) ? 366 : 365
    }
    
    // ✅ 判斷是否為閏年
    private func isLeapYear(_ year: Int) -> Bool {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
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
                // ✅ 初始化為當前年份
                if selectedYear == nil {
                    selectedYear = currentYear
                }
                
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
                
                Task {
                    await revenueCat.refreshStatus()
                }
            }
            
            VStack(spacing: 0) {
                // ✅ 頂部標題區域（新設計）
                VStack {
                    Spacer()
                        .frame(height: 80)
                    
                    HStack {
                        // 左側：年份和剩餘天數
                        HStack(spacing: 12) {
                            Text(String(format: "%d", actualSelectedYear))
                                .font(.system(size: 16, weight: .medium, design: .monospaced))
                                .foregroundColor(.accentColor)
                            
                            Text("・")
                                .font(.system(size: 8, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor)
                            
                            Text(daysRemaining > 0 ? "\(daysRemaining) days left" : "completed")
                                .font(.system(size: 16, weight: .regular, design: .monospaced))
                                .foregroundColor(.accentColor)
                        }
                        
                        Spacer()
                        
                        // 右側：歷史記錄按鈕（只在有多個年份時顯示）
                        if availableYears.count > 1 {
                            Button(action: {
                                let generator = UIImpactFeedbackGenerator(style: .light)
                                generator.impactOccurred()
                                showYearMenu.toggle()
                            }) {
                                Image(systemName: "clock.arrow.circlepath")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.accentColor)
                                    .padding(8)
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 16)
                }
                .zIndex(2)
                
                // 可滾動的內容區域
                ZStack {
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(spacing: 0) {
                                // 動態顯示選定年份的天數
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 12), spacing: 4) {
                                    ForEach(1...totalDaysInYear, id: \.self) { dayIndex in
                                        if dayIndex <= dayOfYear {
                                            // 已過去的日期顯示對應的成語圖片
                                            DayImageView(
                                                dayIndex: dayIndex,
                                                year: actualSelectedYear,
                                                isCompleted: true,
                                                onTap: {
                                                    handleDayTap(dayIndex: dayIndex)
                                                }
                                            )
                                        } else {
                                            // 未來的日期顯示圓點
                                            DayImageView(
                                                dayIndex: dayIndex,
                                                year: actualSelectedYear,
                                                isCompleted: false,
                                                onTap: nil
                                            )
                                        }
                                    }
                                }
                                .padding(.horizontal, 30)
                                .padding(.top, 20)
                                
                                Spacer()
                                    .frame(height: 120)
                            }
                            .background(
                                GeometryReader { geometry in
                                    Color.clear.preference(
                                        key: ScrollOffsetPreferenceKey.self,
                                        value: geometry.frame(in: .named("scroll")).minY
                                    )
                                }
                            )
                        }
                        .coordinateSpace(name: "scroll")
                        .scrollIndicators(.hidden)
                        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                            scrollOffset = value
                        }
                    }
                    
                    // 頂部模糊遮罩
                    VStack {
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(scrollOffset < -10 ? 0.1 : 0),
                                Color.clear
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 30)
                        .blur(radius: 10)
                        .opacity(scrollOffset < -10 ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3), value: scrollOffset)
                        
                        Spacer()
                    }
                    .zIndex(1)
                    
                    // 底部模糊遮罩
                    VStack {
                        Spacer()
                        
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.clear,
                                Color.black.opacity(0.1)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 30)
                        .blur(radius: 10)
                    }
                    .zIndex(1)
                }
            }
        }
        .sheet(item: $selectedDayInfo) { dayInfo in
            DailyIdiomDialog(
                date: dayInfo.date,
                lunarData: dayInfo.lunarData,
                isPresented: .constant(true),
                onDateSelected: { selectedDate in
                    let newDayData = LunarCalendarDataManager.shared.getData(for: selectedDate)
                    selectedDayInfo = DayInfo(date: selectedDate, lunarData: newDayData)
                }
            )
            .presentationDetents([.fraction(isiPad ? 0.9 : 0.6)])
            .presentationCornerRadius(48)
        }
        .sheet(isPresented: $isShowingUpgrade) {
            UpgradeView()
                .presentationDetents([.large])
                .presentationCornerRadius(48)
        }
        // ✅ 年份選擇 Menu（新設計）
        .sheet(isPresented: $showYearMenu) {
            yearMenuView
                .presentationDetents([.height(CGFloat(availableYears.count * 60 + 120))])
                .presentationCornerRadius(48)
        }
        .onReceive(NotificationCenter.default.publisher(for: .purchaseCompleted)) { _ in
            isShowingUpgrade = false
        }
    }
    
    // ✅ 年份選擇 Menu 視圖（新設計）
    private var yearMenuView: some View {
        VStack(spacing: 0) {
            // 標題
            HStack {
                Text("History")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {
                    showYearMenu = false
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.secondary)
                        .padding(8)
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .padding(.bottom, 20)
            
            Divider()
                .padding(.horizontal, 30)
            
            // 年份列表
            ScrollView {
                VStack(spacing: 4) {
                    ForEach(availableYears.sorted(by: >), id: \.self) { year in
                        Button(action: {
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()
                            
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                selectedYear = year
                                showYearMenu = false
                            }
                        }) {
                            HStack {
                                Text(String(format: "%d", year))
                                    .font(.system(size: 17, weight: actualSelectedYear == year ? .semibold : .regular, design: .monospaced))
                                
                                if year == currentYear {
                                    Text("Current")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.accentColor)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(
                                            Capsule()
                                                .fill(Color.accentColor.opacity(0.15))
                                        )
                                }
                                
                                Spacer()
                                
                                if actualSelectedYear == year {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.accentColor)
                                }
                            }
                            .foregroundColor(actualSelectedYear == year ? .accentColor : .primary)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(actualSelectedYear == year ? Color.accentColor.opacity(0.1) : Color.clear)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 16)
            }
        }
        .background(.ultraThinMaterial)
    }
    
    // ✅ 處理日期點擊
    private func handleDayTap(dayIndex: Int) {
        Task {
            await revenueCat.refreshStatus()
            
            let date = dateForDayOfYear(dayIndex, year: actualSelectedYear)
            let dayData = LunarCalendarDataManager.shared.getData(for: date)
            
            print("🔍 handleDayTap - isPremiumUser: \(revenueCat.isPremiumUser)")
            
            if revenueCat.isPremiumUser {
                selectedDayInfo = DayInfo(date: date, lunarData: dayData)
            } else {
                isShowingUpgrade = true
            }
        }
    }
    
    // ✅ 根據一年中的第幾天和年份計算實際日期
    private func dateForDayOfYear(_ dayOfYear: Int, year: Int) -> Date {
        let calendar = Calendar.current
        let startOfYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) ?? Date()
        return calendar.date(byAdding: .day, value: dayOfYear - 1, to: startOfYear) ?? Date()
    }
}

// MARK: - Day Image View
struct DayImageView: View {
    let dayIndex: Int
    let year: Int
    let isCompleted: Bool
    let onTap: (() -> Void)?
    
    private func getImageForDay(_ day: Int, year: Int) -> String {
        let calendar = Calendar.current
        let startOfYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) ?? Date()
        let date = calendar.date(byAdding: .day, value: day - 1, to: startOfYear) ?? Date()
        let lunarData = LunarCalendarDataManager.shared.getData(for: date)
        return lunarData.idiomImageName
    }
    
    var body: some View {
        ZStack {
            if isCompleted {
                Button(action: {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    
                    onTap?()
                }) {
                    Image(getImageForDay(dayIndex, year: year))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                Circle()
                    .fill(Color.accentColor.opacity(0.2))
                    .frame(width: 2, height: 2)
            }
        }
        .frame(width: 24, height: 24)
    }
}

// MARK: - Daily Idiom Dialog
struct DailyIdiomDialog: View {
    let date: Date
    let lunarData: LunarCalendarData
    @Binding var isPresented: Bool
    var onDateSelected: (Date) -> Void
    
    @State private var isDatePickerPresented = false
    @State private var selectedDate = Date()
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isiPad: Bool {
        horizontalSizeClass == .regular
    }
    
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
    
    private var today: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    @ViewBuilder
    private func datePickerContent() -> some View {
        VStack {
            DatePicker(
                "Select a date",
                selection: $selectedDate,
                in: ...today,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding()
            
            Button {
                isDatePickerPresented = false
                isPresented = false
                onDateSelected(selectedDate)
            } label: {
                Text("確認")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.primary)
            }
            .buttonStyle(.plain)
            .padding()
            .disabled(selectedDate > today)
            .opacity(selectedDate > today ? 0.5 : 1)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                RoundedRectangle(cornerRadius: 48)
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    HStack {
                        Text(dateFormatter.string(from: date))
                            .font(.system(size: 14, weight: .regular, design: .monospaced))
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Text(weekdayFormatter.string(from: date))
                            .font(.system(size: 14, weight: .regular, design: .monospaced))
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 40)
                    
                    VStack(spacing: 20) {
                        Image(lunarData.idiomImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        VStack(spacing: 12) {
                            Text(lunarData.idiom)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text(lunarData.idiomDescription)
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 28)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
                
                Button(action: {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    
                    selectedDate = date
                    isDatePickerPresented = true
                }) {
                    Image(systemName: "calendar")
                        .font(.system(size: 20))
                        .foregroundColor(.primary)
                        .padding(20)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .padding(.bottom, 12)
                        .padding(.trailing, 20)
                }
                .sheet(isPresented: $isDatePickerPresented) {
                    datePickerContent()
                        .presentationCornerRadius(48)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    YearOverviewView()
}
