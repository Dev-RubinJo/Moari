//
//  SplashVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SplashVC: BaseVC, SplashVCDelegate {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    static let viewRouter: SplashVCRouterDelegate = SplashVC()
    
    private var window: UIWindow? {
        get {
            if #available(iOS 13.0, *) {
                return UIApplication.shared.windows.first ?? UIWindow.init(frame: UIScreen.main.bounds)
            } else {
                return UIApplication.shared.keyWindow
            }
        }
    }
    
    weak var actor: SplashActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVC()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setColorModeUI()
    }
    
    func initVC() {
        self.setColorModeUI()
        self.delay(0.5) { [weak self] in
            self?.actor?.didLoadSplash(fromVC: self!)
        }
        
    }
    
    func setLightModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageLight")
    }
    
    func setDarkModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageDark")
    }
    
    func setSystemColorModeUI() {
        if self.isDarkMode {
            self.logoImageView.image = UIImage(named: "logoImageDark")
        } else {
            // User Interface is Light
            self.logoImageView.image = UIImage(named: "logoImageLight")
        }
    }
    
    func setColorModeUI() {
        switch self.theme {
        case 0:
            self.setLightModeUI()
        case 1:
            self.setDarkModeUI()
        case 2:
            if #available(iOS 13.0, *) {
                self.setSystemColorModeUI()
            } else {
                fallthrough
            }
        default:
            self.setLightModeUI()
        }
    }
}

extension SplashVC: SplashVCRouterDelegate {
    func makeSplashVC() -> SplashVC {
        let vc = SplashVC()
        let actor = SplashActor.shared
        let dataManager = SplashDataManager.shared
        
        vc.actor = actor
        actor.view = vc
        actor.dataManager = dataManager
        dataManager.actor = actor
        
        return vc
    }
    
    func presentMainVC() {
        // TODO: makeMainVC func 만들어서 적용하기, set what is First. Curation? Category?
    }
    
    func presentSignInVC() {
        let signInVC = SignInVC.makeSignInVC()
        self.window?.rootViewController = signInVC
        self.window?.makeKeyAndVisible()
        UIView.transition(with: self.window!, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
