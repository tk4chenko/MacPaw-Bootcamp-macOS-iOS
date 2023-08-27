//
//  Loss.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import Foundation

struct Loss {
    var date: String = ""
    var day: Int = 0
    var personnel: Int = 0
    var equipment: [String: Int] = [:]
}
