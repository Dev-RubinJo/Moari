//
//  SceneDelegate.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/10.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.windowScene = windowScene
        self.window?.rootViewController = SplashVC.makeSplashVC
        self.window?.makeKeyAndVisible()
        
        let theme = UserDefaults.standard.integer(forKey: "Theme")
        switch theme {
        case 0:
            self.setLightTheme()
        case 1:
            self.setDarkTheme()
        case 2:
            self.setSystemTheme()
        default:
//            self.setLightTheme()
            self.setSystemTheme()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        let appLockConfig = UserDefaults.standard.bool(forKey: "AppLockConfig")
        if appLockConfig {
            if let imageView : UIImageView = UIApplication.shared.keyWindow?.subviews.last?.viewWithTag(1001) as? UIImageView {
                imageView.removeFromSuperview()
            }
        } else {
            UserDefaults.standard.set(false, forKey: "NeedAppPassword")
        }
        
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        let appLockConfig = UserDefaults.standard.bool(forKey: "AppLockConfig")
        if appLockConfig {
            let imageView = UIImageView(frame: self.window!.bounds)
            imageView.tag = 1001
            imageView.image = UIImage(named: "mainBackgroundImage") //your image goes here
            UIApplication.shared.windows.first?.subviews.last?.addSubview(imageView)
        } else {
            UserDefaults.standard.set(false, forKey: "NeedAppPassword")
        }
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("EnterForeground")
//        let tempVC = SplashVC.makeSplashVC
//        self.window?.rootViewController?.present(tempVC, animated: false, completion: nil)
//        self.appDelegate.setLocalAuthentication()
        let needAppPassword = UserDefaults.standard.bool(forKey: "NeedAppPassword")
        guard let appPassword = UserDefaults.standard.string(forKey: "AppPassword") else {
            return
        }
        if needAppPassword {
            
        } else {
            
        }
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        let appLockConfig = UserDefaults.standard.bool(forKey: "AppLockConfig")
        if appLockConfig {
            UserDefaults.standard.set(true, forKey: "NeedAppPassword")
        } else {
            UserDefaults.standard.set(false, forKey: "NeedAppPassword")
        }
    }
}
@available(iOS 13.0, *)
extension SceneDelegate {
    func setLightTheme() {
        self.window?.overrideUserInterfaceStyle = .light
    }

    func setDarkTheme() {
        self.window?.overrideUserInterfaceStyle = .dark
    }
    
    func setSystemTheme() {
        self.window?.overrideUserInterfaceStyle = .unspecified
    }
}
