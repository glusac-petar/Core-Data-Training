//
//  CDTextField.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

class CDTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    private func configure() {
        font = UIFont.systemFont(ofSize: 17.5, weight: .medium)
        textAlignment = .left
        textColor = .black

        autocorrectionType = .no
        clearButtonMode = .whileEditing
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
