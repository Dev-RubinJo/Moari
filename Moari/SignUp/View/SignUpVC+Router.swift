//
//  SignUpVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import KWDrawerController

extension SignUpVC: SignUpVCRouterDelegate {
    
    weak var window: UIWindow? {
        get {
            if #available(iOS 13.0, *) {
                return UIApplication.shared.windows.first ?? UIWindow.init(frame: UIScreen.main.bounds)
            } else {
                return UIApplication.shared.keyWindow
            }
        }
    }
    
    static var makeSignUpVC: SignUpVC {
        get {
            let vc = SignUpVC()
            let actor = SignUpActor.shared
            let dataManager = SignUpDataManager.shared
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
    
    func presentUsingPolicyView() {
        self.usingPolicyCheck = true
    }
    
    func presentPersonPolicyView() {
        self.personalPolicyCheck = true
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
}
