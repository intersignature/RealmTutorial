//
//  AppDelegate.swift
//  RealmSwiftTutorial
//
//  Created by User23 on 2/3/2563 BE.
//  Copyright © 2563 Sirichai. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = RLMRealmConfiguration.default()
        config.schemaVersion = 6
//        config.migrationBlock = { (migration, oldSchemaVersion) in
//        }
        RLMRealmConfiguration.setDefault(config)
        return true
    }
}
