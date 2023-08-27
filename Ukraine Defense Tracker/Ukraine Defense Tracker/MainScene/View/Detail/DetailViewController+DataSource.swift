//
//  DetailViewController+DataSource.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        loss.equipment.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EquipmentTableViewCell.identifier) as? EquipmentTableViewCell else { return UITableViewCell() }
        let item = loss.equipment.sorted(by: { $0.key < $1.key })[indexPath.row]
        cell.setupCell(with: (item.key, item.value))
        cell.selectionStyle = .none
        return cell
    }
}
