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
            LottieView(animation: .named("Flow 1.json"))
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
    let osmessages: String
}

struct ImageOverlay: View {
    
    let bundles: [TextBundle1] = [
        TextBundle1(messages: "You will not be disappointed", osmessages: "你不會失望的"),
        TextBundle1(messages: "Do it early", osmessages: "及早開始"),
        TextBundle1(messages: "Let it go", osmessages: "放下吧！"),
        TextBundle1(messages: "Ask your mother", osmessages: "去問你媽"),
        TextBundle1(messages: "Ask for help", osmessages: "請人幫忙"),
        TextBundle1(messages: "Don't be silly", osmessages: "別傻了！"),
        TextBundle1(messages: "Go for it", osmessages: "快去吧！"),
        TextBundle1(messages: "Follow your heart", osmessages: "相信你的直覺"),
        TextBundle1(messages: "No", osmessages: "不行"),

    ]


    
    @State private var randomBundleIndex = Int.random(in: 0..<9)

    
    var body: some View {
        VStack {
            Text("A message from the universe...")
                .font(.title3)
                .foregroundColor(Color.black.opacity(Double(0.8)))
                .padding(.bottom, 18)
            VStack {
                
                Text(bundles[randomBundleIndex].messages)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 85/255, green: 86/255, blue: 175/255))
                    .padding(.bottom, 4)

                Text(bundles[randomBundleIndex].osmessages)
                    .font(.title3)
                    .foregroundColor(Color(red: 85/255, green: 86/255, blue: 175/255))
                    .opacity(0.7)
                  
            }
            .padding()
            .frame(width: 350, height: nil, alignment: .center) // 移除高度限制，允許內容增長
           .frame(minHeight: 125) // 設置最小高度
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
