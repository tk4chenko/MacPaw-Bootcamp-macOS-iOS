//
//  MainViewController.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    var openDetailsScreen: ((Loss)->Void)?
    
    var openWebViewController: ((WebViewURL)->Void)?
    
    private var selectedDate = Date(dateString: "2023-08-10")
    
    private let viewModel: MainViewModel
    
    private lazy var tableView: UITableView = {
        $0.frame = view.bounds
        $0.dataSource = self
        $0.delegate = self
        $0.sectionHeaderTopPadding = 0
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.register(LossTableViewCell.self, forCellReuseIdentifier: LossTableViewCell.identifier)
        $0.register(MainHeader.self, forHeaderFooterViewReuseIdentifier: MainHeader.identifier)
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
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return $0
    }(UILabel())
    
    private let leftItemLabel: UILabel = {
        $0.text = "Glory to Ukraine 🇺🇦"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
        view.backgroundColor = .white
        datePicker.date = selectedDate
        let leftItem = UIBarButtonItem(customView: leftItemLabel)
        navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(customView: datePicker)
        navigationItem.rightBarButtonItem = rightItem
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        view.addSubview(tableView)
        view.addSubview(noDataLabel)
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        if let losses = viewModel.losses, losses.contains(where: { $0.date == selectedDate.formatToString() }) {
            noDataLabel.isHidden = true
            tableView.isHidden = false
        } else {
            noDataLabel.isHidden = false
            tableView.isHidden = true
        }
        if let index = viewModel.losses?.firstIndex(where: { $0.date == selectedDate.formatToString() }) {
            tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
        }
    }

}

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

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let loss = viewModel.losses?[indexPath.row] {
            self.openDetailsScreen?(loss)
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        75
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainHeader.identifier ) as? MainHeader else { return nil}
        headerView.openWebViewController = { [weak self] path in
            self?.openWebViewController?(path)
        }
        return headerView
    }
}
