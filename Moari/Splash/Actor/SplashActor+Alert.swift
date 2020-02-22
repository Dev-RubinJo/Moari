//
//  SplashActor+Alert.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension SplashActor: SplashAlertActorDelegate {
    
    func presentInvalidTokenAlert(toVC vc: SplashVC) {
        vc.presentAlert(title: "OUT_OF_TOKEN_TITLE".localized, message: "OUT_OF_TOKEN_CONTENT".localized)
    }
}
