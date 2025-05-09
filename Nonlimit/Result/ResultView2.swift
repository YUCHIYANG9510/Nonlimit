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
    let osmessages: String
}

struct ImageOverlay2: View {
    let bundles: [TextBundle2] = [
        TextBundle2(messages: "They're not the one", osmessages: "他/她不是對的人"),
        TextBundle2(messages: "Make the first move", osmessages: "主動出擊"),
        TextBundle2(messages: "Wait a little longer", osmessages: "再等等看"),
        TextBundle2(messages: "Open your heart", osmessages: "敞開心扉"),
        TextBundle2(messages: "Look elsewhere", osmessages: "看看其他選擇"),
        TextBundle2(messages: "Cherish what you have", osmessages: "珍惜現在擁有的"),
        TextBundle2(messages: "Don't rush", osmessages: "別操之過急"),
        TextBundle2(messages: "Say what you feel", osmessages: "說出你的感受"),
        TextBundle2(messages: "Time will tell", osmessages: "時間會證明一切"),
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
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 85/255, green: 86/255, blue: 175/255))
                    .padding(.bottom, 4)

                Text(bundles[randomBundleIndex].osmessages)
                    .font(.title3)
                    .foregroundColor(Color(red: 85/255, green: 86/255, blue: 175/255))
                    .opacity(0.7)
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
