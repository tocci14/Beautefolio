//
//  Calender.swift
//  
//
//  Created by Hisashi Sugimoto on 2017/06/16.
//
//

import Foundation
import Firebase
import EventKitUI
import SlideMenuControllerSwift


// EventStoreを初期化
let eventStore = EKEventStore()

// 許可状況を確認して、許可されていなかったら許可を得る
func allowAuthorization() {
    if getAuthorization_status() {
        // 許可されている
        return
    } else {
        // 許可されていない
        eventStore.requestAccessToEntityType(.Event, completion: {
            (granted, error) in
            if granted {
                return
            }
            else {
                print("Not allowed")
            }
        })
        
    }
}

// 認証ステータスを確認する
func getAuthorization_status() -> Bool {
    // 認証ステータスを取得
    let status = EKEventStore.authorizationStatusForEntityType(.Event)
    
    // ステータスを表示 許可されている場合のみtrueを返す
    switch status {
    case .NotDetermined:
        print("NotDetermined")
        return false
        
    case .Denied:
        print("Denied")
        return false
        
    case .Authorized:
        print("Authorized")
        return true
        
    case .Restricted:
        print("Restricted")
        return false
    }
}

let calendars = eventStore.calendarsForEntityType(.Event)

func listEvents() {
    // 検索条件を準備
    let startDate = NSDate()
    let endDate = NSDate()
    let defaultCalendar = eventStore.defaultCalendarForNewEvents    // ここではデフォルトのカレンダーを指定
    // 検索するためのクエリー的なものを用意
    let predicate = eventStore.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: [defaultCalendar])
    // イベントを検索
    let events = eventStore.eventsMatchingPredicate(predicate)
}

func addEvent() {
    // イベントの情報を準備
    let startDate = NSDate()
    let cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    let endDate = cal.dateByAddingUnit(.Hour, value: 2, toDate: startDate, options: NSCalendarOptions())!
    let title = "カレンダーテストイベント"
    let defaultCalendar = eventStore.defaultCalendarForNewEvents
    // イベントを作成して情報をセット
    let event = EKEvent(eventStore: eventStore)
    event.title = title
    event.startDate = startDate
    event.endDate = endDate
    event.calendar = defaultCalendar
    // イベントの登録
    do {
        try eventStore.saveEvent(event, span: .ThisEvent)
    } catch let error {
        print(error)
    }
    
}

func deleteEvent(event: EKEvent) {
    do {
        try eventStore.removeEvent(event, span: .ThisEvent)
    } catch let error {
        print(error)
    }
}
