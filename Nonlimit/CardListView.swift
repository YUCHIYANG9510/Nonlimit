//
//  CardListView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie

struct CardListView: View {
    @State private var randomBundleIndex = Int.random(in: 0..<3)
    @State private var animateGradient: Bool = false
    
    // 定義所有卡片資料
    private let cards = [
        CardInfo(imageName: "work", title: "WORK", destinationIndex: 1),
        CardInfo(imageName: "love", title: "LOVE", destinationIndex: 2),
        CardInfo(imageName: "future", title: "FUTURE", destinationIndex: 3),
        CardInfo(imageName: "lunch", title: "LUNCH", destinationIndex: 4)
    ]
    
    private let gradientColors = [
        Color(red: 237/255, green: 220/255, blue: 244/255),
        Color(red: 255/255, green: 229/255, blue: 255/255)
    ]
    
    private let titleColor = Color(red: 65/255, green: 70/255, blue: 151/255)

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // 標題區域
                VStack(alignment: .leading, spacing: 4) {
                    Text("What Answers Do You Seek?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(titleColor)
                    
                    Text("Pick one and ask question")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(titleColor.opacity(0.5))
                }
                .padding(.top, 24)
                .padding(.bottom, 4)
                .padding(.leading, 32)

                // 卡片網格
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(cards) { card in
                            CardView(info: card)
                        }
                    }
                    .padding(24)
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: gradientColors),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
            )
            .overlay(SplashView())
            .containerRelativeFrame([.horizontal, .vertical])
        }
        .navigationBarBackButtonHidden(true)
    }
}

// 卡片資訊模型
struct CardInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let destinationIndex: Int
}

// 統一的卡片視圖
struct CardView: View {
    let info: CardInfo
    
    private let titleColor = Color(red: 65/255, green: 70/255, blue: 151/255)

    var body: some View {
        NavigationLink(destination: destinationView) {
            VStack {
                Image(info.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .font(.title)

                Text(info.title)
                    .font(.title2)
                    .bold()
                    .padding(.top, 4)
                    .padding(.bottom, 12)
                    .foregroundColor(titleColor)
            }
            .padding(.horizontal, 34)
            .padding(.vertical, 24)
            .frame(height: 200)
            .background(Color.white.opacity(0.3))
            .cornerRadius(12)
        }
    }
    
    // 根據卡片類型返回對應的詳情視圖
    @ViewBuilder
    private var destinationView: some View {
        switch info.destinationIndex {
        case 1:
            CardDetailView(icon: info.imageName, title: info.title)
        case 2:
            CardDetailView2(icon: info.imageName, title: info.title)
        case 3:
            CardDetailView3(icon: info.imageName, title: info.title)
        case 4:
            CardDetailView4(icon: info.imageName, title: info.title)
        default:
            CardDetailView(icon: info.imageName, title: info.title)
        }
    }
}

// 預覽
#Preview {
    CardListView()
}
