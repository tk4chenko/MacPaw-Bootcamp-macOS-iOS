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
        viewModel.coordinatorDelegate = self
        let viewController = MainViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func openDetailsViewController(_ loss: Loss) {
        let viewController = DetailViewController(loss: loss)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func openWebViewController(with path: WebViewURL) {
        let coordinator = WebViewCoordinator(navigationController: navigationController, path: path)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
