//
//  AppData.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import Foundation

class AppNavigation: ObservableObject {
    @Published var activeTab: Tab = .home
    @Published var homeTab: [HomeTab] = []
    @Published var settingTab: [SettingTab] = []
}
