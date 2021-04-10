//
//  Date+Ext.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import Foundation

extension Date {
    
    func convertToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: self)
    }
    
}
