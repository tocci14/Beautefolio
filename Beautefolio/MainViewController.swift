//  MainViewController.swift
//  Beautefolio


import Firebase
import FirebaseAuth
import UIKit
import SlideMenuControllerSwift

class MainViewController: UIViewController {
    
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

        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Beautefolio"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
            
        // 2秒経ったらHomeViewControllerに画面遷移したい
        //self.perform(#selector(showVC), with: nil, afterDelay: 2.0)
            func showVC() {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                self.present(vc!, animated: true, completion: nil)
            }
        }

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
}


