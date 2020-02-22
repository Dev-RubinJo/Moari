//
//  SplashVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SplashVC: BaseVC, SplashVCProtocol {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    static let viewRouter: SplashVCRouterDelegate = SplashVC()
    
    weak var actor: SplashActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setColorModeUI()
        self.delay(0.5) { [weak self] in
            self?.actor?.didLoadSplash(fromVC: self!)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setColorModeUI()
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
