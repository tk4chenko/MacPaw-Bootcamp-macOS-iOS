//
//  DetailViewController.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    private let container: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let textView: UITextView = {
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.textContainer.maximumNumberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextView())

    init(overview: String) {
        self.textView.text = overview
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        view.addSubview(container)
        container.addSubview(textView)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            textView.topAnchor.constraint(equalTo: container.topAnchor, constant: 24),
            textView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
}
