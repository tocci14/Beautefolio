//  SettingViewController.swift
//  Beautefolio
//


import UIKit
import Firebase
import PagingMenuController

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "設定"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
        
        //1ページ目で表示させるコントローラーを指定する
        let page_1 = self.storyboard?.instantiateViewController(withIdentifier: "SettingMenuViewController_1") as! PagingMenuController
        page_1.title = "メニュー"
        
        //2ページ目で表示させるコントローラーを指定する
        let page_2 = self.storyboard?.instantiateViewController(withIdentifier: "SettingMenuViewController_2") as! PagingMenuController
        page_2.title = "スタッフ"
        
        //3ページ目で表示させるコントローラーを指定する
        let page_3 = self.storyboard?.instantiateViewController(withIdentifier: "SettingMenuViewController_3") as! PagingMenuController
        page_3.title = "カルテDATA"
        let viewControllers = [page_1, page_2, page_3]
        
        /*//表示オプション
        let options = SettingMenuOptions()   //オプションをインスタンス化
        
        //最初に表示させるページ番号
        options.defaultPage = 0
        
        //スワイプでページ間を移動させるか
        options.scrollEnabled = true
        
        //メニューバーの背景色
        options.backgroundColor = UIColor.whiteColor()
        
        //選択中のメニューバーの背景色
        options.selectedBackgroundColor = UIColor.whiteColor()
        
        //メニューのフォントサイズ
        options.font = UIFont.systemFontOfSize(14)
        
        //選択中のメニューのフォントサイズ
        options.selectedFont = UIFont.systemFontOfSize(14)
        
        //メニューの位置
        options.menuPosition = .Top
        
        //メニューの高さ
        options.menuHeight = 44
        
        //メニューのマージン
        options.menuItemMargin = 5
        
        //ページ移動をするときのアニメーションスピード
        options.animationDuration = 0.3
        
        //選択中のメニューの下線の色
        options.menuItemMode = .Underline(height: 3, color: UIColor.purple(), horizontalPadding: 0, verticalPadding: 0)
 
        
        //メニューの表示のされ方
        options.menuDisplayMode = .SegmentedControl
        
        
        let PagingMenuController = SettingViewController(viewControllers: viewControllers, options: options)
        PagingMenuController.view.frame.origin.y += 20
        PagingMenuController.view.frame.size.height -= 20
        
        self.addChildViewController(PagingMenuController)
        self.view.addSubview(PagingMenuController.view)
        PagingMenuController.didMoveToParentViewController(self)*/
        
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
