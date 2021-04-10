//
//  CDEmployeeTableViewCell.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import UIKit

class CDEmployeeTableViewCell: UITableViewCell {
    
    static let reuseID = "CDEmployeeTableViewCell"
    
    private let informationLabel = CDLabel(font: UIFont.systemFont(ofSize: 18, weight: .medium), textColor: .white)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .teal
        selectionStyle = .none
        contentView.addSubview(informationLabel)
        
        NSLayoutConstraint.activate([
            informationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            informationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            informationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            informationLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func set(employee: Employee) {
        if let name = employee.name, let location = employee.location { informationLabel.text = "\(name) - \(location)" }
    }
    
}
