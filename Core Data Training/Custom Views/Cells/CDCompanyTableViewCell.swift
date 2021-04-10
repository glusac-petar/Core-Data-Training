//
//  CDCompanyTableViewCell.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

class CDCompanyTableViewCell: UITableViewCell {

    static let reuseID = "CDCompanyTableViewCell"
    
    private let companyImageView = CDImageView(cornerRadius: 19)
    private let nameLabel = CDLabel(font: UIFont.systemFont(ofSize: 18, weight: .medium), textColor: .white)
    
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
        contentView.addSubviews(companyImageView, nameLabel)
        
        NSLayoutConstraint.activate([
            companyImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            companyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            companyImageView.widthAnchor.constraint(equalToConstant: 38),
            companyImageView.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: companyImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func set(company: Company) {
        if let imageData = company.imageData, let image = UIImage(data: imageData), let name = company.name, let founded = company.founded {
            companyImageView.image = image
            nameLabel.text = "\(name) - Founded: \(founded.convertToString())"
        }
    }
    
}
