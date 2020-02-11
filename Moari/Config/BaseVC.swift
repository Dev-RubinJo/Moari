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
        self.hideKeyboardWhenTappedAround()
        self.setLocalAuthentication()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        switch self.isIphone {
        case .iPhone:
            return [.portrait]
        case .iPad:
            return [.portrait, .landscape]
        @unknown case _:
            return [.portrait]
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
}

