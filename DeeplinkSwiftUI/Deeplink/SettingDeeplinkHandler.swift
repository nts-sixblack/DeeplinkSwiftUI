//
//  SettingDeeplinkHandler.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import Foundation
import SwiftUI

final class SettingDeeplinkHandler: DeeplinkHandlerProtocol {
    
    @ObservedObject var appNavigation: AppNavigation
    
    init(appNavigation: AppNavigation) {
        self.appNavigation = appNavigation
    }
    
    func canOpenURL(_ url: URL) -> Bool {
        return url.absoluteString.hasPrefix("test://\(Tab.settings.rawValue)")
    }
    
    func openURL(_ url: URL) {
        guard canOpenURL(url) else {
            return
        }
        
        appNavigation.activeTab = .settings
        
        switch url.path.dropFirst() {
        case "volumn":
            var queryDictionary: [String:String] = [:]
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                // Kiểm tra queryItems có tồn tại
                if let queryItems = components.queryItems {
                    // Duyệt qua từng tham số và giá trị tương ứng
                    for queryItem in queryItems {
                        if let value = queryItem.value {
                            print("Tham số: \(queryItem.name), Giá trị: \(value)")
                            queryDictionary[queryItem.name] = value
                        }
                    }
                }
            }
            appNavigation.settingTab.append(.volumn(queryDictionary))
        case "video":
            appNavigation.settingTab.append(.video)
        default:
            print(url.path)
            break
        }
    }
    
    
}
