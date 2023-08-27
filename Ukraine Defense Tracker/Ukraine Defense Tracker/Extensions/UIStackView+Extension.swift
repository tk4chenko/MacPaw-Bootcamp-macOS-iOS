//
//  UIStackView+Extension.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fillEqually) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
    
    func addArrangedSubviews(_ arrangedSubviews: [UIView]) {
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
}
