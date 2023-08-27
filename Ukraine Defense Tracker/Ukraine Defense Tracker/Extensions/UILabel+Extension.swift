//
//  UILabel+Extension.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

extension UILabel {
    
    convenience init(frame: CGRect = .zero, text: String? = nil, textColor: UIColor? = nil, textAlignment: NSTextAlignment = .center, fontSize: CGFloat = 16, fontWeight: UIFont.Weight = .regular, numberOfLines: Int = 0) {
        self.init()
        self.frame = frame
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = numberOfLines
        self.isUserInteractionEnabled = true
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    }
}
