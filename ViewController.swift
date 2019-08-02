//
//  ViewController.swift
//  AlarmclockApp
//
//  Created by 高田将弘 on 2019/07/25.
//  Copyright © 2019 高田将弘. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var alarmTime: UITextField!
    @IBOutlet weak var alarmMusic: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 目覚まし時計のアプリ
    }
    // 設定情報を保存するメソッド
    @IBAction func saveInformation(_ sender: Any) {
    }
    // バックグラウンドでも動作する方法を調査する
}
