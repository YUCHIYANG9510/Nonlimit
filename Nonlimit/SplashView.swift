//
//  SplashView.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isFinished = false
    
    
    var body: some View {
        
        if !isFinished {
            
            NavigationView {
                VStack {
                    Image(.splash)
                        .resizable()
                        .frame(width: 150, height: 150)
                    Text("QUESTION & ANSWER")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 254/255, green: 129/255, blue: 248/255))
                        .italic()
                    
                        .padding()
                    
                }
                
                .containerRelativeFrame([.horizontal, .vertical])
                .background(Color(red: 65/255, green: 70/255, blue: 151/255))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                        withAnimation {
                            isFinished.toggle()
                        }
                    }
                }
            }
        }
        
    }
    
}
#Preview {
    SplashView()
}
