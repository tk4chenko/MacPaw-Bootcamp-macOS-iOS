//
//  UIImageView+Extension.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage? = nil, contentMode: UIImageView.ContentMode, borderColor: UIColor = .clear, borderWidth: CGFloat = 0) {
        self.init()
        self.image = image
        self.clipsToBounds = true
        self.contentMode = contentMode
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
