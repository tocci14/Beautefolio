//  SettingMenuViewController_2.swift
//  Beautefolio


import UIKit
import Firebase
import PagingMenuController

class SettingMenuViewController_2: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    let photos = ["staff01", "staff02","staff03","staff04","staff05","staff06","staff07","staff08","staff09","staff10"]
    
    @IBOutlet weak var staffCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        // Cell はストーリーボードで設定したセルのID
        let staffCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StaffCollectionViewCell", for: indexPath)
        
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = staffCell.contentView.viewWithTag(1) as! UIImageView
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        
        
        // Tag番号を使ってLabelのインスタンス生成
        let label = staffCell.contentView.viewWithTag(2) as! UILabel
        label.text = photos[(indexPath as NSIndexPath).row]
        
        return staffCell
    }
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2-2
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return 10;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
