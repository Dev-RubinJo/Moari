//
//  SignInVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SignInVC: BaseVC, SignInVCDelegate {

    weak var actor: SignInActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVC()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    func initVC() {
        self.setDarkModeUI()
    }
    
    func setDarkModeUI() {
        if self.isDarkMode {
            
        } else {
            
        }
    }
}
extension SignInVC: SignInVCRouterDelegate {
    
    static func makeSignInVC() -> SignInVC {
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
