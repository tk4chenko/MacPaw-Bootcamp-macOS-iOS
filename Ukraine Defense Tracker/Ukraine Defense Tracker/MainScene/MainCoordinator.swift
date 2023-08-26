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
        let viewContoller = MainViewController(viewModel: viewModel)
        viewContoller.openDetailsScreen = { [weak self] losses, day in
            self?.openDetailsViewController((losses, day))
        }
        self.navigationController.pushViewController(viewContoller, animated: true)
    }
    
    func openDetailsViewController(_ data: (Int, Int)) {
        let viewController = DetailViewController(overview: "\(data.0) units were destroyed during \(data.1) days of war.")
        if let sheet = viewController.sheetPresentationController {
            sheet.prefersGrabberVisible = true
                sheet.detents = [.medium()]
        }
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
