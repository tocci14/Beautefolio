//  SlideViewController.swift
//  Beautefolio


import UIKit
import Firebase
import SlideMenuControllerSwift

class SlideViewController: SlideMenuController {
    
    override func awakeFromNib() {
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "Main")
        let leftVC = storyboard?.instantiateViewController(withIdentifier: "Left")
        
        //NavigationBarを生成
        let navigationController = UINavigationController(rootViewController: mainVC!)
        navigationController.navigationBar.barTintColor = UIColor.purple
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        //ライブラリ特有のプロパティにセット
        mainViewController = navigationController
        leftViewController = leftVC
        SlideMenuOptions.leftViewWidth = 200
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
