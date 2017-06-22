//  CounselingViewController.swift
//  Beaytefolio


import UIKit
import Firebase
import SlideMenuControllerSwift

class CounselingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "カウンセリングフォーム"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
