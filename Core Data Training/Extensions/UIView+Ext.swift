//
//  UIView+Ext.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
}
