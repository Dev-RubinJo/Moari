//
//  SignUpActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation

class SignUpActor: SignUpActorDelegate {
    
    static let shared = SignUpActor()
    private init() {}
    
    weak var view: SignUpVCRouterDelegate?
    weak var dataManager: SignUpDataManagerDelegate?
    
    func didTapUsingTermLabel() {
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
}
