//
//  AppDelegate.swift
//  Stalker
//
//  Created by Pavel Hamrik on 22/05/16.
//  Copyright © 2016 Pavel Hamrik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // the LocationService singleton
    let locationManager = LocationService.sharedInstance


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // setup local notifications
        LocalNotifications.setup()
        
        // we of cource wanna know the app has launched, especially in the background
        Helpers.storeLogs("AppDelegate:\nApplication did finish launching with options.", emoji: "\u{1F3AA}", notify: true)
        
        // move at least 10 meters to get a distance update
        locationManager.setDistanceFilter(50)
        locationManager.initUpdatingLocation()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
        Helpers.storeLogs("AppDelegate:\nApplication will resign active.", emoji: "\u{1F4DF}")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        Helpers.storeLogs("AppDelegate:\nApplication did enter background.", emoji: "\u{1F4DF}")
        LocalNotifications.removeAppIconBadge()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        Helpers.storeLogs("AppDelegate:\nApplication will enter foreground.", emoji: "\u{1F4DF}")
        LocalNotifications.removeAppIconBadge()
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        Helpers.storeLogs("AppDelegate:\nApplication did become active.", emoji: "\u{1F4DF}")
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        locationManager.switchMode()
        Helpers.storeLogs("AppDelegate:\nApplication will terminate.", emoji: "\u{274C}", notify: true)
    }


}

