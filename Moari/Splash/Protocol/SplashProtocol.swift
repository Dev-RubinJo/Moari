//
//  SplashProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

protocol SplashVCProtocol {
    
    var actor: SplashActorDelegate? { get set }
}

protocol SplashVCRouterDelegate: class {
    
    var window: UIWindow? { get }
    
    static var makeSplashVC: SplashVC { get }
    
    func presentMainVC()
    
    func presentSignInVC()
}

protocol SplashActorDelegate: class {
    
    var view: SplashVCRouterDelegate? { get set }
    
    var dataManager: SplashDataManagerDelegate? { get set }
    
    func didLoadSplash(fromVC vc: SplashVC)
    
    func vaildToken()
    
    func invalidToken()
    
}

protocol SplashAlertActorDelegate: class {
    
    func presentInvalidTokenAlert(toVC vc: SplashVC)
}

protocol SplashDataManagerDelegate: class {
    
    var actor: (SplashActorDelegate & SplashAlertActorDelegate)? { get set }
    
    func checkToken(fromVC vc: SplashVC)
}
