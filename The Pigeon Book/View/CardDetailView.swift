//
//  CardDetailView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie
import UIKit

// Mesh Gradient 背景元件
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
    @Environment(\.dismiss) var dismiss

    
    var headerText: String {
        switch cardType {
        case .work: return "工作上遇到的問題嗎？"
        case .love: return "感情中想問什麼呢？"
        case .future: return "對未來感到迷惘？"
        case .lunch: return "午餐吃什麼？"
        }
    }

    var sublineText: String {
        switch cardType {
        case .work: return "靜下心來，默念你的問題"
        case .love: return "把你的煩惱說給我聽"
        case .future: return "說說你在焦慮什麼"
        case .lunch: return "一天中最困難的問題交給我吧！"
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
        }
    }

    // Loading 訊息組
    var loadingMessages: [String] {
        switch cardType {
        case .work:
            return [
                "來自宇宙的訊息...",
                "正在連接智慧能量...",
                "解讀工作運勢中...",
                "即將揭曉答案..."
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
        }
    }
    
    func startLoadingAnimations() {
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


    // 粒子系統（簡化版）
    struct ParticleSystemView: View {
        @State private var particles: [Particle] = []
        
        var body: some View {
            ZStack {
                ForEach(particles, id: \.id) { particle in
                    Circle()
                        .fill(Color.white.opacity(particle.opacity))
                        .frame(width: particle.size, height: particle.size)
                        .position(particle.position)
                        .blur(radius: particle.blur)
                }
            }
            .onAppear {
                generateParticles()
            }
        }
        
        func generateParticles() {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            
            for _ in 0..<20 {
                let particle = Particle(
                    id: UUID(),
                    position: CGPoint(
                        x: CGFloat.random(in: 0...screenWidth),
                        y: CGFloat.random(in: 0...screenHeight)
                    ),
                    size: CGFloat.random(in: 2...6),
                    opacity: Double.random(in: 0.1...0.4),
                    blur: CGFloat.random(in: 0...2)
                )
                particles.append(particle)
            }
            
            // 粒子飄動動畫
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                for i in 0..<particles.count {
                    particles[i].position.y -= screenHeight + 100
                    particles[i].position.x += CGFloat.random(in: -50...50)
                }
            }
        }
    }

    struct Particle {
        let id: UUID
        var position: CGPoint
        let size: CGFloat
        let opacity: Double
        let blur: CGFloat
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

            // Loading overlay
            // 增強版的 Loading 體驗
            if isLoading {
                ZStack {
                    MeshGradientBackground(
                        color1: loadingBackgroundColors.0,
                        color2: loadingBackgroundColors.1,
                        color3: loadingBackgroundColors.2,
                        color4: loadingBackgroundColors.3,
                        color5: loadingBackgroundColors.4
                    )
                    
                    // 添加粒子效果背景
                    ParticleSystemView()
                    
                    VStack(spacing: 30) {
                        // 動態文字序列
                        VStack(spacing: 12) {
                            Text(loadingMessages[currentMessageIndex])
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                                .animation(.easeInOut(duration: 0.5), value: currentMessageIndex)
                            
                            // 動態點點點效果
                            HStack(spacing: 4) {
                                ForEach(0..<3) { index in
                                    Circle()
                                        .fill(Color.white.opacity(0.7))
                                        .frame(width: 8, height: 8)
                                        .scaleEffect(dotScales[index])
                                        .animation(
                                            .easeInOut(duration: 0.6)
                                            .repeatForever(autoreverses: true)
                                            .delay(Double(index) * 0.2),
                                            value: dotScales[index]
                                        )
                                }
                            }
                        }
                        
                        // 旋轉的神秘符號
                        ZStack {
                            // 外圈
                            Circle()
                                .stroke(Color.white.opacity(0.3), lineWidth: 2)
                                .frame(width: 120, height: 120)
                                .rotationEffect(.degrees(mysticalRotation))
                            
                            // 內圈符號
                            Image(systemName: "sparkles")
                                .font(.system(size: 40))
                                .foregroundColor(.white.opacity(0.8))
                                .rotationEffect(.degrees(-mysticalRotation * 0.7))
                            
                            // 環繞的小星星
                            ForEach(0..<8) { index in
                                Image(systemName: "star.fill")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.6))
                                    .offset(y: -50)
                                    .rotationEffect(.degrees(mysticalRotation + Double(index * 45)))
                                    .scaleEffect(starScales[index])
                            }
                        }
                        .animation(.linear(duration: 4).repeatForever(autoreverses: false), value: mysticalRotation)
                        
                        // 進度指示器
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white.opacity(0.8)))
                            .scaleEffect(1.2)
                    }
                    .padding(.horizontal, 40)
                    
                    // 邊緣光暈效果
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(
                            LinearGradient(
                                colors: [.clear, .white.opacity(0.3), .clear],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 2
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .rotationEffect(.degrees(glowRotation))
                        .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: glowRotation)
                }
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
