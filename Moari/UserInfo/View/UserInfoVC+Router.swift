//
//  UserInfoVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension UserInfoVC: UserInfoVCRouterDelegate {
    
    unowned var window: UIWindow? {
        get {
            UIApplication.shared.windows.first
        }
    }
    
    static var makeUserInfoVC: UserInfoVC {
        get {
            let vc = UserInfoVC()
            let actor = UserInfoActor()
            let dataManager = UserInfoDataManager()
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
    
    func presentSignInVC() {
        let signInVC = UINavigationController.init(rootViewController: SignInVC.makeSignInVC)
        self.window?.rootViewController = signInVC
        self.window?.makeKeyAndVisible()
        UIView.transition(with: self.window!, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
