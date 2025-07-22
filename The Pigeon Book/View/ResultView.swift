//
//  ResultView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie

struct ResultView: View {
    let cardType: CardType
    
    @EnvironmentObject var appState: AppState
    @Environment(\.presentationMode) var presentationMode
    @State private var randomMessageIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LottieView(animation: .named(cardType.animationName))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .overlay(MessageOverlay(cardType: cardType, messageIndex: randomMessageIndex))
            
            VStack {
                NavigationLink(destination: CardListView().environmentObject(appState)) {
                    Text("BACK")
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(width: 147, height: 52)
                        .foregroundColor(Color.black.opacity(0.8))
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.3), lineWidth: 12)
                        )
                        .shadow(radius: 100)
                }
                .padding(.top, 650)
                .padding(.horizontal, 300)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            randomMessageIndex = Int.random(in: 0..<cardType.messages.count)
        }
    }
}

// MARK: - Message Overlay
struct MessageOverlay: View {
    let cardType: CardType
    let messageIndex: Int
    
    var body: some View {
        VStack {
            Text("來自宇宙的訊息...")
                .font(.title3)
                .foregroundColor(Color.black.opacity(0.8))
                .padding(.bottom, 18)
                
            VStack {
                Text(cardType.messages[messageIndex])
                    .font(cardType == .lunch ? .title : .title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 85/255, green: 86/255, blue: 175/255))
                    .padding(2)
            }
            .padding()
            .frame(width: 350, height: nil, alignment: .center)
            .frame(minHeight: 130)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.3))
            )
            .padding(.bottom, 330)
        }
    }
}

#Preview("Result - Work") {
    NavigationView {
        ResultView(cardType: .work)
            .environmentObject(AppState())
    }
}

#Preview("Result - Love") {
    NavigationView {
        ResultView(cardType: .love)
            .environmentObject(AppState())
    }
}

#Preview("Result - Future") {
    NavigationView {
        ResultView(cardType: .future)
            .environmentObject(AppState())
    }
}

#Preview("Result - Lunch") {
    NavigationView {
        ResultView(cardType: .lunch)
            .environmentObject(AppState())
    }
}
