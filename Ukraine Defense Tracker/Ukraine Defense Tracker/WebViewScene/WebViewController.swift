//
//  WebViewController.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import WebKit

final class WebViewController: UIViewController {
    
    private lazy var webView = makeWebView()
    private let url: URL
    
    private let loadingIndicator = UIActivityIndicatorView(style: .medium)
    
    required init(url: WebViewURL) {
        self.url = url.initializeURL()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        hidesBottomBarWhenPushed = true
        view.addSubview(webView)
        webView.frame = view.bounds
        
        view.addSubview(loadingIndicator)
        loadingIndicator.center = view.center
        loadingIndicator.startAnimating()
        
        Task(priority: .userInitiated) {
            await getData()
        }
    }
    
    private func makeWebView() -> WKWebView {
        let preferenses = WKWebpagePreferences()
        preferenses.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = preferenses
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
        return webView
    }
    
    private func getData() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            webView.load(data, mimeType: "text/html", characterEncodingName: "utf-8", baseURL: url)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
    }
}
