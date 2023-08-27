//
//  LossTableViewCell.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import UIKit

final class LossTableViewCell: UITableViewCell, IdentifiableCell {
    
    private let dateLabel = UILabel(textColor: .black, textAlignment: .left, fontSize: 16, fontWeight: .medium, numberOfLines: 0)
    
    private let dayLabel = UILabel(textColor: .black, textAlignment: .left, fontSize: 28, fontWeight: .semibold, numberOfLines: 0)
    
    private let personnelLabel = UILabel(textColor: .black, textAlignment: .left, fontSize: 16, fontWeight: .medium, numberOfLines: 0)
    
    private let containerView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func setupCell(with loss: Loss) {
        containerView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 240/255, alpha: 1)
        containerView.layer.cornerRadius = 8
        dayLabel.text = "\(loss.day) days of war"
        dateLabel.text = loss.date.formatDate()
        personnelLabel.text = "Personnel losses: \(loss.personnel)"
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dayLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(personnelLabel)
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7),
            
            dayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            dayLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -18),
            
            dateLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: dayLabel.topAnchor, constant: -12),
            
            personnelLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            personnelLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
        ])
    }
}
