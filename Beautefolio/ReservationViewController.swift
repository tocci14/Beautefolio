//  ReservationViewController.swift
//  Beautefolio


import UIKit
import Firebase
import SlideMenuControllerSwift


class ReservationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var PrevDayBtn: UIButton!
    @IBOutlet weak var NextDayBtn: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    let cal = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
    
    // 入力年月用書式設定
    let dateFormatter = DateFormatter()
    
    //現在
    var now = NSDate()
    
    @IBAction func PrevDayButton(_ sender: UIButton) {
        // 昨日
        _ = cal.date(byAdding: .day, value: -1, to: now as Date, options: NSCalendar.Options())
    }
    
    @IBAction func NextDayButton(_ sender: UIButton) {
        // 明日
        _ = cal.date(byAdding: .day, value: 1, to: now as Date, options: NSCalendar.Options())
    }
    
    // 現在時刻を取得し、表示する
    //let myLabel: UILabel = UILabel()
    //self.myLabel.text = "\(myLabel)"

    // 日時を取得する
    //func getDate()->NSString {
    //    let now = NSDate()
    //    let dateFormatter = NSDateFormatter()
    //    dateFormatter.locale = NSLocale(localeIdentifier: "en_US") // ロケールの設定
    //    dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss" // 日付フォーマットの設定
     //   var thisDate = dateFormatter.stringFromDate(now)
      //  return thisDate
    
    
    //let dateManager = DateManager()
    //let daysPerWeek: Int = 7
    //let cellMargin: CGFloat = 2.0
    //var selectedDate = NSDate()
    //var today: NSDate!
    //let weekArray = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "予約リスト"
        addLeftBarButtonWithImage(UIImage(named: "menu")!)
        
    }

    
        // セルが表示されるときに呼ばれる処理（1個のセルを描画する毎に呼び出されます
        /*func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) return cell
        }
        
        // セクションの数
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int { return 2
        }*/
        
        // 表示するセルの数
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 7
        }
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 2
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            return cell
        }




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
