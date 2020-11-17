//
//  AppDelegate.swift
//  Event-Attendance
//
//  Created by Masateru Maegawa on 2020/11/13.
//  Copyright © 2020 Masateru Maegawa. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit

@UIApplicationMain class AppDelegate:UIResponder, UIApplicationDelegate {

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //追加
        FirebaseApp.configure()

        //Facebookログイン
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

        return true
    }

      //追加
    func application(_ application : UIApplication,open url: URL, sourceApplication: String?, annotation: Any)->Bool{
        return ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }

      //追加
    func applicationDidBecomeActive(_ application: UIApplication) {
        AppEvents.activateApp()
    }

}

/*    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

*/

