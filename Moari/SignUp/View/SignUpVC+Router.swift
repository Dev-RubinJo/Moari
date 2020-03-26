//
//  SignUpVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import KWDrawerController
import SafariServices

extension SignUpVC: SignUpVCRouterDelegate {
    
    weak var window: UIWindow? {
        get {
            UIApplication.shared.windows.first
        }
    }
    
    static var makeSignUpVC: SignUpVC {
        get {
            let vc = SignUpVC()
            let actor = SignUpActor()
            let dataManager = SignUpDataManager()
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
    
    func presentUsingPolicyView() {
        self.usingPolicyCheck = true
        self.usingTermCheckButtonImageView.image = UIImage(named: "checkOn")
        guard let url = URL(string: "https://webtoondaram.s3.ap-northeast-2.amazonaws.com/agree.html") else { return }
        let usingPolicyWebView = SFSafariViewController(url: url)
        self.present(usingPolicyWebView, animated: true, completion: nil)
        //  https://webtoondaram.s3.ap-northeast-2.amazonaws.com/agree.html
    }
    
    func presentPersonPolicyView() {
        self.personalPolicyCheck = true
        self.personalTermCheckButtonImageView.image = UIImage(named: "checkOn")
        guard let url = URL(string: "https://webtoondaram.s3.ap-northeast-2.amazonaws.com/infoagree.html") else { return }
        let usingPolicyWebView = SFSafariViewController(url: url)
        self.present(usingPolicyWebView, animated: true, completion: nil)
        //  https://webtoondaram.s3.ap-northeast-2.amazonaws.com/infoagree.html
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
