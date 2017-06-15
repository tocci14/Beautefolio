//
//  MainViewController.swift
//  Beautefolio
//
//  Created by Hisashi Sugimoto on 2017/06/15.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SlideMenuControllerSwift

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Main"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
        
        
    }
}


