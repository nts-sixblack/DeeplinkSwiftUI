//
//  SettingView.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var appNavigation: AppNavigation
    
    var body: some View {
        NavigationStack(path: $appNavigation.settingTab) {
            VStack {
                Button {
                    appNavigation.settingTab.append(.volumn(["abc":"xyz"]))
                } label: {
                    Text("Volumn")
                }
                
                NavigationLink(value: SettingTab.video) {
                    Text("Video")
                }
            }
            .navigationDestination(for: SettingTab.self) { item in
                switch item {
                case .video: VideoView()
                case .volumn(let data): VolumnView(dictionary: data)
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
