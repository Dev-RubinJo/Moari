//
//  SignUpActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation
import Firebase

class SignUpActor: SignUpActorDelegate {
    
    weak var view: (SignUpVCProtocol & SignUpVCRouterDelegate)?
    var dataManager: SignUpDataManagerDelegate?
    
    func didTapUsingTermLabel() {
        Analytics.logEvent("Did_Tap_Using_Policy_ios", parameters: ["req": "Did_Tap_Using_Policy_ios"])
        self.view?.presentUsingPolicyView()
    }
    
    func didTapUsingTermCheckImageView(updateVC vc: SignUpVC) {
        if vc.usingPolicyCheck {
            vc.usingTermCheckButtonImageView.image = vc.checkOffImage
            vc.usingPolicyCheck = false
        } else {
            vc.usingTermCheckButtonImageView.image = vc.checkOnImage
            vc.usingPolicyCheck = true
        }
    }
    
    func didTapPersonalTermLabel() {
        Analytics.logEvent("Did_Tap_Personal_Policy_ios", parameters: ["req": "Did_Tap_Personal_Policy_ios"])
        self.view?.presentPersonPolicyView()
    }
    
    func didTapPersonalTermCheckImageView(updateVC vc: SignUpVC) {
        if vc.personalPolicyCheck {
            vc.personalTermCheckButtonImageView.image = vc.checkOffImage
            vc.personalPolicyCheck = false
        } else {
            vc.personalTermCheckButtonImageView.image = vc.checkOnImage
            vc.personalPolicyCheck = true
        }
    }
    
    func didTapSignUpButton(fromVC vc: SignUpVC) {
        guard let email = vc.emailTextField.text else { return }
        guard let password = vc.passwordTextField.text else { return }
        guard let nickName = vc.nickNameTextField.text else { return }
        self.dataManager?.signUp(fromVC: vc, email: email, password: password, nickName: nickName)
    }
    
    func completeSignInAfterSignUp() {
        self.view?.presentMainVC()
    }
}
