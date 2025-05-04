//
//  CardDetailView4.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/16.
//

import SwiftUI


struct CardDetailView4: View {
    let icon: String
    let title: String
    
    @State private var animateGradient: Bool = false
    
    var body: some View {
   
            VStack {
                Image("askQuestion")
                    .resizable()
                    .frame(width: 233, height: 217)
                Text("Keep Calm and Ask Future Question")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                NavigationLink(destination: ResultView()) {
                    Text("SUBMIT")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 147, height: 52)
                        .background(Color(red: 254/255, green: 129/255, blue: 248/255))
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .containerRelativeFrame([.horizontal, .vertical])
            .background {
                LinearGradient(gradient: Gradient(colors: [Color(red: 65/255, green: 70/255, blue: 151/255),
                                                           Color(red: 88/255, green: 85/255, blue: 175/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
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
