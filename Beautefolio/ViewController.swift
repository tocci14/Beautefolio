//
//  ViewController.swift
//  Beautefolio
//
//  Created by Hisashi Sugimoto on 2017/06/12.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import Firebase
import FirebaseAuth
import UIKit
import SlideMenuControllerSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // currentUserがnilならログインしていない
        if FIRAuth.auth()?.currentUser == nil {
            // ログインしていなければログインの画面を表示する
            // viewDidAppear内でpresent()を呼び出しても表示されないためメソッドが終了してから呼ばれるようにする
            DispatchQueue.main.async {
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(loginViewController!, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

