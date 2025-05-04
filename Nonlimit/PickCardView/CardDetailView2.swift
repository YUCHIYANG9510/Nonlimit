//
//  CardDetailView2.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/16.
//

import SwiftUI
import Lottie

struct CardDetailView2: View {
    let icon: String
    let title: String
    
    @State private var animateGradient: Bool = false
    
    var body: some View {
   
            VStack {
            
                Text("Keep Calm and Ask Question...")
                    .padding()
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(Double(0.8)))
                
                LottieView(animation: .named("universe.json"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .resizable()
                    .frame(width: 350, height: 350)
                
                NavigationLink(destination: ResultView2()) {
                    Text("SUBMIT")
                        .font(.title)
                        .fontWeight(.medium)
                        .frame(width: 147, height: 52)
                        .background(Color.white)
                                 .cornerRadius(10)
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white.opacity(0.3), lineWidth: 12)
                                  )
                                 .shadow(radius: 100)
                    
                        .foregroundColor(Color.black.opacity(Double(0.8)))
                }
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
    CardListView()
}
