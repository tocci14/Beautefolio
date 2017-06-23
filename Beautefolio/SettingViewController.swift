//  SettingViewController.swift
//  Beautefolio


import UIKit
import Firebase
import PagingMenuController


class SettingViewController: MainViewController {
    
    @IBOutlet weak var contentView: UIView!

    var activeViewControoler:UIViewController!
    var settingMenuViewController1:UIViewController!
    var settingMenuViewController2:UIViewController!
    var settingMenuViewController3:UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "設定"
        
        let storyboard: UIStoryboard = self.storyboard!
        settingMenuViewController1 = storyboard.instantiateViewController(withIdentifier: "SettingMenuViewController_1")
        addContentController(viewContrlloer: settingMenuViewController1)
        
        settingMenuViewController2 = storyboard.instantiateViewController(withIdentifier: "SettingMenuViewController_2")
        settingMenuViewController3 = storyboard.instantiateViewController(withIdentifier: "SettingMenuViewController_3")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedChanged(_ sender: Any) {
        
        let seg = sender as! UISegmentedControl
        
        switch (seg.selectedSegmentIndex) {
        
        case 0:
            
            hideContentController(viewContrlloer: activeViewControoler)
            addContentController(viewContrlloer: settingMenuViewController1)
            break
            
        case 1:
            hideContentController(viewContrlloer: activeViewControoler)
            addContentController(viewContrlloer: settingMenuViewController2)
            break
            
        case 2:
            hideContentController(viewContrlloer: activeViewControoler)
            addContentController(viewContrlloer: settingMenuViewController3)
            break
            
        default:
            break
         }
        
    }
    
    func addContentController(viewContrlloer : UIViewController){
        
        self.addChildViewController(viewContrlloer)
        self.contentView.addSubview(viewContrlloer.view)
        viewContrlloer.didMove(toParentViewController: self)
        activeViewControoler = viewContrlloer
        
    }
    
    func hideContentController(viewContrlloer : UIViewController){
        
        viewContrlloer.willMove(toParentViewController: self)
        viewContrlloer.view.removeFromSuperview()
        viewContrlloer.removeFromParentViewController()
    }

}
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

