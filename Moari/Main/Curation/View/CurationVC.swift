//
//  CurationVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CurationVC: BaseVC, CurationVCProtocol {

    weak var actor: CurationActorDelegate?
    
    var logoButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setColorModeUI()
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setColorModeUI()
    }
    
    func setLightModeUI() {
        self.logoButton.setImage(UIImage(named: "navigationTitleLogoCurationLight"), for: .normal)
    }
    
    func setDarkModeUI() {
        self.logoButton.setImage(UIImage(named: "navigationTitleLogoCurationDark"), for: .normal)
    }
    
    func setSystemColorModeUI() {
        if self.isDarkMode {
            self.setDarkModeUI()
        } else {
            self.setLightModeUI()
        }
    }
    
    func setColorModeUI() {
        switch self.theme {
        case 0:
            self.setLightModeUI()
        case 1:
            self.setDarkModeUI()
        case 2:
            self.setSystemColorModeUI()
        default:
            self.setLightModeUI()
        }
    }
}
