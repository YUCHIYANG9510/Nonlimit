//
//  ResultView4.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/16.
//

import SwiftUI
import Lottie

struct ResultView4: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .topLeading) {
            LottieView(animation: .named("lunch-result.json"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .overlay(ImageOverlay4())
            
            VStack {
                // 修改為返回到新的 CardListView 實例，保持已選中的卡片索引
                NavigationLink(destination: CardListView().environmentObject(appState)) {
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

struct TextBundle4 {
    let messages: String
}

struct ImageOverlay4: View {
    let bundles: [TextBundle4] = [
        TextBundle4(messages: "拉麵 🍜"),
        TextBundle4(messages: "披薩 🍕"),
        TextBundle4(messages: "火鍋 🍲"),
        TextBundle4(messages: "水餃 🥟"),
        TextBundle4(messages: "咖哩飯 🍛"),
        TextBundle4(messages: "三明治 🥪"),
        TextBundle4(messages: "義大利麵 🍝"),
        TextBundle4(messages: "漢堡薯條 🍟"),
        TextBundle4(messages: "壽司 🍱"),
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
    ResultView4()
}
