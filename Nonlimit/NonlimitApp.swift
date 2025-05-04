//
//  NonlimitApp.swift
//  Nonlimit
//
//  Created by Designer on 2024/4/13.
//

import SwiftUI

@main
struct NonlimitApp: App {
    @StateObject private var appViewModel = AppViewModel()
       
       var body: some Scene {
           WindowGroup {
               MainView()
                   .environmentObject(appViewModel)
           }
       }
   }
