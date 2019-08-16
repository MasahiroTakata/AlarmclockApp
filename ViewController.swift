//
//  ViewController.swift
//  AlarmclockApp
//
//  Created by 高田将弘 on 2019/07/25.
//  Copyright © 2019 高田将弘. All rights reserved.
//

import UIKit
import UserNotifications // 通知の為のフレームワーク

class ViewController: UIViewController {
    @IBOutlet weak var hour: UITextField!
    @IBOutlet weak var minute: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            if granted {
                print("通知許可")
                let center = UNUserNotificationCenter.current()
                center.delegate = self as? UNUserNotificationCenterDelegate
            } else {
                print("通知拒否")
            }
        }
        
        hour.keyboardType = UIKeyboardType.numberPad
        minute.keyboardType = UIKeyboardType.numberPad
    }
    // 設定情報を保存するメソッド
    @IBAction func saveInformation(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(hour.text!, forKey: "hour")
        userDefaults.set(minute.text!, forKey: "minute")
        // UserDefaultsへの値の保存を明示的に行う
        userDefaults.synchronize()
        let alert = UIAlertController(title: "メッセージ", message: "設定しました。", preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
    }
}
