//
//  SignInActor+Alert.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension SignInActor: SignInAlertActorDelegate {
    
    func presentValidationAlert(toVC vc: SignInVC, email: Bool, password: Bool) {
        var title = ""
        var message = ""
        if !email && !password {
            title = "INVALID_EMAIL_PASSWORD_TITLE".localized
            message = "INVALID_EMAIL_PASSWORD_MESSAGE".localized
        } else if !email {
            title = "INVALID_EMAIL_TITLE".localized
            message = "INVALID_EMAIL_MESSAGE".localized
        } else if !password {
            title = "INVALID_PASSWORD_TITLE".localized
            message = "INVALID_PASSWORD_MESSAGE".localized
        }
        vc.presentAlert(title: title, message: message)
    }
}
