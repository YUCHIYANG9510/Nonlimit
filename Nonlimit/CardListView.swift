//
//  CardListView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie

// MARK: - Card List View
struct CardListView: View {
    @EnvironmentObject var appState: AppState
    @State private var animateGradient: Bool = false
    
    private let cards = [
        CardInfo(imageName: "work-card-2", title: "WORK", cardType: .work),
        CardInfo(imageName: "love-card-2", title: "LOVE", cardType: .love),
        CardInfo(imageName: "future-card-2", title: "FUTURE", cardType: .future),
        CardInfo(imageName: "lunch-card-2", title: "LUNCH", cardType: .lunch)
    ]
    
    private let gradientColors = [
        Color(red: 58/255, green: 66/255, blue: 151/255),
        Color(red: 45/255, green: 53/255, blue: 137/255)
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // Header Section
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
                
                // Cards ScrollView
                GeometryReader { geometry in
                    let size = geometry.size
                    let cardWidth = size.width - 60
                    
                    ScrollView(.horizontal) {
                        ScrollViewReader { scrollProxy in
                            HStack(spacing: 15) {
                                ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                                    CardView(
                                        card: card,
                                        cardWidth: cardWidth,
                                        cardHeight: size.height - 40,
                                        index: index
                                    )
                                    .id(index)
                                }
                                
                                Spacer()
                                    .frame(width: 20)
                            }
                            .padding(.horizontal, 20)
                            .scrollTargetLayout()
                            .frame(height: size.height, alignment: .top)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
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

#Preview("Card List View") {
    NavigationStack {
        CardListView()
            .environmentObject(AppState())
    }
}
