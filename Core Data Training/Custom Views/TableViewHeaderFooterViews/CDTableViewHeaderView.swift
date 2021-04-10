//
//  CDTableViewHeaderView.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

class CDTableViewHeaderView: UITableViewHeaderFooterView {
    
    static let reuseID = "CDTableViewHeaderView"
    
    private let titleLabel = CDLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .black)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func set(title: String) { titleLabel.text = title }
    
}
