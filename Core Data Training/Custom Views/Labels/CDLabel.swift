//
//  CDLabel.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

class CDLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(font: UIFont, textColor: UIColor, text: String? = nil) {
        self.init(frame: .zero)
        self.font = font
        self.textColor = textColor
        self.text = text
    }
 
    private func configure() {
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
