//
//  SplashProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

protocol SplashVCDelegate: class, BaseVCProtocol {
    
    var actor: SplashActorDelegate? { get set }
}

protocol SplashVCRouterDelegate: class {
    
    func makeSplashVC() -> SplashVC
    
    func presentMainVC()
    
    func presentSignInVC()
}

protocol SplashActorDelegate: class {
    
    var view: SplashVCRouterDelegate? { get set }
    
    var dataManager: SplashDataManagerDelegate? { get set }
    
    func didLoadSplash(fromVC vc: SplashVC)
    
    func presentInvalidTokenAlert(toVC vc: SplashVC)
    
    func vaildToken()
    
    func invalidToken()
    
}

protocol SplashDataManagerDelegate: class {
    
    var actor: SplashActorDelegate? { get set }
    
    func checkToken(fromVC vc: SplashVC)
}
