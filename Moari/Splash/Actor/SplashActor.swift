//
//  SplashActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//
import UIKit
import Firebase

class SplashActor: SplashActorDelegate {
    
    weak var view: SplashVCRouterDelegate?
    var dataManager: SplashDataManagerDelegate?
    
    func didLoadSplash(fromVC vc: SplashVC) {
        self.dataManager?.checkToken(fromVC: vc)
    }
    
    func vaildToken() {
        Analytics.logEvent("ValidToken_ios", parameters: ["req": "ValidToken_ios"])
        // setUserPropertyString: ""
        self.view?.presentMainVC()
    }
    
    func invalidToken() {
        Analytics.logEvent("invalidToken_ios", parameters: ["req": "invalidToken_ios"])
        self.view?.presentSignInVC()
    }
    
    deinit {
        print("splash deinit actor")
    }
}
