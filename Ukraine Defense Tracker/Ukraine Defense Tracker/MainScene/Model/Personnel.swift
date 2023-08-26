//
//  Personnel.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import Foundation

struct Personnel: Decodable {
    let date: String?
    let day, personnel: Int?
    let welcomePersonnel: String?
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case welcomePersonnel = "personnel*"
        case pow = "POW"
    }
}
