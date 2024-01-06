//
//  Tab.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import Foundation

enum Tab: String, CaseIterable {
    case home, settings
}

enum HomeTab {
    case favorite, list
}

enum SettingTab: Hashable {
    case volumn([String:String])
    case video
}
