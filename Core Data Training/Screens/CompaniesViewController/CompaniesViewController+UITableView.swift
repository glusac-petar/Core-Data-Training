//
//  CompaniesViewController+UITableView.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import UIKit

extension CompaniesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return companies.count }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 50 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CDCompanyTableViewCell.reuseID, for: indexPath) as! CDCompanyTableViewCell
        cell.set(company: companies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 50 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: CDTableViewHeaderView.reuseID) as! CDTableViewHeaderView
        view.set(title: "Names")
        return view
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [weak self] (_, _, completed) in
            guard let self = self else { return }
            self.deleteCompany(at: indexPath)
            completed(true)
        }
        deleteAction.backgroundColor = .lightRed
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (_, _, completed) in
            guard let self = self else { return }
            self.editCompany(at: indexPath)
            completed(true)
        }
        editAction.backgroundColor = .darkBlue
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(EmployeesViewController(company: companies[indexPath.row]), animated: true)
    }
    
    private func deleteCompany(at indexPath: IndexPath) {
        DispatchQueue.main.async {
            if CoreDataManager.shared.deleteCompany(company: self.companies[indexPath.row]) {
                self.companies.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .left)
            }
            else { self.presentAlert(title: "Woops!", message: "There was an error deleting company. Please try again.") }
        }
    }
    
    private func editCompany(at indexPath: IndexPath) {
        let destinationVC = CDNavigationController(rootViewController: CreateCompanyViewController(delegate: self, company: companies[indexPath.row]))
        destinationVC.modalPresentationStyle = .overFullScreen
        present(destinationVC, animated: true)
    }
    
}

