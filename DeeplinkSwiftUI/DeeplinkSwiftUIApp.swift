//
//  DeeplinkSwiftUIApp.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import SwiftUI

@main
struct DeeplinkSwiftUIApp: App {
    
    @StateObject var appNavigation = AppNavigation()
    
//    lazy var deeplinkCoordinator: DeeplinkCoordinator = {
//        return DeeplinkCoordinator(handlers: [
//            HomeDeeplinkHandler(appNavigation: appNavigation),
//            SettingDeeplinkHandler(appNavigation: appNavigation)
//        ])
//    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appNavigation)
            //            MARK: handle Deep link
                .onOpenURL(perform: { url in
                    /// deeplink: test
                    let deeplinkCoordinator = DeeplinkCoordinator(handlers: [
                        HomeDeeplinkHandler(appNavigation: appNavigation),
                        SettingDeeplinkHandler(appNavigation: appNavigation)
                    ])
                    
                    deeplinkCoordinator.handleURL(url)
                })
        }
    }
}
