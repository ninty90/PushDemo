//
//  AppDelegate.swift
//  PushDemo
//
//  Created by little2s on 16/5/19.
//  Copyright © 2016年 little2s. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        registerForPushNotifications(application)
        
        if let notification = launchOptions?[UIApplicationLaunchOptionsRemoteNotificationKey] {
            print("Receive remote notifications: \(notification)")
        }
        
        return true
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != .None {
            application.registerForRemoteNotifications()
        }
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let deviceTokenString = convertDeviceTokenToString(deviceToken)
        print("Register APNs success, device token: \(deviceTokenString)")
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Register APNs failed: \(error)")
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        print("Receive remote notification: \(userInfo)")
    }


    func registerForPushNotifications(application: UIApplication) {
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
    }
    
    func convertDeviceTokenToString(deviceToken: NSData) -> String {
        let tokenChars = UnsafePointer<CChar>(deviceToken.bytes)
        var tokenString = ""
        
        for i in 0..<deviceToken.length {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        
        return tokenString
    }
    
}

