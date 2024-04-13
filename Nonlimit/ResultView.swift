//
//  ResultView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

struct ImageTextBundle {
    let imageName: String
    let text: String
}

struct ResultView: View {
    
    let bundles: [ImageTextBundle] = [
            ImageTextBundle(imageName: "drink", text: "一天三杯"),
            ImageTextBundle(imageName: "spring", text:" 來去壯遊"),
            ImageTextBundle(imageName: "trash", text: "我是垃圾")
        ]

    @State private var randomBundleIndex = Int.random(in: 0..<3)

    var body: some View {
        VStack(spacing:28) {
                Image(bundles[randomBundleIndex].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                    .padding()

                Text(bundles[randomBundleIndex].text)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
            }
            .onAppear {
                randomBundleIndex = Int.random(in: 0..<3)
            }

        }
}

#Preview {
    ResultView()
}
