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

    var topLeftColor: Color
    var topRightColor: Color
    var bottomLeftColor: Color

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(red: 245/255, green: 245/255, blue: 250/255)
                    .ignoresSafeArea()

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [topLeftColor, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.7
                        )
                    )
                    .frame(width: geo.size.width * 1.8, height: geo.size.width * 1.8)
                    .offset(x: animate ? -geo.size.width * 0.3 : geo.size.width * 0.1,
                            y: animate ? -geo.size.height * 0.4 : -geo.size.height * 0.2)
                    .blur(radius: 120)

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [topRightColor, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.6
                        )
                    )
                    .frame(width: geo.size.width * 1.6, height: geo.size.width * 1.6)
                    .offset(x: animate ? geo.size.width * 0.2 : geo.size.width * 0.3,
                            y: animate ? -geo.size.height * 0.2 : geo.size.height * 0.0)
                    .blur(radius: 100)

                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [bottomLeftColor, .clear]),
                            center: .center,
                            startRadius: 0,
                            endRadius: max(geo.size.width, geo.size.height) * 0.6
                        )
                    )
                    .frame(width: geo.size.width * 1.5, height: geo.size.width * 1.5)
                    .offset(x: animate ? -geo.size.width * 0.25 : geo.size.width * 0.1,
                            y: animate ? geo.size.height * 0.3 : geo.size.height * 0.4)
                    .blur(radius: 100)
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

    var loadingBackgroundColors: (Color, Color, Color) {
        switch cardType {
        case .work:
            return (
                Color(red: 160/255, green: 140/255, blue: 255/255), // 紫藍
                Color(red: 200/255, green: 180/255, blue: 255/255), // 粉紫
                Color(red: 180/255, green: 220/255, blue: 255/255)  // 淡藍
            )
        case .love:
            return (
                Color(red: 255/255, green: 180/255, blue: 220/255), // 粉紅
                Color(red: 255/255, green: 200/255, blue: 240/255), // 淡粉
                Color(red: 255/255, green: 220/255, blue: 230/255)  // 溫柔粉
            )
        case .future:
            return (
                Color(red: 180/255, green: 255/255, blue: 255/255), // 藍綠
                Color(red: 160/255, green: 210/255, blue: 255/255), // 天藍
                Color(red: 200/255, green: 240/255, blue: 255/255)  // 淺藍
            )
        case .lunch:
            return (
                Color(red: 255/255, green: 220/255, blue: 150/255), // 鮮黃
                Color(red: 255/255, green: 180/255, blue: 120/255), // 橘黃
                Color(red: 255/255, green: 240/255, blue: 200/255)  // 奶油
            )
        }
    }

    var body: some View {
        ZStack {
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
            if isLoading {
                ZStack {
                    MeshGradientBackground(
                        topLeftColor: loadingBackgroundColors.0,
                        topRightColor: loadingBackgroundColors.1,
                        bottomLeftColor: loadingBackgroundColors.2
                    )
                    VStack {
                        Text("來自宇宙的訊息...")
                            .font(.title2)
                            .foregroundColor(.accentColor.opacity(0.6))
                            .padding(.top, 16)
                    }
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
