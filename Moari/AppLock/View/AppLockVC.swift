//
//  AppLockVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/15.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import LocalAuthentication

class AppLockVC: BaseVC {
    // default value 100
    @IBOutlet weak var mainLogoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstPwdView: UIView!
    @IBOutlet weak var secondPwdView: UIView!
    @IBOutlet weak var thirdPwdView: UIView!
    @IBOutlet weak var fourthPwdView: UIView!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var passwordDeleteButton: UIButton!
    
    var password: String = ""
    
    //AppPassword -> UserDefaults.standard Key
    private let authContext = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setAppLockVC()
//        UserDefaults.standard.set(true, forKey: "AppLockConfig")
//        UserDefaults.standard.set(true, forKey: "NeedAppPassword")
        if UserDefaults.standard.bool(forKey: "NeedAppPassword") {
            self.setLocalAuthentication()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let theme = UserDefaults.standard.integer(forKey: "Theme")
        switch theme {
        case 0:
            if #available(iOS 13.0, *) {
                UIApplication.shared.statusBarStyle = .darkContent
            } else {
                UIApplication.shared.statusBarStyle = .default
            }
            break
        case 1:
            UIApplication.shared.statusBarStyle = .lightContent
            break
        case 2:
            UIApplication.shared.statusBarStyle = .default
            break
        default:
            UIApplication.shared.statusBarStyle = .default
            break
        }
    }
}
extension AppLockVC {
    
    func setAppLockVC() {
        
        if UIDevice().userInterfaceIdiom == .phone {
        switch UIScreen.main.nativeBounds.height {
        case 1136: // se1
            self.mainLogoTopConstraint.constant = 100
            break;
        case 1334:
            //                print("iPhone 6/6S/7/8")
            self.mainLogoTopConstraint.constant = 150
            break;
        case 1920:
            //                print("iPhone 6+/6S+/7+/8+")
            self.mainLogoTopConstraint.constant = 200
            break;
        case 2436:
            //                print("iPhone X, XS")
            self.mainLogoTopConstraint.constant = 200
            break;
        case 1792, 2688:
            //                print("iPhone XR, XS MAX")
            self.mainLogoTopConstraint.constant = 280
            break;
        default:
            break;
            }
        }

        self.firstPwdView.layer.cornerRadius = 12.5
        self.firstPwdView.isHidden = true
        self.secondPwdView.layer.cornerRadius = 12.5
        self.secondPwdView.isHidden = true
        self.thirdPwdView.layer.cornerRadius = 12.5
        self.thirdPwdView.isHidden = true
        self.fourthPwdView.layer.cornerRadius = 12.5
        self.fourthPwdView.isHidden = true
        
        
    }
    
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
        
        self.authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { (success, error) in
            if success {
                DispatchQueue.main.async {
                    
                    self.dismiss(animated: false, completion: nil)
                }
            } else {
                print(error)
            }
        }
    }
}
// MARK: - Tap Listener extension
extension AppLockVC {
    func initTapListener() {
        
    }
    
    @objc func pressOneButton() {
        
    }
    
    @objc func pressTwoButton() {
        
    }
    
    @objc func pressThreeButton() {
        
    }
    
    @objc func pressFourButton() {
        
    }
    
    @objc func pressFiveButton() {
        
    }
    
    @objc func pressSixButton() {
        
    }
    
    @objc func pressSevenButton() {
        
    }
    
    @objc func pressEightButton() {
        
    }
    
    @objc func pressNineButton() {
        
    }
    
    @objc func pressZeroButton() {
        
    }
    
    @objc func pressDeleteButton() {
        
    }
}
