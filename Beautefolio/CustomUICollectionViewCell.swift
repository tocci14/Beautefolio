//
//  CustomUICollectionViewCell.swift
//  Beautefolio
//
//  Created by Hisashi Sugimoto on 2017/06/19.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import UIKit

class CustomUICollectionViewCell: UICollectionViewCell {
    
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UILabelを生成.
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height:frame.height))
        textLabel?.text = "nil"
        textLabel?.textAlignment = NSTextAlignment.center
        
        // Cellに追加.
        self.contentView.addSubview(textLabel!)
    }
    
}
