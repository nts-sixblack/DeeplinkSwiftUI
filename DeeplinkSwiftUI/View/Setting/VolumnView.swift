//
//  VolumnView.swift
//  DeeplinkSwiftUI
//
//  Created by Thanh Sau on 06/01/2024.
//

import SwiftUI

struct VolumnView: View {
    
    var dictionary: [String:String]
    
    var body: some View {
        VStack {
            if dictionary.isEmpty {
                Text("Volumn view")
            } else {
                ForEach(dictionary.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    Text("\(key): \(value)")
                }
            }
        }
    }
}

#Preview {
    VolumnView(dictionary: [:])
}
