//
//  WebView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/26/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlToConnect: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: urlToConnect) else { return }

        let urlRequest = URLRequest(url: url)

        webView.load(urlRequest)
    }
}

#Preview {
    WebView(urlToConnect: "https://www.naver.com")
}
