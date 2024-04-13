//
//  PickCardView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

struct PickCardView: View {
    let selectedTopic: Topic

    var body: some View {
        ZStack {
            Color("background")
            VStack {
                Text("Choose the topic you are interested in")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                Spacer()
                Image(selectedTopic.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                Text(selectedTopic.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                NavigationLink(destination: ResultView()) {
                    Text("Take a step to explore")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("card"))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

enum Topic: String {
    case love = "Love"
    case health = "Health"
    case money = "Money"
    case work = "Work"
    case relationship = "Relationship"
    case lifestyle = "Lifestyle"

    var imageName: String {
        switch self {
        case .love:
            return "heart"
        case .health:
            return "drink"
        case .money:
            return "coin"
        case .work:
            return "ghost"
        case .relationship:
            return "flan"
        case .lifestyle:
            return "bird2"
        }
    }
}

#Preview {
    PickCardView(selectedTopic: .love)
}
