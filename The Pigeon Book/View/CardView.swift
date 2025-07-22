//
//  CardView.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/24.
//
import SwiftUI

struct CardView: View {
    @EnvironmentObject var appState: AppState
    
    let card: CardInfo
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let index: Int

    var body: some View {
        NavigationLink {
            CardDetailView(icon: card.imageName, title: card.title, cardType: card.cardType)
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
            appState.selectedCardIndex = index
        })
    }
}

// MARK: - Card Info Model
struct CardInfo: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let cardType: CardType
}
