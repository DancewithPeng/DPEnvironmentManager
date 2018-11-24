//
//  AppDelegate.swift
//  EnvironmentManagerExample
//
//  Created by DancewithPeng on 2018/11/22.
//  Copyright © 2018 DP. All rights reserved.
//

import UIKit
import EnvironmentManager

struct Demo: Codable {
    var name: String
    var age: Int
}

protocol MyEnvironment: Environment {
    var name: String { get }
    var age: Int { get }
}


struct DebugEnvironment: MyEnvironment {
    
    //    func value(for attribute: EnvironmentAttribute) -> String {
    //        return ""
    //    }
    var name: String = "asd"
    var age: Int = 100
    
    static func environment() -> DebugEnvironment {
        return DebugEnvironment()
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 初始化
        // setupWithEnv
        
        // 改变
        // currentEnv = env
        
        // 使用
        // host = currentEnv.host
        // api = currentEnv.Version
        // host = currentEnv
        
//        let t = Test(name: "zhangsan")
//        let tData = try! NSKeyedArchiver.archivedData(withRootObject: t, requiringSecureCoding: false)
        
        let d = Demo(name: "asd", age: 100)
        let encoder = JSONEncoder()
        let data = try! encoder.encode(d)
        UserDefaults.standard.set(data, forKey: "Test")
        UserDefaults.standard.synchronize()
        
        let decoder = JSONDecoder()
        let newD = try! decoder.decode(Demo.self, from: UserDefaults.standard.value(forKey: "Test") as! Data)
        print(newD)
        
        let a = DebugEnvironment()
        EnvironmentManager.setup(withEnvironment: a)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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

