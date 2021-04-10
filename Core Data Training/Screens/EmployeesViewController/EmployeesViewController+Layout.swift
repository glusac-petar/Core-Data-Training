//
//  EmployeesViewController+Layout.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import UIKit

extension EmployeesViewController {
    
    func layoutUI() {
        view.addSubviews(UIView(), tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
