//
//  MainHeader.swift
//  CurrencyConverter
//
//  Created by Artem Tkachenko on 25.08.2023.
//

import UIKit

final class MainHeader: UITableViewHeaderFooterView, IdentifiableCell {
    
    private let stackView = UIStackView(axis: .horizontal, spacing: 14, distribution: .fillEqually)
    
    var openWebViewController: ((WebViewURL)->Void)?
    
    private let leftButton = CustomButton(text: "Donate to Army", image: "💪")
    private let rightButton = CustomButton(text: "Open War Map", image: "🗺️")
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupHeaderView()
    }
    
    private func setupHeaderView() {
        leftButton.tag = 0
        rightButton.tag = 1
        
        let leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        leftButton.addGestureRecognizer(leftTapGesture)
        
        let rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:)))
        rightButton.addGestureRecognizer(rightTapGesture)
    }
    
    @objc private func buttonTapped(_ sender: UITapGestureRecognizer) {
        guard let button = sender.view else {
            return
        }

        switch button.tag {
        case 0:
            openWebViewController?(.donation)
        case 1:
            openWebViewController?(.warMap)
        default:
            break
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.addArrangedSubviews([leftButton, rightButton])
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
        ])
    }
}
