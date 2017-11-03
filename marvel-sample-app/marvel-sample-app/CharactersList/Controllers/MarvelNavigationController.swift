//
//  MarvelViewController.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 03/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import UIKit

class MarvelNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.barTintColor = UIColor.marvelRedColor
        self.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        
        self.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        
        self.navigationBar.topItem?.title = "Marvel"
    }
}
