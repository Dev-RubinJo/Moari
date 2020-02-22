//
//  AppDelegate.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/10.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Firebase
//import BackgroundTasks
import AlamofireNetworkActivityIndicator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let _tokenHeaders = ["x-access-Token": UserDefaults.standard.string(forKey: "LoginToken") ?? ""]
    
    var window: UIWindow?
    
    var getLoginTokenHeader: [String: String] {
        get {
            return self._tokenHeaders
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        NetworkActivityIndicatorManager.shared.isEnabled = true
        if !UserDefaults.standard.bool(forKey: "FirstAppLaunch") {
            UserDefaults.standard.set(2, forKey: "Theme")
        }
        UserDefaults.standard.set(true, forKey: "FirstAppLaunch")
        
        
        if #available(iOS 13.0, *) {}
        else {
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            self.window?.rootViewController = SplashVC.makeSplashVC
            self.window?.makeKeyAndVisible()
        }
        return true
    }

    // 백그라운드 테스트를 위해 준비
//    @available(iOS 13.0, *)
//    private func registerBackgroundTasks() {
//
//        BGTaskScheduler.shared.register(forTaskWithIdentifier: "", using: nil) { task in
//            self.test()
//        }
//    }
//    func test() {}
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

