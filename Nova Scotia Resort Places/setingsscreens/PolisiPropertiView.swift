//
//  PolisiPropertiView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 05.10.2024.
//

import Foundation

import SwiftUI
import WebKit

struct PolisiPropertiView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}
