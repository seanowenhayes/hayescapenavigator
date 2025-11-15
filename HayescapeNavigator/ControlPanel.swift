import SwiftUI
import WebKit

struct ControlPanel: View {
    let searchProvider = "https://www.perplexity.ai/search/"
    var page: WebPage
    @Binding var isVisible: Bool
    @State private var url = ""
    
    func urlForUserInput(_ input: String) -> URL? {
        if let url = URL(string: input), url.scheme?.hasPrefix("http") == true {
            return url
        }
        if !input.hasPrefix("http://") && !input.hasPrefix("https://") {
            let withScheme = "https://" + input
            if let url = URL(string: withScheme), url.scheme?.hasPrefix("http") == true {
                return url
            }
        }
        return nil
    }
    
    func loadPage() {
        if let validURL = urlForUserInput(url) {
            page.load(URLRequest(url: validURL))
        } else {
            let query = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let searchURL = URL(string: "https://www.perplexity.ai/search/\(query)", encodingInvalidCharacters: true)!
            page.load(searchURL)
        }
        isVisible.toggle()
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Where to? ", text: $url, onCommit: loadPage)
                Button("Go", action: loadPage)
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
