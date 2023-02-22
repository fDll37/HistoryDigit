//
//  WebView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 22.02.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    
    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

