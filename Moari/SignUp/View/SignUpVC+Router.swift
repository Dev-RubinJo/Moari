//
//  SignUpVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

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
        let mainVC = MainVC.makeMainVC
        
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
    }
}
