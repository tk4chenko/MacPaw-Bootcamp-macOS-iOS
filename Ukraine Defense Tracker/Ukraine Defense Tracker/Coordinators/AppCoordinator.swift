//
//  AppCoordinator.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class AppCoordinator: AppCoordinatorProtocol {
    
    weak var parentCoordinator: Coordinator?
    
    let window: UIWindow
    
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        openMainScene()
    }
    
    func openMainScene() {
        let coordinator = MainCoordinator(navigationController: UINavigationController())
        window.rootViewController = coordinator.navigationController
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}
