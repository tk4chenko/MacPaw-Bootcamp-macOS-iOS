//
//  Date + Extension.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import Foundation

extension Date {
    func formatToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    init(dateString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            self = date
        } else {
            self = Date()
        }
    }
}
