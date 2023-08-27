//
//  CustomButton.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

class CustomButton: UIView {
    
    private let label: UILabel = {
        $0.text = "Donate to Army"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    init(text: String, image: String) {
        iconImageView.image = UIImage(named: image)
        label.text = text
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let iconImageView = UIImageView(image: UIImage(named: "💪"), contentMode: .scaleAspectFit)
    
    private let stackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.addArrangedSubviews([iconImageView, label])
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65)
        ])
    }
    
}
