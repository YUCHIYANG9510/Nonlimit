//
//  CardListView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

struct CardListView: View {
    @State private var animateGradient: Bool = false
    
    // Define all cards data
    private let cards = [
        CardInfo(imageName: "work-card", title: "WORK", description: "Career & Business", destinationIndex: 1),
        CardInfo(imageName: "love-card", title: "LOVE", description: "Relationships", destinationIndex: 2),
        CardInfo(imageName: "future-card", title: "FUTURE", description: "What lies ahead", destinationIndex: 3),
        CardInfo(imageName: "lunch-card", title: "LUNCH", description: "Food & Dining", destinationIndex: 4)
    ]
    
    private let gradientColors = [
        Color(red: 58/255, green: 66/255, blue: 151/255),
        Color(red: 45/255, green: 53/255, blue: 137/255)
    ]

    var body: some View {
        ZStack {
            // Background that fills the entire screen
            LinearGradient(gradient: Gradient(colors: gradientColors),
                          startPoint: .top,
                          endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // Title area
                VStack(alignment: .leading, spacing: 8) {
                    Text("I want to understand...")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Choose the topic you are interested in")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
                
                // Horizontal card scrolling with parallax effect
                GeometryReader { geometry in
                    let size = geometry.size
                    let cardWidth = size.width - 60
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                        
                            
                            ForEach(cards) { card in
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    // Calculate the parallax effect based on horizontal position
                                    let minX = min(proxy.frame(in: .scrollView).minX * 1.4, proxy.size.width * 1.4)
                                    
                                    NavigationLink(destination: destinationView(for: card)) {
                                        ZStack {
                                            // Card background
                                            RoundedRectangle(cornerRadius: 16)
                                                .fill(Color(red: 252/255, green: 240/255, blue: 254/255))
                                            
                                            // Content - make image fill the entire card
                                            Image(card.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .offset(x: -minX)
                                                .frame(width: cardSize.width, height: cardSize.height)
                                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                            
                                            // Overlay with card information
                                            VStack(alignment: .leading) {
                                                Spacer()
                                                
                                                // Bottom text overlay
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text(card.title)
                                                        .font(.title2)
                                                        .fontWeight(.bold)
                                                        .foregroundStyle(.white)
                                                    
                                                    Text(card.description)
                                                        .font(.callout)
                                                        .foregroundStyle(.white.opacity(0.8))
                                                }
                                                .padding(20)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .background(
                                                    LinearGradient(
                                                        colors: [
                                                            .clear,
                                                            .black.opacity(0.3),
                                                            .black.opacity(0.6)
                                                        ],
                                                        startPoint: .top,
                                                        endPoint: .bottom
                                                    )
                                                )
                                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                            }
                                        }
                                     
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .frame(width: cardWidth, height: size.height - 40)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                            
                            Spacer()
                                .frame(width: 20) // 簡單設置一個固定寬度，可以根據需要調整
                        }
                        .padding(.horizontal, 20) // 添加水平邊距來控制第一張卡片的位置
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
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
    
    // Return the corresponding detail view based on card type
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
    let description: String
    let destinationIndex: Int
}

#Preview {
    CardListView()
}
