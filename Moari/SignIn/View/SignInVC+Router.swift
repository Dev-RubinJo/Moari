//
//  SignInVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import KWDrawerController

extension SignInVC: SignInVCRouterDelegate {
    
    weak var window: UIWindow? {
        get {
            if #available(iOS 13.0, *) {
                return UIApplication.shared.windows.first ?? UIWindow.init(frame: UIScreen.main.bounds)
            } else {
                return UIApplication.shared.keyWindow
            }
        }
    }

    static var makeSignInVC: SignInVC {
        get {
            let vc = SignInVC()
            let actor = SignInActor()
            let dataManager = SignInDataManager()
            
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
    
    func presentFindEmailPasswordVC() {
        let findVC = FindEmailPasswordVC.makeFindEmailPasswordVC
        self.navigationController?.pushViewController(findVC, animated: true)
    }
    
    func presentSignUpVC() {
        let signUpVC = SignUpVC.makeSignUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
