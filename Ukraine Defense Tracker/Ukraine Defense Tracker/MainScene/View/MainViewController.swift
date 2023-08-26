//
//  MainViewController.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    var openDetailsScreen: ((Int, Int) -> Void)?
    
    private var selectedDate = Date(dateString: "2023-08-10")
    
    private let viewModel: MainViewModel
    
    private lazy var tableView: UITableView = {
        $0.frame = view.bounds
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView())
    
    private lazy var datePicker: UIDatePicker = {
        $0.datePickerMode = .date
        $0.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .editingDidEnd)
        return $0
    }(UIDatePicker())
    
    private lazy var noDataLabel: UILabel = {
        $0.text = "No data for this date"
        $0.textAlignment = .center
        $0.isHidden = true
        $0.frame = view.bounds
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return $0
    }(UILabel())
    
    private let leftItemLabel: UILabel = {
        $0.text = "Glory to Ukraine 🇺🇦"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return $0
    }(UILabel())
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.loadData()
    }
    
    private func setupUI() {
        datePicker.date = selectedDate
        let leftItem = UIBarButtonItem(customView: leftItemLabel)
        navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(customView: datePicker)
        navigationItem.rightBarButtonItem = rightItem
        view.addSubview(tableView)
        view.addSubview(noDataLabel)
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        if let losses = viewModel.losses, losses.contains(where: { $0.date == selectedDate.formatToString() }) {
            noDataLabel.isHidden = true
        } else {
            noDataLabel.isHidden = false
        }
        tableView.reloadData()
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.losses?.first(where: { $0.date == selectedDate.formatToString() })?.losses.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = viewModel.losses?.first(where: { $0.date == selectedDate.formatToString() })?.losses.sorted(by: { $0.key < $1.key })[indexPath.row]
        cell.textLabel?.text = item?.key
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = viewModel.losses?.first(where: { $0.date == selectedDate.formatToString() })?.losses.sorted(by: { $0.key < $1.key })[indexPath.row],
           let day = viewModel.losses?.first(where: { $0.date == selectedDate.formatToString() })?.day {
            openDetailsScreen?(item.value, day)
        }
    }
}
