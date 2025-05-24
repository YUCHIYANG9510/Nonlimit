//
//  CardDetailView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie

struct CardDetailView: View {
    let icon: String
    let title: String
    let cardType: CardType
    
    @EnvironmentObject var appState: AppState
    @State private var animateGradient: Bool = false
    
    var body: some View {
        VStack {
            Text("深呼吸、保持冷靜...")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.7))
                
            Text("提出你想問的問題")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.7))
                
            LottieView(animation: .named("mediation.json"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()
                .frame(width: 350, height: 350)
            
            NavigationLink(destination: ResultView(cardType: cardType)) {
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
