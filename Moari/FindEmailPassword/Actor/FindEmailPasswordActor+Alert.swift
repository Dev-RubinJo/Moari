//
//  FindEmailPasswordActor+Alert.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension FindEmailPasswordActor: FindEmailPasswordAlertActorDelegate {
    
    func presentInvalidEmailAlert(toVC vc: FindEmailPasswordVC) {
        vc.presentAlert(title: "INVALID_EMAIL_TITLE".localized, message: "INVALID_EMAIL_MESSAGE".localized)
    }
}
