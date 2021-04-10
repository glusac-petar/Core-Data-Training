//
//  String+Ext.swift
//  Core Data Training
//
//  Created by Petar Glusac on 9.4.21..
//

import Foundation

extension String {
    
    func space(_ length: Int) -> String { return padding(toLength: self.count + length, withPad: " ", startingAt: 0) }
    
}
