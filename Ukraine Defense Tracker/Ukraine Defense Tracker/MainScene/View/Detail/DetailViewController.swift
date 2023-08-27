//
//  DetailViewController.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    let loss: Loss
    
    required init(loss: Loss) {
        self.loss = loss
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func setupUI() {
        title = "Equipment losses"
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
}
