//
//  CardDetailView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie
import UIKit

// MARK: - Apple Intelligence Glow Effect
struct GlowEffect {
    static func generateGradientStops() -> [Gradient.Stop] {
        [
            Gradient.Stop(color: Color(hex: "BC82F3"), location: Double.random(in: 0...1)),
            Gradient.Stop(color: Color(hex: "F5B9EA"), location: Double.random(in: 0...1)),
            Gradient.Stop(color: Color(hex: "8D9FFF"), location: Double.random(in: 0...1)),
            Gradient.Stop(color: Color(hex: "AA6EEE"), location: Double.random(in: 0...1)),
            Gradient.Stop(color: Color(hex: "FF6778"), location: Double.random(in: 0...1)),
            Gradient.Stop(color: Color(hex: "FFBA71"), location: Double.random(in: 0...1)),
            Gradient.Stop(color: Color(hex: "C686FF"), location: Double.random(in: 0...1))
        ].sorted { $0.location < $1.location }
    }
}

struct EffectNoBlur: View {
    var gradientStops: [Gradient.Stop]
    var width: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .strokeBorder(
                AngularGradient(
                    stops: gradientStops,
                    center: .center,
                    angle: .degrees(0)
                ),
                lineWidth: width
            )
    }
}

struct Effect: View {
    var gradientStops: [Gradient.Stop]
    var width: CGFloat
    var blur: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .strokeBorder(
                AngularGradient(
                    stops: gradientStops,
                    center: .center,
                    angle: .degrees(0)
                ),
                lineWidth: width
            )
            .blur(radius: blur)
    }
}

// Color extension for hex support
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Fluid Gradient 背景元件
struct FluidGradientBackground: View {
    @State private var animate = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // 基礎淺色背景
                LinearGradient(
                    colors: [
                        Color(hex: "FFE8F5"),
                        Color(hex: "E8F0FF")
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                // 第一個流動圓圈 - 紫色（更濃）
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "C8A0E8").opacity(1.0),
                                Color(hex: "D4B5F0").opacity(0.7),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: geo.size.width * 0.7
                        )
                    )
                    .frame(width: geo.size.width * 1.5, height: geo.size.width * 1.5)
                    .offset(
                        x: animate ? -geo.size.width * 0.2 : geo.size.width * 0.3,
                        y: animate ? -geo.size.height * 0.3 : -geo.size.height * 0.1
                    )
                    .blur(radius: 50)
                
                // 第二個流動圓圈 - 粉色（更濃）
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "FFB8DC").opacity(0.9),
                                Color(hex: "FFD0EB").opacity(0.6),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: geo.size.width * 0.65
                        )
                    )
                    .frame(width: geo.size.width * 1.3, height: geo.size.width * 1.3)
                    .offset(
                        x: animate ? geo.size.width * 0.4 : geo.size.width * 0.2,
                        y: animate ? -geo.size.height * 0.2 : geo.size.height * 0.1
                    )
                    .blur(radius: 55)
                
                // 第三個流動圓圈 - 藍色（更濃）
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "A8CFFF").opacity(0.9),
                                Color(hex: "C8DFFF").opacity(0.6),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: geo.size.width * 0.6
                        )
                    )
                    .frame(width: geo.size.width * 1.2, height: geo.size.width * 1.2)
                    .offset(
                        x: animate ? -geo.size.width * 0.3 : -geo.size.width * 0.1,
                        y: animate ? geo.size.height * 0.4 : geo.size.height * 0.2
                    )
                    .blur(radius: 52)
                
                // 第四個流動圓圈 - 橘黃色（更濃）
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "FFD8A8").opacity(0.8),
                                Color(hex: "FFE8C8").opacity(0.5),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: geo.size.width * 0.65
                        )
                    )
                    .frame(width: geo.size.width * 1.4, height: geo.size.width * 1.4)
                    .offset(
                        x: animate ? geo.size.width * 0.3 : geo.size.width * 0.1,
                        y: animate ? geo.size.height * 0.35 : geo.size.height * 0.3
                    )
                    .blur(radius: 60)
            }
            .animation(
                .easeInOut(duration: 12)
                .repeatForever(autoreverses: true),
                value: animate
            )
            .onAppear {
                animate = true
            }
        }
    }
}

// MARK: - Mesh Gradient 背景元件
struct MeshGradientBackground: View {
    @State private var animate = false

    var color1: Color
    var color2: Color
    var color3: Color
    var color4: Color
    var color5: Color

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(red: 245/255, green: 245/255, blue: 250/255)
                    .ignoresSafeArea()

                // 第一個圓圈 - 左上
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [color1, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.7
                        )
                    )
                    .frame(width: geo.size.width * 1.8, height: geo.size.width * 1.8)
                    .offset(x: animate ? -geo.size.width * 0.3 : geo.size.width * 0.1,
                            y: animate ? -geo.size.height * 0.4 : -geo.size.height * 0.2)
                    .blur(radius: 120)

                // 第二個圓圈 - 右上
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [color2, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.6
                        )
                    )
                    .frame(width: geo.size.width * 1.6, height: geo.size.width * 1.6)
                    .offset(x: animate ? geo.size.width * 0.4 : geo.size.width * 0.3,
                            y: animate ? -geo.size.height * 0.3 : geo.size.height * 0.0)
                    .blur(radius: 100)

                // 第三個圓圈 - 左下
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [color3, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.6
                        )
                    )
                    .frame(width: geo.size.width * 1.5, height: geo.size.width * 1.5)
                    .offset(x: animate ? -geo.size.width * 0.25 : geo.size.width * 0.1,
                            y: animate ? geo.size.height * 0.3 : geo.size.height * 0.4)
                    .blur(radius: 100)

                // 第四個圓圈 - 中央
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [color4, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.5
                        )
                    )
                    .frame(width: geo.size.width * 1.3, height: geo.size.width * 1.3)
                    .offset(x: animate ? geo.size.width * 0.1 : -geo.size.width * 0.1,
                            y: animate ? geo.size.height * 0.1 : -geo.size.height * 0.1)
                    .blur(radius: 90)

                // 第五個圓圈 - 右下
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [color5, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.55
                        )
                    )
                    .frame(width: geo.size.width * 1.4, height: geo.size.width * 1.4)
                    .offset(x: animate ? geo.size.width * 0.3 : geo.size.width * 0.2,
                            y: animate ? geo.size.height * 0.4 : geo.size.height * 0.3)
                    .blur(radius: 110)
            }
            .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true), value: animate)
            .onAppear { animate = true }
        }
        .ignoresSafeArea()
    }
}


struct CardDetailView: View {
    let icon: String
    let title: String
    let cardType: CardType

    @EnvironmentObject var appState: AppState
    @State private var animateGradient: Bool = false
    @State private var isLoading = false
    @State private var showResult = false
    @State private var loadingGradientAngle: Double = 0
    @State private var hapticTimer: Timer? = nil
    @State private var currentMessageIndex = 0
    @State private var dotScales = [1.0, 1.0, 1.0]
    @State private var mysticalRotation = 0.0
    @State private var glowRotation = 0.0
    @State private var starScales = Array(repeating: 1.0, count: 8)
    @State private var gradientStops: [Gradient.Stop] = []
    @State private var glowTimer: Timer? = nil
    @Environment(\.dismiss) var dismiss

    
    var headerText: String {
        switch cardType {
        case .work: return "工作上遇到的問題嗎？"
        case .love: return "感情中想問什麼呢？"
        case .future: return "對未來感到迷惘？"
        case .lunch: return "午餐吃什麼？"
        case .drink: return "想喝點什麼？"
        }
    }

    var sublineText: String {
        switch cardType {
        case .work: return "靜下心來，默念你的問題"
        case .love: return "把你的煩惱說給我聽"
        case .future: return "說說你在焦慮什麼"
        case .lunch: return "一天中最困難的問題交給我吧！"
        case .drink: return "讓我替你選一杯"
        }
    }

    var animationFileName: String {
        switch cardType {
        case .work:
            return "mediation"
        case .love:
            return "mediation"
        case .future:
            return "mediation"
        case .lunch:
            return "mediation"
        case .drink:
            return "mediation"
        }
    }

    var loadingBackgroundColors: (Color, Color, Color, Color, Color) {
        switch cardType {
        case .work:
            return (
                Color(red: 120/255, green: 80/255, blue: 255/255),   // 深紫藍
                Color(red: 180/255, green: 120/255, blue: 255/255),  // 中紫
                Color(red: 80/255, green: 140/255, blue: 255/255),   // 藍紫
                Color(red: 160/255, green: 100/255, blue: 220/255),  // 深紫
                Color(red: 100/255, green: 160/255, blue: 255/255)   // 亮藍
            )
        case .love:
            return (
                Color(red: 255/255, green: 100/255, blue: 180/255),  // 深粉紅
                Color(red: 255/255, green: 140/255, blue: 200/255),  // 玫瑰粉
                Color(red: 220/255, green: 120/255, blue: 255/255),  // 粉紫
                Color(red: 255/255, green: 120/255, blue: 160/255),  // 珊瑚粉
                Color(red: 240/255, green: 160/255, blue: 255/255)   // 淡紫粉
            )
        case .future:
            return (
                Color(red: 100/255, green: 200/255, blue: 255/255),  // 深天藍
                Color(red: 120/255, green: 180/255, blue: 255/255),  // 中藍
                Color(red: 180/255, green: 220/255, blue: 255/255),  // 淺藍
                Color(red: 80/255, green: 180/255, blue: 240/255),   // 青藍
                Color(red: 140/255, green: 240/255, blue: 255/255)   // 亮青
            )
        case .lunch:
            return (
                Color(red: 255/255, green: 180/255, blue: 80/255),   // 深橘黃
                Color(red: 255/255, green: 140/255, blue: 60/255),   // 橘紅
                Color(red: 255/255, green: 200/255, blue: 120/255),  // 暖黃
                Color(red: 255/255, green: 160/255, blue: 100/255),  // 橘橙
                Color(red: 255/255, green: 220/255, blue: 140/255)   // 金黃
            )
        case .drink:
            return (
                Color(red: 120/255, green: 210/255, blue: 255/255), // 冰藍
                Color(red: 150/255, green: 230/255, blue: 255/255), // 清爽水藍
                Color(red: 180/255, green: 245/255, blue: 255/255), // 氣泡淡藍
                Color(red: 140/255, green: 220/255, blue: 240/255), // 海鹽薄荷
                Color(red: 200/255, green: 255/255, blue: 255/255)  // 透明冰塊
            )

        }
    }

    // Loading 訊息組
    var loadingMessages: [String] {
        switch cardType {
        case .work:
            return [
                "來自宇宙的訊息...",
                "解讀你的職場能量...",
                "工作指引即將顯現...",
                "答案正在路上..."
            ]
        case .love:
            return [
                "來自宇宙的訊息...",
                "接通愛的頻率...",
                "解讀情感密碼中...",
                "愛情指引即將到來..."
            ]
        case .future:
            return [
                "來自宇宙的訊息...",
                "穿越時空隧道...",
                "探索未來可能性...",
                "命運軌跡正在顯現..."
            ]
        case .lunch:
            return [
                "來自宇宙的訊息...",
                "搜尋美食靈感...",
                "味蕾雷達啟動中...",
                "完美午餐即將揭曉..."
            ]
        case .drink:
            return [
                "來自宇宙的訊息...",
                "飲料精靈正在思考...",
                "調配你的專屬配方...",
                "就是這杯了！"
            ]

        }
    }
    
    func startLoadingAnimations() {
        // 初始化 Glow Effect
        gradientStops = GlowEffect.generateGradientStops()
        
        // Apple Intelligence Glow 動畫
        glowTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            if !isLoading {
                glowTimer?.invalidate()
                glowTimer = nil
                return
            }
            withAnimation(.easeInOut(duration: 0.6)) {
                gradientStops = GlowEffect.generateGradientStops()
            }
        }
        
        // 文字切換動畫
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true) { timer in
            if !isLoading {
                timer.invalidate()
                return
            }
            withAnimation(.easeInOut(duration: 0.5)) {
                currentMessageIndex = (currentMessageIndex + 1) % loadingMessages.count
            }
        }
        
        // 點點點動畫
        withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
            dotScales = [1.3, 1.0, 1.0]
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                dotScales = [1.0, 1.3, 1.0]
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                dotScales = [1.0, 1.0, 1.3]
            }
        }
        
        // 神秘符號旋轉
        withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
            mysticalRotation = 360
        }
        
        // 邊緣光暈
        withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
            glowRotation = 360
        }
        
        // 星星閃爍
        for i in 0..<8 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                    starScales[i] = Double.random(in: 0.5...1.2)
                }
            }
        }
    }


    // Apple 風格的簡潔光暈效果
    struct AppleStyleGlowEffect: View {
        @State private var rotation: Double = 0
        @State private var pulseOpacity: Double = 0.3
        
        var body: some View {
            ZStack {
                // 單一優雅的旋轉光環
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(
                        LinearGradient(
                            colors: [
                                .white.opacity(0),
                                .white.opacity(0.6),
                                .white.opacity(0)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        style: StrokeStyle(lineWidth: 3, lineCap: .round)
                    )
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(rotation))
                    .blur(radius: 1)
                
                // 微妙的脈衝光暈
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                .white.opacity(pulseOpacity * 0.15),
                                .white.opacity(pulseOpacity * 0.05),
                                .clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)
            }
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    pulseOpacity = 0.5
                }
            }
        }
    }

    
    var body: some View {
        ZStack {
            
            if !isLoading && !showResult {
                Button(action: {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.accentColor.opacity(0.4))
                        .padding(.top, 100)
                        .padding(.leading, 32)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .ignoresSafeArea(.all, edges: .top)
                .zIndex(2)
            }
            
            VStack {
                Text(headerText)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 8)
                    .foregroundColor(.black.opacity(0.9))

                Text(sublineText)
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.7))

                LottieView(animation: .named("\(animationFileName).json"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .resizable()
                    .frame(width: 350, height: 350)

                Button(action: {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)

                    // ✅ 在這裡執行提問次數檢查與扣除
                    let success = appState.useQuestionAttempt()
                    print("🔍 點擊 SUBMIT")
                    print("🔍 isPremiumUser: \(appState.isPremiumUser)")
                    print("🔍 dailyQuestionCount: \(appState.dailyQuestionCount)")
                    print("🔍 canAskQuestion: \(appState.canAskQuestion())")
                    print("🔍 useQuestionAttempt 結果: \(success)")

                    if success {
                        isLoading = true
                        loadingGradientAngle = 360

                        hapticTimer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { _ in
                            let impact = UIImpactFeedbackGenerator(style: .medium)
                            impact.impactOccurred()
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            isLoading = false
                            loadingGradientAngle = 0
                            hapticTimer?.invalidate()
                            hapticTimer = nil
                            showResult = true
                        }
                    } else {
                        // ✅ 如果失敗（次數用完），顯示升級提示
                        appState.showUpgradeDialog = true
                        print("🔍 今日免費次數已用完，觸發升級提示")
                    }
                }) {
                    Text("SUBMIT")
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(width: 147, height: 52)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.3), lineWidth: 12)
                        )
                        .shadow(radius: 100)
                        .foregroundColor(Color.black.opacity(0.8))
                }
                .disabled(isLoading)

            }
            .blur(radius: isLoading ? 8 : 0)

            // Loading overlay - Apple Intelligence Style with Screen Border Glow
            if isLoading {
                ZStack {
                    // Fluid Gradient 背景
                    FluidGradientBackground()
                        .ignoresSafeArea()
                    
                    // Apple Intelligence Glow 螢幕邊框 - 多層光暈效果（擴大版）
                    ZStack {
                        // 超外層 - 極度模糊的大範圍光暈
                        Effect(gradientStops: gradientStops, width: 40, blur: 50)
                            .padding(4)
                            .opacity(0.3)
                        
                        // 最外層 - 最模糊的光暈
                        Effect(gradientStops: gradientStops, width: 32, blur: 38)
                            .padding(4)
                            .opacity(0.4)
                        
                        // 中外層光暈
                        Effect(gradientStops: gradientStops, width: 24, blur: 28)
                            .padding(4)
                            .opacity(0.5)
                        
                        // 中層光暈
                        Effect(gradientStops: gradientStops, width: 16, blur: 18)
                            .padding(4)
                            .opacity(0.6)
                        
                        // 核心光暈
                        Effect(gradientStops: gradientStops, width: 10, blur: 10)
                            .padding(4)
                            .opacity(0.7)
                    }
                    .ignoresSafeArea()
                    
                    // 中心內容區域
                    VStack(spacing: 0) {
                        Spacer()
                        
                        // 文字區域
                        VStack(spacing: 16) {
                            Text(loadingMessages[currentMessageIndex])
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            Color(hex: "BC82F3"),
                                            Color(hex: "AA6EEE")
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .multilineTextAlignment(.center)
                                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                        }
                        .padding(.horizontal, 40)
                        
                        Spacer()
                    }
                }
                .transition(.opacity)
                .onAppear {
                    startLoadingAnimations()
                }
            }

           

            

          

            // ResultView 直接顯示（無動畫）
            if showResult {
                ResultView(cardType: cardType)
                    .zIndex(1)
            }
        }
        .navigationBarBackButtonHidden(true)
        .containerRelativeFrame([.horizontal, .vertical])
        .background {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 237/255, green: 220/255, blue: 244/255),
                    Color(red: 255/255, green: 229/255, blue: 255/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
        }
    }
}


#Preview("Card Detail - Work") {
    NavigationView {
        CardDetailView(icon: "work-card-2", title: "WORK", cardType: .work)
            .environmentObject(AppState())
    }
}

#Preview("Card Detail - Love") {
    NavigationView {
        CardDetailView(icon: "love-card-2", title: "LOVE", cardType: .love)
            .environmentObject(AppState())
    }
}

#Preview("Card Detail - Future") {
    NavigationView {
        CardDetailView(icon: "future-card-2", title: "FUTURE", cardType: .future)
            .environmentObject(AppState())
    }
}

#Preview("Card Detail - Lunch") {
    NavigationView {
        CardDetailView(icon: "lunch-card-2", title: "LUNCH", cardType: .lunch)
            .environmentObject(AppState())
    }
}

#Preview("Card Detail - Drink") {
    NavigationView {
        CardDetailView(icon: "drink-card-2", title: "DRINK", cardType: .drink)
            .environmentObject(AppState())
    }
}

