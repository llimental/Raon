//
//  WebView.swift
//  SeoulCultureMoa
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
