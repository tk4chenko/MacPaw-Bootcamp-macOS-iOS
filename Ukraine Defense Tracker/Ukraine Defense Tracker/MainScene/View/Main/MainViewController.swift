//
//  MainViewController.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 26.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var selectedDate = Date(dateString: MainTitle.selectedDate.description)
    
    let viewModel: MainViewModelProtocol
    
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
        $0.addTarget(self, action: #selector(datePickerValueChanged), for: .editingDidEnd)
        return $0
    }(UIDatePicker())
    
    private lazy var noDataLabel: UILabel = {
        $0.text = MainTitle.noDataTitle.description
        $0.textAlignment = .center
        $0.isHidden = true
        $0.frame = view.bounds
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return $0
    }(UILabel())
    
    private let leftItemLabel = UILabel(
        text: MainTitle.leftItemTitle.description,
        textColor: .black,
        fontSize: 18,
        fontWeight: .semibold
    )
    
    required init(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
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

private enum MainTitle {
    case selectedDate, noDataTitle, leftItemTitle
    
    var description: String {
        switch self {
        case .selectedDate:
            return "2023-08-10"
        case .noDataTitle:
            return "No data for this date"
        case .leftItemTitle:
            return "Glory to Ukraine 🇺🇦"
        }
    }
}
