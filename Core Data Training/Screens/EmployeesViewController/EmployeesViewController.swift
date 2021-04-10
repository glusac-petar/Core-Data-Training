//
//  EmployeesViewController.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import UIKit

class EmployeesViewController: UIViewController {
    
    let tableView = UITableView()
    
    var company: Company!
    var employees: [[Employee]] = [[]]
    
    init(company: Company) {
        super.init(nibName: nil, bundle: nil)
        self.company = company
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
        layoutUI()
        fetchData()
    }
    
    private func configureViewController() {
        view.backgroundColor = .darkBlue
        title = company.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonDidTap))
    }
    
    @objc private func addButtonDidTap() {
        let destinationVC = CDNavigationController(rootViewController: CreateEmployeeViewController(delegate: self, company: company))
        destinationVC.modalPresentationStyle = .overFullScreen
        present(destinationVC, animated: true)
    }
    
    private func configureTableView() {
        tableView.register(CDEmployeeTableViewCell.self, forCellReuseIdentifier: CDEmployeeTableViewCell.reuseID)
        tableView.register(CDTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: CDTableViewHeaderView.reuseID)
        tableView.backgroundColor = .clear
        tableView.separatorColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.removeExcessCells()
    }
    
    private func fetchData() {
        var executive = [Employee]()
        var managment = [Employee]()
        var staff = [Employee]()
        
        CoreDataManager.shared.fetchEmployees(for: company).forEach { (employee) in
            if employee.type == "Executive" { executive.append(employee) }
            else if employee.type == "Management" { managment.append(employee) }
            else { staff.append(employee) }
        }
        employees = [executive, managment, staff]
    }
    
}

extension EmployeesViewController: CreateEmployeeViewControllerDelegate {
    
    func didInsertEmployee(employee: Employee) {
        DispatchQueue.main.async {
            var section: Int
            if employee.type == "Executive" { section = 0 }
            else if employee.type == "Management" { section = 1}
            else { section = 2}
            
            self.employees[section].append(employee)
            self.tableView.insertRows(at: [IndexPath(row: self.employees[section].count - 1, section: section)], with: .middle)
        }
    }
    
}
