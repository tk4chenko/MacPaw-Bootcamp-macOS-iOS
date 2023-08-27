//
//  EquipmentTableViewCell.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

final class EquipmentTableViewCell: UITableViewCell, IdentifiableCell {
    
    private let nameLabel = UILabel(
        textColor: .black,
        textAlignment: .left,
        fontSize: 16,
        fontWeight: .medium,
        numberOfLines: 0
    )
    
    private let amountLabel = UILabel(
        textColor: .black,
        textAlignment: .left,
        fontSize: 16,
        fontWeight: .medium,
        numberOfLines: 0
    )
    
    private let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func setupCell(with equipment: (String, Int)) {
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 8
        nameLabel.text = equipment.0
        amountLabel.text = String(equipment.1)
    }
    
    private func commonInit() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(nameLabel)
        containerView.addSubview(amountLabel)
        contentView.addSubview(containerView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: 14
            ),
            containerView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 7
            ),
            containerView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -14
            ),
            containerView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -7
            ),
            
            nameLabel.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 14
            ),
            nameLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            ),
            
            amountLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -14
            ),
            amountLabel.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            )
        ])
    }
}
