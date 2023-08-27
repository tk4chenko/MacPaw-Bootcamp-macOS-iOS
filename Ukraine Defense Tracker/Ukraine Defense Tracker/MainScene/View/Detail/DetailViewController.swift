//
//  DetailViewController.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var loss: Loss?
    
    private lazy var tableView: UITableView = {
        $0.frame = view.bounds
        $0.dataSource = self
        $0.delegate = self
        $0.sectionHeaderTopPadding = 0
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.register(EquipmentTableViewCell.self, forCellReuseIdentifier: EquipmentTableViewCell.identifier)
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        title = "Equipment losses"
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
    }
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        loss?.equipment.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EquipmentTableViewCell.identifier) as? EquipmentTableViewCell else { return UITableViewCell() }
        if let item = loss?.equipment.sorted(by: { $0.key < $1.key })[indexPath.row] {
            cell.setupCell(with: (item.key, item.value))
        }
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
