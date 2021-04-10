//
//  UITableView+Ext.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

extension UITableView {
    
    func removeExcessCells() { tableFooterView = UIView(frame: .zero) }
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
}
