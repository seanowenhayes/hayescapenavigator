import SwiftUI
import WebKit

struct WebPanel: View {
    @State private var page = WebPage()
    @State private var showTabSelection: Bool = false

    
        var body: some View {
            VStack {
                if showTabSelection {
                    Text(page.title)
                }
                WebView(page)
            }
            .onAppear {
                page.load(URLRequest(url: URL(string: "https://www.swift.org")!))
            }.onKeyPress { event in
                if event.modifiers.contains(.command) {
                  if event.characters.contains("t") {
                      showTabSelection.toggle()
                      return .handled
                  }
                    if event.characters.contains("r") {
                        page.reload()
                        return .handled
                    }
                }
                return .ignored
            }
        }
}


#Preview {
    WebPanel()
}
