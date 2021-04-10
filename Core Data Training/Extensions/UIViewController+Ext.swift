//
//  UIViewController+Ext.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self.present(alertController, animated: true)
        }
    }
    
}
