//
//  WebViewModel.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 22.02.2023.
//

import Foundation
import SwiftUI
import WebKit

class WebViewModel: ObservableObject {
    
    let webView: WKWebView
    let url: URL

    init(insideUrl: String) {
        webView = WKWebView(frame: .zero)
        url = URL(string: insideUrl)!
        loadUrl()
        
    }
    
    func loadUrl() {
        webView.load(URLRequest(url: url))
    }
    
    
}
