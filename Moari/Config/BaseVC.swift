//
//  BaseVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import LocalAuthentication

class BaseVC: UIViewController {
    
    private let authContext = LAContext()
    
    var isDarkModeValue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initBaseVC()
        self.setLocalAuthentication()
        self.setBaseColorModeUI()
        UITextField.appearance().tintColor = .cursorColor
//        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initBaseVC()
        self.setBaseColorModeUI()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        switch self.isIphone {
        case .iPhone:
            return [.portrait]
        case .iPad:
            return [.portrait, .landscape]
//        @unknown case _:
//            return [.portrait]
        }
    }
    
    func initBaseVC() {
        self.hideKeyboardWhenTappedAround()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: .navigationBarBottomBorder)
        let navigationTitleFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationTitleFont!]
    }
    
    func setBaseLightModeUI() {
        let imageBack = UIImage(named: "backArrowLight")
        self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: imageBack, style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func setBaseDarkModeUI() {
        let imageBack = UIImage(named: "backArrowDark")
        self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: imageBack, style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setBaseSystemColorModeUI() {
        if self.isDarkMode {
            self.setBaseDarkModeUI()
        } else {
            self.setBaseLightModeUI()
        }
    }
    
    func setBaseColorModeUI() {
        switch self.theme {
        case 0:
            self.setBaseLightModeUI()
        case 1:
            self.setBaseDarkModeUI()
        case 2:
            self.setBaseSystemColorModeUI()
        default:
            self.setBaseLightModeUI()
        }
    }
    
    /// Touch Id, Face Id Example
    func setLocalAuthentication() {
        var description = ""
        if self.authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            switch self.authContext.biometryType {
            case .faceID:
                description = "잠금 해제를 위해 Face Id로 인증합니다."
            case .touchID:
                description = "잠금 해제를 위해 Touch Id로 인증합니다."
            case .none:
                print(description)
                break
            @unknown default:
                break
            }
        }
        
//        self.authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { (success, error) in
//            if success {
//
//            } else {
//
//            }
//        }
    }
    
    func appearIndicator() {
        self.indicator.show()
    }
    
    func disappearIndicator() {
        self.indicator.dismiss()
    }
    
    func delay(_ delay:Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
}

