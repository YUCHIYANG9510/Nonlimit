//
//  MainView.swift
//  Nonlimit
//
//  Created by Designer on 2025/5/4.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        if !appViewModel.hasSeenSplash {
            SplashView()
                .transition(.opacity)
        } else {
            NavigationView {
                CardListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AppViewModel())
}
