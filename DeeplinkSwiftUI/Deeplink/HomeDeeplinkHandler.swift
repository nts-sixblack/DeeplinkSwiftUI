//
//  HomeDeeplinkHandler.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import Foundation
import SwiftUI

final class HomeDeeplinkHandler: DeeplinkHandlerProtocol {
    
    @ObservedObject var appNavigation: AppNavigation
    
    init(appNavigation: AppNavigation) {
        self.appNavigation = appNavigation
    }
    
    func canOpenURL(_ url: URL) -> Bool {
        return url.absoluteString.hasPrefix("test://\(Tab.home.rawValue)")
        
    }
    
    func openURL(_ url: URL) {
        guard canOpenURL(url) else {
            return
        }
        
        appNavigation.activeTab = .home
        
        switch url.path.dropFirst() {
        case "favorite":
            appNavigation.homeTab.append(.favorite)
            
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                // Kiểm tra queryItems có tồn tại
                if let queryItems = components.queryItems {
                    // Duyệt qua từng tham số và giá trị tương ứng
                    for queryItem in queryItems {
                        if let value = queryItem.value {
                            print("Tham số: \(queryItem.name), Giá trị: \(value)")
                        }
                    }
                }
            }
            
        case "list":
            appNavigation.homeTab.append(.list)
        default:
            break
        }
    }
}
