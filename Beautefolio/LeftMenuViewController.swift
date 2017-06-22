//  LeftMenuViewController.swift
//  Beautefolio


import UIKit
import Firebase
import SlideMenuControllerSwift

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
    
    class LeftMenuViewController : UIViewController, LeftMenuProtocol {
        
        @IBOutlet weak var tableView: UITableView!
        
        var menus = ["ホーム", "予約リスト", "お客様カルテ", "カウンセリング", "設定"]
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
            let reservationViewController = storyboard.instantiateViewController(withIdentifier: "Reservation") as! ReservationViewController
            self.reservationViewController = UINavigationController(rootViewController: reservationViewController)
            
            let recordViewController = storyboard.instantiateViewController(withIdentifier: "Record") as! RecordViewController
            self.recordViewController = UINavigationController(rootViewController: recordViewController)
            
            let counselingViewController = storyboard.instantiateViewController(withIdentifier: "Counseling") as! CounselingViewController
            self.counselingViewController = UINavigationController(rootViewController: counselingViewController)
            
            let settingViewController = storyboard.instantiateViewController(withIdentifier: "Setting") as! SettingViewController
            self.settingViewController = UINavigationController(rootViewController: settingViewController)
            
            self.tableView.dataSource = self
            self.tableView.delegate = self
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
    
    extension LeftMenuViewController : UITableViewDelegate {
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
    
    extension LeftMenuViewController : UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menus.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if let menu = LeftMenu(rawValue: indexPath.row) {
                switch menu {
                case .home, .reservation, .record, .counseling, .setting:
                    
                    var cell:UITableViewCell? =  tableView.dequeueReusableCell(withIdentifier: "Cell")
                    
                    if cell == nil {
                        cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
                    } else {
                        cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                        
                    }
                    
                    cell?.textLabel?.text = menus[indexPath.row]
                    
                    return cell!
                }
            }
            return UITableViewCell()
        }
}
