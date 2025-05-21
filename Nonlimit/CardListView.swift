//
//  CardListView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

struct CardListView: View {
    // 使用環境對象
    @EnvironmentObject var appState: AppState
    @State private var animateGradient: Bool = false
    
    private let cards = [
        CardInfo(imageName: "work-card-2", title: "WORK", destinationIndex: 1),
        CardInfo(imageName: "love-card-2", title: "LOVE", destinationIndex: 2),
        CardInfo(imageName: "future-card-2", title: "FUTURE", destinationIndex: 3),
        CardInfo(imageName: "lunch-card-2", title: "LUNCH", destinationIndex: 4)
    ]
    
    private let gradientColors = [
        Color(red: 58/255, green: 66/255, blue: 151/255),
        Color(red: 45/255, green: 53/255, blue: 137/255)
    ]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientColors),
                          startPoint: .top,
                          endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("選擇您感興趣的主題")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("我想要了解...")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
                
                GeometryReader { geometry in
                    let size = geometry.size
                    let cardWidth = size.width - 60
                    
                    ScrollView(.horizontal) {
                        ScrollViewReader { scrollProxy in
                            HStack(spacing: 15) {
                                ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                                    CardView(card: card, cardWidth: cardWidth, cardHeight: size.height - 40, index: index)
                                    .id(index) // 添加 ID 以便滾動定位
                                }
                                
                                Spacer()
                                    .frame(width: 20)
                            }
                            .padding(.horizontal, 20)
                            .scrollTargetLayout()
                            .frame(height: size.height, alignment: .top)
                            .onAppear {
                                // 添加延遲以確保視圖已經完全加載
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    // 使用更平滑的動畫曲線和較長的持續時間
                                    withAnimation(.spring(response: 0.8, dampingFraction: 0.7)) {
                                        scrollProxy.scrollTo(appState.selectedCardIndex, anchor: .center)
                                    }
                                }
                            }
                        }
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                    
                }
                .frame(height: 500)
                .padding(.top, 10)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CardView: View {
    @EnvironmentObject var appState: AppState
    
    let card: CardInfo
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let index: Int

    var body: some View {
        NavigationLink {
            destinationView(for: card)
        } label: {
            ZStack {
                GeometryReader { proxy in
                    let cardSize = proxy.size

                    ZStack(alignment: .bottomLeading) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(red: 252/255, green: 240/255, blue: 254/255))

                        Image(card.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: cardSize.width, height: cardSize.height)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .frame(width: cardWidth, height: cardHeight)
            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                view.scaleEffect(phase.isIdentity ? 1 : 0.95)
            }
        }
        .simultaneousGesture(TapGesture().onEnded {
            // Update the selected index when tapped, but don't block navigation
            appState.selectedCardIndex = index
        })
    }

    @ViewBuilder
    private func destinationView(for card: CardInfo) -> some View {
        switch card.destinationIndex {
        case 1:
            CardDetailView(icon: card.imageName, title: card.title)
        case 2:
            CardDetailView2(icon: card.imageName, title: card.title)
        case 3:
            CardDetailView3(icon: card.imageName, title: card.title)
        case 4:
            CardDetailView4(icon: card.imageName, title: card.title)
        default:
            CardDetailView(icon: card.imageName, title: card.title)
        }
    }
}

// Card info model
struct CardInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let destinationIndex: Int
}

#Preview {
    NavigationStack {
        CardListView()
            .environmentObject(AppState())
    }
}
