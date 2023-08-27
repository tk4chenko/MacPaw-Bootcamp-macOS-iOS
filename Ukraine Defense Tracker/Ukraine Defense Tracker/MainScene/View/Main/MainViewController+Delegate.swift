//
//  MainViewController+Delegate.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let loss = viewModel.losses?[indexPath.row] {
            viewModel.openDetailsViewController(loss)
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        75
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainHeader.identifier ) as? MainHeader else { return nil}
        headerView.openWebViewController = { [weak self] path in
            self?.viewModel.openWebViewController(with: path)
        }
        return headerView
    }
}
