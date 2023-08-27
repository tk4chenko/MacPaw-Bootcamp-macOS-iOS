//
//  MainCoordinator.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    
    let navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        openMainViewController()
    }
    
    func openMainViewController() {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        viewController.openDetailsScreen = { [weak self] loss in
            self?.openDetailsViewController(loss)
        }
        viewController.openWebViewController = { [weak self] path in
            self?.openWebViewController(with: path)
        }
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func openDetailsViewController(_ loss: Loss) {
        let viewController = DetailViewController()
        viewController.loss = loss
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func openWebViewController(with path: WebViewURL) {
        let coordinator = WebViewCoordinator(navigationController: navigationController, path: path)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
