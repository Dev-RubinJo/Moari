//
//  SignInVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

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
            let actor = SignInActor.shared
            let dataManager = SignInDataManager.shared
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
    // TODO: MainVC 만들어서 넣기
    
    func presentMainVC() {
        let mainVC = MainVC.makeMainVC
        
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
    }
    
//    func presentMainVC() {
//        let mainRootVC = MainVC.makeMainVC
//        let menuVC = DrawerVC()
//        let mainVC = DrawerController()
//
//        mainVC.setViewController(mainRootVC, for: .none)
//        mainVC.setViewController(menuVC, for: .left)
//
//
//        self.window?.rootViewController = mainVC
//        self.window?.makeKeyAndVisible()
//    }
    
    // TODO: FindEmailPasswordVC 만들어서 넣기
    func presentFindEmailPasswordVC() {
        let findVC = FindEmailPasswordVC.makeFindEmailPasswordVC
        self.navigationController?.pushViewController(findVC, animated: true)
    }
    // TODO: SignUpVC 만들어서 넣기
    func presentSignUpVC() {
        let signUpVC = SignUpVC.makeSignUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
