//  SettingMenuViewController_2.swift
//  Beautefolio


import UIKit
import Firebase
import PagingMenuController

class SettingMenuViewController_2: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var staffCollectionView: UICollectionView!
    
    //データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 8
    }
    
    //データを返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //コレクションビューから識別子「StaffCell」のセルを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StaffCell", for: indexPath as IndexPath) as UICollectionViewCell
        
        //セルの背景色を白に設定する。
        cell.backgroundColor = UIColor.white
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
