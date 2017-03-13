//
//  AppDelegate.swift
//  Snapshot
//
//  Created by ShengHua Wu on 13/03/2017.
//  Copyright © 2017 ShengHuaWu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = navigationController
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

