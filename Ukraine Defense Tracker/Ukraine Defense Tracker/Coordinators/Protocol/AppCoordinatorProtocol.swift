//
//  AppCoordinatorProtocol.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    var window: UIWindow { get }
    func openMainScene()
}
