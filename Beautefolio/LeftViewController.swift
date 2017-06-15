//
//  LeftViewController.swift
//  Beautefolio
//
//  Created by Hisashi Sugimoto on 2017/06/15.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import Firebase
import UIKit

enum LeftMenu: Int {
    case home = 0
    case reservation
    case record
    case counseling
    case setting
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController: UIViewController,LeftMenuProtocol {
    
        @IBOutlet weak var tableView: UITableView!
    
        var menus = ["ホーム", "予約リスト", "お客様カルテ", "カウンセリングフォーム", "設定"]
        var mainViewController: UIViewController!
        var reservationViewController: UIViewController!
        var recordViewController: UIViewController!
        var counselingViewController: UIViewController!
        var settingViewController: UIViewController!
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let reservationViewController = storyboard.instantiateViewController(withIdentifier: "ReservationViewController") as! ReservationViewController
            self.reservationViewController = UINavigationController(rootViewController: reservationViewController)
            
            let recordViewController = storyboard.instantiateViewController(withIdentifier: "RecordViewController") as! RecordViewController
            self.recordViewController = UINavigationController(rootViewController: recordViewController)
            
            let counselingViewController = storyboard.instantiateViewController(withIdentifier: "CounselingViewController") as! CounselingViewController
            self.counselingViewController = UINavigationController(rootViewController: counselingViewController)
            
            let settingViewController = storyboard.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
            SettingViewController.delegate = self
            self.settingViewController = UINavigationController(rootViewController: settingViewController)
            
            self.tableView.registerCellClass(BaseTableViewCell.self)
            
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.view.layoutIfNeeded()
        }
        
        func changeViewController(_ menu: LeftMenu) {
            switch menu {
            case .home:
                self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
            case .reservation:
                self.slideMenuController()?.changeMainViewController(self.reservationViewController, close: true)
            case .record:
                self.slideMenuController()?.changeMainViewController(self.recordViewController, close: true)
            case .counseling:
                self.slideMenuController()?.changeMainViewController(self.counselingViewController, close: true)
            case .setting:
                self.slideMenuController()?.changeMainViewController(self.settingViewController, close: true)
            }
        }
    }
    
    extension LeftViewController : UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if let menu = LeftMenu(rawValue: indexPath.row) {
                switch menu {
                case .home, .reservation, .record, .counseling, .setting:
                    return BaseTableViewCell.height()
                }
            }
            return 0
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let menu = LeftMenu(rawValue: indexPath.row) {
                self.changeViewController(menu)
            }
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if self.tableView == scrollView {
                
            }
        }
    }
    
    extension LeftViewController : UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menus.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if let menu = LeftMenu(rawValue: indexPath.row) {
                switch menu {
                case .home, .reservation, .record, .counseling, .setting:
                    let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                    cell.setData(menus[indexPath.row])
                    return cell
                }
            }
            return UITableViewCell()
        }
}
