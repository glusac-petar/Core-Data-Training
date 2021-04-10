//
//  EmployeesViewController+UITableView.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import UIKit

extension EmployeesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int { return employees.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return employees[section].count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CDEmployeeTableViewCell.reuseID, for: indexPath) as! CDEmployeeTableViewCell
        cell.set(employee: employees[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 50 }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 50 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: CDTableViewHeaderView.reuseID) as! CDTableViewHeaderView
        if section == 0 { view.set(title: "Executive") }
        else if section == 1 { view.set(title: "Management") }
        else { view.set(title: "Staff") }
        return view
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [weak self] (_, _, completed) in
            guard let self = self else { return }
            self.deleteEmployee(at: indexPath)
            completed(true)
        }
        deleteAction.backgroundColor = .lightRed
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        
        return configuration
    }
    
    private func deleteEmployee(at indexPath: IndexPath) {
        DispatchQueue.main.async {
            if CoreDataManager.shared.deleteEmployee(employee: self.employees[indexPath.section][indexPath.row]) {
                self.employees[indexPath.section].remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .left)
            }
            else { self.presentAlert(title: "Woops!", message: "There was an error deleting employee. Please try again.") }
        }
    }
    
}
