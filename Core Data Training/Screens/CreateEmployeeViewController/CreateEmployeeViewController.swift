//
//  CreateEmployeeViewController.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import UIKit

protocol CreateEmployeeViewControllerDelegate: class {
    func didInsertEmployee(employee: Employee)
}

class CreateEmployeeViewController: UIViewController {
    
    let nameLabel = CDLabel(font: UIFont.systemFont(ofSize: 17.5, weight: .semibold), textColor: .black, text: "Name:")
    let nameTextField = CDTextField(placeholder: "Enter Name")
    let locationLabel = CDLabel(font: UIFont.systemFont(ofSize: 17.5, weight: .semibold), textColor: .black, text: "Location:")
    let locationTextField = CDTextField(placeholder: "City, Country")
    let employeeTypeSegmentedControl = CDSegmentedControl(items: ["Executive", "Management", "Staff"])
    
    weak var delegate: CreateEmployeeViewControllerDelegate!

    var company: Company!
    
    init(delegate: CreateEmployeeViewControllerDelegate, company: Company) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        self.company = company
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        layoutUI()
    }
    
    private func configureViewController() {
        view.backgroundColor = .darkBlue
        title = "Create Employee"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelDidTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDidTap))
    }
    
    @objc private func cancelDidTap() { dismiss(animated: true) }
        
    @objc private func saveDidTap() {
        guard let name = nameTextField.text, let location = locationTextField.text, let type = employeeTypeSegmentedControl.titleForSegment(at: employeeTypeSegmentedControl.selectedSegmentIndex) , !name.isEmpty, !location.isEmpty else {
            presentAlert(title: "Woops!", message: "All inputs must be provided to save the employee.")
            return
        }
        
        if let employee = CoreDataManager.shared.insertEmployee(name: name, location: location, type: type, company: company) {
            dismiss(animated: true) { self.delegate.didInsertEmployee(employee: employee) }
        }
        else { presentAlert(title: "Woops!", message: "There was an error creating this employee. Please try again.") }
    }
    
}
