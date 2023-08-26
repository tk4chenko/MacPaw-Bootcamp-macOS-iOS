//
//  Equipment.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import Foundation

struct Equipment: Codable {
    let date: String?
    let day, aircraft, helicopter, tank: Int?
    let apc, fieldArtillery, mrl, militaryAuto: Int?
    let fuelTank, drone, navalShip, antiAircraftWarfare: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
    }
}

