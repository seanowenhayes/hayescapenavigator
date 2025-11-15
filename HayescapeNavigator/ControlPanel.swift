//
//  ControlPanel.swift
//  HayescapeNavigator
//
//  Created by sean on 15/11/25.
//

import SwiftUI
import WebKit

struct ControlPanel: View {
    var page: WebPage
    @Binding var isVisible: Bool
    @State private var url = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Where to? ", text: $url)
                Button("Go") {
                    page.load(URLRequest(url: URL(string: url)!))
                    isVisible = false
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.all, 5)
        .border(.blue)
        .background(.ultraThinMaterial)
        
    }
}

#Preview {
    let page = WebPage()
    ControlPanel(page: page, isVisible: .constant(true))
}
