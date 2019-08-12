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
    }
    // 設定情報を保存するメソッド
    @IBAction func saveInformation(_ sender: Any) {
        // 選択曲を取得
        // 指定した時間を取得
    }
    // バックグラウンドでも動作する方法を調査する
}
