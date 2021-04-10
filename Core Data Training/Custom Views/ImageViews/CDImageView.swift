//
//  CDImageView.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

class CDImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: UIImage? = nil, cornerRadius: CGFloat = 0) {
        self.init(frame: .zero)
        self.image = image
        self.layer.cornerRadius = cornerRadius
    }
    
    private func configure() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
