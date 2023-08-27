//
//  WebViewCoordinator.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

final class WebViewCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    var path: WebViewURL
    
    init(navigationController: UINavigationController, path: WebViewURL) {
        self.navigationController = navigationController
        self.path = path
    }
    
    func start() {
        let viewController = WebViewController(url: path)
        viewController.title = path.title
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
