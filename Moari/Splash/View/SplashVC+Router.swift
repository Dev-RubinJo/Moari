//
//  SplashVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import KWDrawerController

extension SplashVC: SplashVCRouterDelegate {
    
    weak var window: UIWindow? {
        get {
            if #available(iOS 13.0, *) {
                return UIApplication.shared.windows.first ?? UIWindow.init(frame: UIScreen.main.bounds)
            } else {
                return UIApplication.shared.keyWindow
            }
        }
    }
    
    static var makeSplashVC: SplashVC {
        get {
            let vc = SplashVC()
            let actor = SplashActor.shared
            let dataManager = SplashDataManager.shared
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            
            return vc
        }
    }
    
    func presentMainVC() {
        let mainRootVC = MainVC.makeMainVC
        let mainDrawerVC = DrawerVC()
        let mainVC = DrawerController()

        mainVC.setViewController(mainRootVC, for: .none)
        mainVC.setViewController(mainDrawerVC, for: .left)
        
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
        UIView.transition(with: self.window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    func presentSignInVC() {
        let signInVC = UINavigationController.init(rootViewController: SignInVC.makeSignInVC) 
        self.window?.rootViewController = signInVC
        self.window?.makeKeyAndVisible()
        UIView.transition(with: self.window!, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    /// 앱잠금이 있을경우 띄워주는 VC
    func presentAppLockVC() {
        
    }
}
