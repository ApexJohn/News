//
//  NewsDetailsWebViewController.swift
//  NBCU
//
//  Created by Basheer Malaa on 5/28/18.
//  Copyright © 2018 Basheer Inc. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailsWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var newsItem: NewsItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.newsItem.label
        self.webView.navigationDelegate = self
        
        if let url = URL(string: self.newsItem.url) {
            let detailsRequest = URLRequest(url: url)
            self.webView.load(detailsRequest)
        }
    }
}

extension NewsDetailsWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.loadingActivityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loadingActivityIndicator.stopAnimating()
    }
}
