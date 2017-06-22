//
//  Utility.swift
//  Beautefolio
//
//  Created by Hisashi Sugimoto on 2017/06/18.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import Foundation

class Utility {
    // 現在時刻を"yyyy/MM/dd HH:mm:ss"のString型で返すクラスメソッド
    class func nowTimeGet() -> String {
        // 現在時刻を取得
        let now = NSDate()
        let formatter = NSDateFormatter()
        // 好きなフォーマットを設定する
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let str = formatter.stringFromDate(now)
        return str
    }
}
