//
//  AppDelegate.swift
//  Rental Service
//
//  Created by Amir Shokubassov on 3/9/20.
//  Copyright © 2020 Amir Shokubassov. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import FirebaseAuth
import GoogleMaps
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let notification = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        notification.requestAuthorization(options: [.alert,.sound,.badge]) { (granted, error) in
            guard granted else{ return}
            self.notification.getNotificationSettings { (settings) in
                print(settings)
                guard settings.authorizationStatus == .authorized else {return}
            }
        }
        notification.delegate = self
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        GMSServices.provideAPIKey("AIzaSyDw04BEYNHU1J0ylKRgW6r1QArl7e7GM-0")
        print(UIApplication.shared.user?.name)
        
        let navigationBarAppearnce = UINavigationBar.appearance()
       // navigationBarAppearnce.tintColor = UIColor(rgb: 0x2EA3E4)
        let image = UIImage(named: "Rectangle 63")//put your image here
        let backButtonImage = image!.withRenderingMode(.alwaysOriginal)
        let appearance = UINavigationBar.appearance()
        appearance.backIndicatorImage = backButtonImage
        appearance.backIndicatorTransitionMaskImage = backButtonImage
        appearance.titleVerticalPositionAdjustment(for: .default)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: 0), for: .default)
        // Override point for customization after application launch.
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


}

extension AppDelegate:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(#function)
    }
}
