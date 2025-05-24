//
//  ResultView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI
import Lottie

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var animateGradient: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            LottieView(animation: .named("work-result.json"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .overlay(ImageOverlay())
            
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

struct TextBundle1 {
    let messages: String
}

struct ImageOverlay: View {
    let bundles: [TextBundle1] = [
        TextBundle1(messages: "要記得打卡"),
        TextBundle1(messages: "領完年終再走"),
        TextBundle1(messages: "先跑就對了！"),
        TextBundle1(messages: "該下班了"),
        TextBundle1(messages: "不是你的問題"),
        TextBundle1(messages: "相信你的直覺"),
        TextBundle1(messages: "這裡不是你該待的地方"),
        TextBundle1(messages: "不可能"),
        TextBundle1(messages: "放棄吧"),
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
    ResultView()
}
