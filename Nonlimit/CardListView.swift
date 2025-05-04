//
//  CardListView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

struct CardListView: View {
    
    @State private var randomBundleIndex = Int.random(in: 0..<3)
    
    var body: some View {
                NavigationView {
                        VStack(alignment: .leading) {
                            Text("I want to understand...")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 16)
                                .padding(.bottom, 4)
                                .padding(.leading, 32)

                            Text("Choose the topic you are interested in")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 196/255, green: 199/255, blue: 246/255))
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 32)

                            ScrollView {
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                    CardView(imageName: "love" , title: "Love")
                                    CardView(imageName: "love", title: "Health")
                                    CardView(imageName: "love", title: "Money")
                                    CardView(imageName: "love", title: "Work")
                                    CardView(imageName: "love", title: "Relation")
                                    CardView(imageName: "love", title: "Life")
                                }
                                .padding()
                            }
                        }
                        .background(Color(red: 65/255, green: 70/255, blue: 151/255))
                        .overlay(SplashView())
                        .containerRelativeFrame([.horizontal, .vertical])
                    }
                .navigationBarBackButtonHidden(true)

                    
                }
                
                }
                
                

        
    
struct CardView: View {
    let imageName: String
    let title: String

    var body: some View {
        NavigationLink(destination: CardDetailView(icon: imageName, title: title)) {
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 134, height: 134)
                    .font(.title)

                Text(title)
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red:51/255, green:56/255, blue: 144/255))
            )
        }
        
    }
    
}




#Preview {
    CardListView()
}
