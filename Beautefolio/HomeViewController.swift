//  HomeViewController.swift
//  Beautefolio


import UIKit
import Firebase
import SlideMenuControllerSwift

class HomeViewController: MainViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "ホーム"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
