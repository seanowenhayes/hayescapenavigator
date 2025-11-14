//
//  WebPanel.swift
//  HayescapeNavigator
//
//  Created by Sean Hayes on 13/11/25.
//

import SwiftUI
import WebKit

struct WebPanel: View {
    @State private var page = WebPage()

    
        var body: some View {
            VStack {
                Text(page.title)
                WebView(page)
            }
            .onAppear {
                page.load(URLRequest(url: URL(string: "https://www.swift.org")!))
            }
        }
}


#Preview {
    WebPanel()
}
