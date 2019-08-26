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
    }

    // 設定情報を保存するメソッド
    @IBAction func saveInformation(_ sender: Any) {
        let hour = DateFormatter()
        let minute = DateFormatter()
        let userDefaults : UserDefaults? = UserDefaults.standard
        hour.dateFormat = "HH"
        minute.dateFormat = "mm"
        //        print("時間：" , "\(hour.string(from: date))")
        //        print("分：" , "\(minute.string(from: date))")
        userDefaults!.set(hour.string(from: getDate.date), forKey: "hour")
        userDefaults!.set(minute.string(from: getDate.date), forKey: "minute")
        let alert = UIAlertController(title: "メッセージ", message: "設定しました。", preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
    }

}
