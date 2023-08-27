//
//  MainViewController+DataSource.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.losses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LossTableViewCell.identifier) as? LossTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        if let loss = viewModel.losses?[indexPath.row] {
            cell.setupCell(with: loss)
        }
        return cell
    }
    
}
