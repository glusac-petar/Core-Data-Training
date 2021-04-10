//
//  CreateCompanyViewController+Layout.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

extension CreateCompanyViewController {
    
    func layoutUI() {
        let containerView = UIView()
        containerView.backgroundColor = .lightBlue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        containerView.addSubviews(companyImageView, selectImageButton, nameLabel, nameTextField, dateLabel, datePicker)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 375),
            
            companyImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            companyImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            companyImageView.widthAnchor.constraint(equalToConstant: 110),
            companyImageView.heightAnchor.constraint(equalToConstant: 110),
            
            selectImageButton.topAnchor.constraint(equalTo: companyImageView.bottomAnchor, constant: 10),
            selectImageButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            selectImageButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            selectImageButton.heightAnchor.constraint(equalToConstant: 35),
            
            nameLabel.topAnchor.constraint(equalTo: selectImageButton.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 80),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            nameTextField.topAnchor.constraint(equalTo: selectImageButton.bottomAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            datePicker.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            datePicker.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
}
