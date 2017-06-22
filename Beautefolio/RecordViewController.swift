//
//  RecordViewController.swift
//  
//
//  Created by Hisashi Sugimoto on 2017/06/16.
//
//

import UIKit
import Firebase
import SlideMenuControllerSwift
import CVCalendar

class RecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "お客様カルテ"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
