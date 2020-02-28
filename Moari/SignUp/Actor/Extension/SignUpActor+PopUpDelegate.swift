//
//  SignUpActor+PopUpDelegate.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension SignUpActor: SignUpPopUpDelegate {
    
    func pressSignInButton() {
        self.dataManager?.signInAfterSignUp(email: self.view?.email ?? "", password: self.view?.password ?? "")
    }
}
