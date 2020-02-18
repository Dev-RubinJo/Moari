//
//  SplashActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//
import UIKit

class SplashActor: SplashActorDelegate {
    
    static let shared = SplashActor()
    private init() {}
    
    weak var view: SplashVCRouterDelegate?
    weak var dataManager: SplashDataManagerDelegate?
    
    func didLoadSplash(fromVC vc: SplashVC) {
        self.dataManager?.checkToken(fromVC: vc)
    }
    
    func presentInvalidTokenAlert(toVC vc: SplashVC) {
        vc.presentAlert(title: "OUT_OF_TOKEN_TITLE".localized, message: "OUT_OF_TOKEN_CONTENT".localized)
    }
    
    func vaildToken() {
        self.view?.presentMainVC()
    }
    
    func invalidToken() {
        self.view?.presentSignInVC()
    }
}
