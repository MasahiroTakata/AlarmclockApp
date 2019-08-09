//
//  AppDelegate.swift
//  AlarmclockApp
//
//  Created by 高田将弘 on 2019/07/25.
//  Copyright © 2019 高田将弘. All rights reserved.
//

import UIKit
import UserNotifications // 通知する為のフレームワーク

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    // アプリケーションがバックグラウンドへ遷移した場合の処理
    func applicationDidEnterBackground(_ application: UIApplication) {
        //　通知設定に必要なクラスをインスタンス化
        var trigger: UNNotificationTrigger
        let content = UNMutableNotificationContent()
        var notificationTime = DateComponents()
        // トリガー設定
        notificationTime.hour = 0
        notificationTime.minute = 0
        trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        // 設定したタイミングを起点として１分後に通知したい場合
        // アプリがバックグラウンドになってから、通知するタイミングを指定（下記の場合だと１分おき（repeatsをtrueにした場合)）
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        print("バックグラウンドになりました")
        // 通知内容の設定
        content.title = ""
        content.body = "テストです！"
        // content.sound = UNNotificationSound.default()
        // 通知スタイルを指定
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        // 通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

