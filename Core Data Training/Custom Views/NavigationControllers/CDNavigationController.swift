//
//  CDNavigationController.swift
//  Core Data Training
//
//  Created by Petar Glusac on 6.4.21..
//

import UIKit

class CDNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBarTitle()
        configureNavigationBarBackgroundColor()
    }
  
    private func configureNavigationBarBackgroundColor() {
        navigationBar.backgroundColor = .lightRed
        
        let statusBar = UIView()
        statusBar.frame = UIApplication.shared.windows[0].windowScene!.statusBarManager!.statusBarFrame
        statusBar.backgroundColor = .lightRed
        view.addSubview(statusBar)
    }
    
    private func configureNavigationBarTitle() {
        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }

}
