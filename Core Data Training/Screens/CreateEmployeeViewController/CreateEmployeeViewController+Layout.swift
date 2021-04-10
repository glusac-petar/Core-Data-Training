//
//  CreateEmployeeViewController+Layout.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import UIKit

extension CreateEmployeeViewController {
    
    func layoutUI() {
        let containerView = UIView()
        containerView.backgroundColor = .lightBlue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.addSubviews(nameLabel, nameTextField, locationLabel, locationTextField, employeeTypeSegmentedControl)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 142),

            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 80),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            locationLabel.widthAnchor.constraint(equalToConstant: 80),
            locationLabel.heightAnchor.constraint(equalToConstant: 30),
            
            locationTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
            locationTextField.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 30),
            locationTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            locationTextField.heightAnchor.constraint(equalToConstant: 30),
            
            employeeTypeSegmentedControl.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10),
            employeeTypeSegmentedControl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 19),
            employeeTypeSegmentedControl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -19),
            employeeTypeSegmentedControl.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}
