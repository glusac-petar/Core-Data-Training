//
//  CDSegmentedControl.swift
//  Core Data Training
//
//  Created by Petar Glusac on 10.4.21..
//

import UIKit

class CDSegmentedControl: UISegmentedControl {

    override init(items: [Any]?) {
        super.init(items: items)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold), NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        selectedSegmentIndex = 0
        selectedSegmentTintColor = .darkBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
