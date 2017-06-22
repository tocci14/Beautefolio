//  MainViewController.swift
//  Beautefolio


import Firebase
import FirebaseAuth
import UIKit
import SlideMenuControllerSwift

class MainViewController: UIViewController {
    
    @IBAction func MenuButton(_ sender: UIButton) {
    }
    
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
        self.navigationItem.title = "ホーム"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
        }

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
}


