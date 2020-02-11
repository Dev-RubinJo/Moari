//
//  SplashVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SplashVC: BaseVC, SplashVCDelegate {
    
    @IBOutlet weak var splashVCLabel: UILabel!
    
    static let viewRouter: SplashVCRouterDelegate = SplashVC()
    
    private let window: UIWindow = UIApplication.shared.windows.first ?? UIWindow.init(frame: UIScreen.main.bounds)
    
    weak var actor: SplashActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.initVC()
    }
    
    func initVC() {
        print("init")
        
        
        
        self.setDarkModeUI()
    }
    
    func setDarkModeUI() {
        if self.isDarkMode {
            
        } else {
            // User Interface is Light
            
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
        
    }
    
    func presentSignInVC() {
        
    }
    
    
}
