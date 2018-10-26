//
//  AppDelegate.swift
//  Strechy pully
//
//  Created by sz ashik on 22/9/18.
//  Copyright © 2018 sz ashik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let vc = ViewController()
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
    return true
  }
}

