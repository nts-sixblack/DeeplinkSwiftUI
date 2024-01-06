//
//  HomeView.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var appNavigation: AppNavigation
    
    var body: some View {
        NavigationStack(path: $appNavigation.homeTab) {
            VStack {
                NavigationLink(value: HomeTab.favorite) {
                    Text("Favorite view")
                }
                
                NavigationLink(value: HomeTab.list) {
                    Text("List view")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(for: HomeTab.self) { item in
                switch item {
                case .favorite: FavoriteView()
                case .list: ListView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
