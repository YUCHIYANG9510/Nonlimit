//
//  ResultView4.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/16.
//

import SwiftUI

struct ImageTextBundle4 {
    let imageName: String
    let text: String
}

struct ResultView4: View {
    
    let bundles: [ImageTextBundle4] = [
        ImageTextBundle4(imageName: "drink", text: "去一趟獨旅"),
        ImageTextBundle4(imageName: "spring", text:"聽一首搖滾樂"),
        ImageTextBundle4(imageName: "trash", text: "看一部偵探小說")
    ]
    
    @State private var randomBundleIndex = Int.random(in: 0..<3)
    @State private var animateGradient: Bool = false
    
    var body: some View {
        VStack {
            
            VStack(spacing:28) {
                Image(bundles[randomBundleIndex].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                    .padding(.top, 40)
                    .padding(.horizontal, 48)
                
                Text(bundles[randomBundleIndex].text)
                    .font(.title)
                    .foregroundColor(Color(red: 85/255, green: 86/255, blue: 175/255))
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white.opacity(0.3))
                
            )
            .padding(.bottom, 40)
            NavigationLink(destination: CardListView()) {
                Text("HOME")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 147, height: 52)
                    .background(Color(red: 254/255, green: 129/255, blue: 248/255))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            randomBundleIndex = Int.random(in: 0..<3)
        }
        .navigationBarBackButtonHidden(true)
        .containerRelativeFrame([.horizontal, .vertical])
        .background {
            LinearGradient(gradient: Gradient(colors: [Color(red: 237/255, green: 220/255, blue: 244/255),
                                                       Color(red: 255/255, green: 229/255, blue: 255/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
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

#Preview {
    ResultView4()
}
