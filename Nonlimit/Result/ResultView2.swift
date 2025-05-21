//
//  ResultView2.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/16.
//

import SwiftUI
import Lottie

struct ResultView2: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var animateGradient: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            LottieView(animation: .named("love-result.json"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .overlay(ImageOverlay2())
            
            VStack {
                NavigationLink(destination: CardListView()) {
                    Text("BACK")
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(width: 147, height: 52)
                        .foregroundColor(Color.black.opacity(Double(0.8)))
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
    }
}

struct TextBundle2 {
    let messages: String
}

struct ImageOverlay2: View {
    let bundles: [TextBundle2] = [
        TextBundle2(messages: "感情的問題一律建議分手"),
        TextBundle2(messages: "單身比和錯的人在一起更好"),
        TextBundle2(messages: "愛真的需要勇氣"),
        TextBundle2(messages: "去問你媽"),
        TextBundle2(messages: "下一個會更好"),
        TextBundle2(messages: "顯而易見"),
        TextBundle2(messages: "當然"),
        TextBundle2(messages: "怎麼可能"),
        TextBundle2(messages: "相信你的直覺"),
    ]

    @State private var randomBundleIndex = Int.random(in: 0..<9)
    
    var body: some View {
        VStack {
            Text("來自宇宙的訊息...")
                .font(.title3)
                .foregroundColor(Color.black.opacity(Double(0.8)))
                .padding(.bottom, 18)
            VStack {
                Text(bundles[randomBundleIndex].messages)
                    .font(.title2)
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
    


#Preview {
    ResultView2()
}
