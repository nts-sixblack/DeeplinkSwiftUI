//
//  ContentView.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appNavigation: AppNavigation
    var body: some View {
        TabView(selection: $appNavigation.activeTab) {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Text("Home")
                }
            
            SettingView()
                .tag(Tab.settings)
                .tabItem {
                    Text("Setting")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppNavigation())
}
