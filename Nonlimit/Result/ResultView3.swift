//
//  ResultView3.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/16.
//

import SwiftUI
import Lottie

struct ResultView3: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var animateGradient: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            LottieView(animation: .named("future-result.json"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .overlay(ImageOverlay3())
            
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

struct TextBundle3 {
    let messages: String
}

struct ImageOverlay3: View {
    let bundles: [TextBundle3] = [
        TextBundle3(messages: "一切都是過程"),
        TextBundle3(messages: "別怕未來，你可能撐不到那麼遠"),
        TextBundle3(messages: "態度決定你的高度"),
        TextBundle3(messages: "好好休息"),
        TextBundle3(messages: "沒有比較就沒有傷害"),
        TextBundle3(messages: "人生的意義在於感受迷惘"),
        TextBundle3(messages: "該買機票了"),
        TextBundle3(messages: "慢慢來比較快"),
        TextBundle3(messages: "船到橋頭自然直"),
        TextBundle3(messages: "舊的不去新的不來"),
        TextBundle3(messages: "專注呼吸就好"),
        TextBundle3(messages: "放下它"),
        TextBundle3(messages: "接受它"),
        TextBundle3(messages: "多得是～～你不知道的事"),

    ]

    @State private var randomBundleIndex = Int.random(in: 0..<14)
    
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
    ResultView3()
}
