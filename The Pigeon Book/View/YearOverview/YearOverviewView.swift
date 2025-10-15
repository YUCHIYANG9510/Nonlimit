//
//  YearOverviewView.swift
//  Nonlimit
//
//  Created by Designer on 2025/7/21.
//

import SwiftUI


// MARK: - Year Overview View
struct YearOverviewView: View {
    @State private var animateGradient = false
    @State private var selectedDayInfo: DayInfo?
    @State private var scrollOffset: CGFloat = 0
    @State private var isShowingUpgrade = false
    @StateObject private var revenueCat = RevenueCatManager.shared // 改用 RevenueCatManager
    @Environment(\.horizontalSizeClass) var horizontalSizeClass // ← 新增
    // 判斷是否為 iPad
    private var isiPad: Bool {
        horizontalSizeClass == .regular
    }
    
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
                
                // 頁面出現時刷新狀態
                Task {
                    await revenueCat.refreshStatus()
                }
            }
            
            VStack(spacing: 0) {
                // 固定在頂部的標題區域
                VStack {
                    Spacer()
                        .frame(height: 80)
                    
                    HStack() {
                        Text("2025")
                            .font(.system(size: 16, weight: .regular, design: .monospaced))
                            .fontWeight(.medium)
                            .foregroundColor(.accentColor)
                        
                        Text("・")
                            .font(.system(size: 8, weight: .regular, design: .monospaced))
                            .fontWeight(.medium)
                            .foregroundColor(.accentColor)
                        
                        Text("\(daysRemaining) days left")
                            .font(.system(size: 16, weight: .regular, design: .monospaced))
                            .fontWeight(.medium)
                            .foregroundColor(.accentColor)
                    }
                    .padding(.bottom, 16)
                }
                .zIndex(2)
                
                // 可滾動的內容區域
                ZStack {
                    // 使用 GeometryReader 來追蹤滾動位置
                    ScrollViewReader { proxy in
                        ScrollView {
                            VStack(spacing: 0) {
                                // 365天圖片網格
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 12), spacing: 4) {
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
                                .padding(.top, 20)
                                
                                // 底部空間
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
        // 顯示 DailyIdiomDialog（付費用戶）
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

        // 顯示 UpgradeView（免費用戶）
        .sheet(isPresented: $isShowingUpgrade) {
            UpgradeView()
                .presentationDetents([.large])
                .presentationCornerRadius(48)
        }
        // 監聽購買完成通知，更新本地狀態
        .onReceive(NotificationCenter.default.publisher(for: .purchaseCompleted)) { _ in
            // 購買完成後關閉升級頁面
            isShowingUpgrade = false
        }
    }
    
    // 處理日期點擊的函數
    private func handleDayTap(dayIndex: Int) {
        // 先刷新狀態，確保獲取最新的付費狀態
        Task {
            await revenueCat.refreshStatus()
            
            // 使用最新狀態判斷
            let date = dateForDayOfYear(dayIndex)
            let dayData = LunarCalendarDataManager.shared.getData(for: date)
            
            print("🔍 handleDayTap - isPremiumUser: \(revenueCat.isPremiumUser)")
            print("🔍 handleDayTap - isTrialUser: \(revenueCat.isTrialUser)")
            
            if revenueCat.isPremiumUser {
                selectedDayInfo = DayInfo(date: date, lunarData: dayData)
            } else {
                isShowingUpgrade = true
            }
        }
    }
    
    // 根據一年中的第幾天計算實際日期
    private func dateForDayOfYear(_ dayOfYear: Int) -> Date {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: Date())
        let startOfYear = calendar.date(from: DateComponents(year: year, month: 1, day: 1)) ?? Date()
        return calendar.date(byAdding: .day, value: dayOfYear - 1, to: startOfYear) ?? Date()
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
                    let generator = UIImpactFeedbackGenerator(style: .light)
                      generator.impactOccurred()
                    
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
    var onDateSelected: (Date) -> Void  // ✅ 新增 callback 傳出選擇的日期
    
    @State private var isDatePickerPresented = false
    @State private var selectedDate = Date()
    
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass // ← 新增
    // 判斷是否為 iPad
       private var isiPad: Bool {
           horizontalSizeClass == .regular
       }
    
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
                // 背景漸層
                RoundedRectangle(cornerRadius: 48)
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    // 日期顯示區域
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
                
                // 右下角日曆按鈕
                Button(action: {
                    
                    let generator =
                    UIImpactFeedbackGenerator(style: .light)
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


                }            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    YearOverviewView()
}
