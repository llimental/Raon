//
//  WebView.swift
//  Raon
//
//  Created by Lust3r on 2/26/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    // MARK: - Public Properties
    let urlToConnect: String

    // MARK: - Private Properties
    private var webView: WKWebView

    // MARK: - Initializer
    init(urlToConnect: String) {
        self.urlToConnect = urlToConnect
        self.webView = WKWebView()
    }

    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: urlToConnect) else { return }

        let urlRequest = URLRequest(url: url)

        webView.load(urlRequest)
    }

    // MARK: - Public Functions
    func goBack() {
        webView.goBack()
    }

    func goForward() {
        webView.goForward()
    }

    func reload() {
        webView.reload()
    }
}

#Preview {
    WebView(urlToConnect: "https://www.naver.com")
}

struct CustomWebView: View {
    // MARK: - Public Properties
    let webView: WebView?

    // MARK: - Initializer
    init(url: String) {
        self.webView = WebView(urlToConnect: url)
    }

    // MARK: - Body
    var body: some View {
        webView
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        webView?.goBack()
                    }, label: {
                        Image(systemName: "arrowshape.backward")
                    })

                    Button(action: {
                        webView?.goForward()
                    }, label: {
                        Image(systemName: "arrowshape.forward")
                    })

                    Button(action: {
                        webView?.reload()
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                    })
                }
            }
    }
}
