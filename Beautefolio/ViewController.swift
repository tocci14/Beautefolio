//  ViewController.swift
//  Beautefolio


import Firebase
import FirebaseAuth
import UIKit
import SlideMenuControllerSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //現在時刻を取得.
        let myDate: Date = Date()
        
        //カレンダーを取得.
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        //取得するコンポーネントを決める.
        let myComponetns = myCalendar.components(
            [
                NSCalendar.Unit.year,
                NSCalendar.Unit.month,
                NSCalendar.Unit.day,
                NSCalendar.Unit.hour,
                NSCalendar.Unit.minute,
                NSCalendar.Unit.second,
                NSCalendar.Unit.weekday
            ],from: myDate)
        
        let weekdayStrings: Array = ["nil","日","月","火","水","木","金","土","日"]
        
        print("year: \(myComponetns.year)")
        print("month: \(myComponetns.month)")
        print("day: \(myComponetns.day)")
        print("hour: \(myComponetns.hour)")
        print("minute: \(myComponetns.minute)")
        print("second: \(myComponetns.second)")
        print("weekday: \(weekdayStrings[myComponetns.weekday!])")
        
        //現在時間表示用のラベルを生成.
        let myLabel: UILabel = UILabel()
        myLabel.font = UIFont(name: "HiraKakuInterface-W1", size:UIFont.labelFontSize)
        
        var myStr: String = "\(myComponetns.year!)年"
        myStr += "\(myComponetns.month!)月"
        myStr += "\(myComponetns.day!)日["
        myStr += "\(weekdayStrings[myComponetns.weekday!])]"
        myStr += "\(myComponetns.hour!)時"
        myStr += "\(myComponetns.minute!)分"
        myStr += "\(myComponetns.second!)秒"
        
        myLabel.text = myStr
        myLabel.frame = CGRect(x: 0, y: self.view.bounds.height/2, width: self.view.bounds.width, height: 20)
        myLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(myLabel)
        
        
        // currentUserがnilならログインしていない
        if FIRAuth.auth()?.currentUser == nil {
            // ログインしていなければログインの画面を表示する
            // viewDidAppear内でpresent()を呼び出しても表示されないためメソッドが終了してから呼ばれるようにする
            DispatchQueue.main.async {
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(loginViewController!, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}








