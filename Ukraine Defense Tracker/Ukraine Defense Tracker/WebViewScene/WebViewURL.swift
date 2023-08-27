//
//  WebViewURL.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import Foundation

enum WebViewURL: String {
    case warMap = "https://deepstatemap.live/#6/49.438/32.053"
    case donation = "https://savelife.in.ua/DONATE/"
    
    func initializeURL() -> URL {
        switch self {
        case .warMap:
            if let pathURL = URL(string: WebViewURL.warMap.rawValue) {
                return pathURL
            } else {
                fatalError("Invalid URL for privacypolicy")
            }
        case .donation:
            if let pathURL = URL(string: WebViewURL.donation.rawValue) {
                return pathURL
            } else {
                fatalError("Invalid URL for termsAndConditions")
            }
        }
    }
    
    var title: String {
        switch self {
        case .warMap:
            return "War Map"
        case .donation:
            return "Donation"
        }
    }
}
