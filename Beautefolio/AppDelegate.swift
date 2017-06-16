//
//  AppDelegate.swift
//  Beautefolio
//
//  Created by Hisashi Sugimoto on 2017/06/12.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import UIKit
import Firebase
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        FIRApp.configure()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "Main")
        let leftVC = storyboard.instantiateViewController(withIdentifier: "Left")
        let navigationController = UINavigationController(rootViewController: mainVC)
        let slideMenuController = SlideMenuController(mainViewController: navigationController, leftMenuViewController: leftVC)
        
      //  SlideMenuOptions.leftViewWidth = 180  //this is the line cause the problem
        //SlideMenuOptions.contentViewScale = 0.8
        
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        return true
    }
}

