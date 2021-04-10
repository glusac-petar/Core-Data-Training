//
//  CompaniesViewController.swift
//  Core Data Training
//
//  Created by Petar Glusac on 6.4.21..
//

import UIKit

class CompaniesViewController: UIViewController, UINavigationControllerDelegate {
    
    let tableView = UITableView()
    
    var companies: [Company] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
        layoutUI()
        fetchData()
    }
    
    private func configureViewController() {
        view.backgroundColor = .darkBlue
        title = "Companies"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetButtonDidTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonDidTap))
    }
    
    @objc private func addButtonDidTap() {
        let destinationVC = CDNavigationController(rootViewController: CreateCompanyViewController(delegate: self))
        destinationVC.modalPresentationStyle = .overFullScreen
        present(destinationVC, animated: true)
    }
    
    @objc private func resetButtonDidTap() {
        if CoreDataManager.shared.deleteAllCompanies() {
            DispatchQueue.main.async {
                var indexPaths = [IndexPath]()
                for (index, _) in self.companies.enumerated() { indexPaths.append(IndexPath(row: index, section: 0)) }
                self.companies.removeAll()
                self.tableView.deleteRows(at: indexPaths, with: .left)
            }
        } else { presentAlert(title: "Woops!", message: "There was an error deleting companies. Please try again.") }
    }
    
    private func configureTableView() {
        tableView.register(CDCompanyTableViewCell.self, forCellReuseIdentifier: CDCompanyTableViewCell.reuseID)
        tableView.register(CDTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: CDTableViewHeaderView.reuseID)
        tableView.backgroundColor = .clear
        tableView.separatorColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.removeExcessCells()
    }
    
    private func fetchData() {
        if let companies = CoreDataManager.shared.fetchCompanies() { self.companies = companies }
        else { presentAlert(title: "Woops!", message: "There was an error fetching companies.") }
    }
    
}

extension CompaniesViewController: CreateCompanyViewControllerDelegate {
    
    func didInsertCompany(company: Company) {
        DispatchQueue.main.async {
            self.companies.append(company)
            self.tableView.insertRows(at: [IndexPath(row: self.companies.count - 1, section: 0)], with: .middle)
        }
    }
    
    func didEditCompany(company: Company) {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.companies.firstIndex(of: company)!, section: 0)
            self.tableView.reloadRows(at: [indexPath], with: .middle)
        }
    }
    
}


