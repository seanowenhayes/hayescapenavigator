import SwiftUI

@main
struct HayescapeNavigatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().ignoresSafeArea(edges: .top) 
        }.windowStyle(.hiddenTitleBar)
    }
}
