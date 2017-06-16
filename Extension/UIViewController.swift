//
//  UIViewController.swift
//  Beautefolio
//
//  Created by Hisashi Sugimoto on 2017/06/16.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import UIKit


    extension UIViewController {
        
        func setNavigationBarItem() {
            self.addLeftBarButtonWithImage(UIImage(named: "menu")!)
            
            self.slideMenuController()?.removeLeftGestures()
            self.slideMenuController()?.removeRightGestures()
            self.slideMenuController()?.addLeftGestures()
            self.slideMenuController()?.addRightGestures()
        }
        
        func removeNavigationBarItem() {
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.rightBarButtonItem = nil
            self.slideMenuController()?.removeLeftGestures()
            self.slideMenuController()?.removeRightGestures()
        }
}
