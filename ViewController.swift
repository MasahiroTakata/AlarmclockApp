//
//  ViewController.swift
//  AlarmclockApp
//
//  Created by 高田将弘 on 2019/07/25.
//  Copyright © 2019 高田将弘. All rights reserved.
//

import UIKit
import UserNotifications // 通知の為のフレームワーク

// クラスの拡張
//extension (UIDatePicker) {
//    func test(){
//    }
//}

class ViewController: UIViewController {
    @IBOutlet weak var getDate: UIDatePicker!
    @IBOutlet weak var willContent: UITextField!
    @IBOutlet weak var schedule: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 通知の許可
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            if granted {
                let center = UNUserNotificationCenter.current()
                center.delegate = self as? UNUserNotificationCenterDelegate
            }
        }
        
        // 現在日付を取得
//        let now = NSDate()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy/MM/dd"
//        let nowTime = formatter.string(from: now as Date)
//        print("日付：" + nowTime)
        // UIDatePickerの時間の最小値を現在時刻に設定
//        let minDateString = "2019/09/16 20:00:00"
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "YYYY/MM/DD HH:MM:SS"
//        let minDate = dateFormatter.date(from: minDateString)
//        print("最小日付：" + minDate)
        // タイムゾーンの設定
//        getDate.timeZone = NSTimeZone.local
//        getDate.locale = Locale.current
        // 時間軸の設定？？（東京に合わせるのか？とか）
//        getDate.minimumDate = minDate
        // maximumDateだと反応があった。ただ、指定した月ではなかったが。
        // getDate.maximumDate = minDate
//        print("日付：" + minDate)
        
        // 定数scheduleTextで時刻選択ドラムロールを設定する
    }

    // 設定情報を保存するメソッド
    @IBAction func saveInformation(_ sender: Any) {
        // nilを許容する為の変数を用意（テキスト値の空判定をする為）
        var textValue:String? = nil
        textValue = String((willContent.text!))
        if (textValue == "") {
            let alert = UIAlertController(title: "メッセージ", message: schedule.text! + "が未入力です。", preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)
            present(alert, animated: true, completion: nil)
        } else {
            let hour = DateFormatter()
            let minute = DateFormatter()
            let userDefaults : UserDefaults? = UserDefaults.standard
            hour.dateFormat = "HH"
            minute.dateFormat = "mm"
            userDefaults!.set(hour.string(from: getDate.date), forKey: "hour")
            userDefaults!.set(minute.string(from: getDate.date), forKey: "minute")
            userDefaults!.set(textValue, forKey: "content")
            // ダイアログの設定
            let alert = UIAlertController(title: "メッセージ", message: "設定しました。", preferredStyle: UIAlertController.Style.alert)
            let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(okayButton)
            present(alert, animated: true, completion: nil)
        }
    }
}
