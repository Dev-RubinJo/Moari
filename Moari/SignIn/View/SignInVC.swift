//
//  SignInVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SignInVC: BaseVC, SignInVCDelegate {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var signInTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButtonLabel: UILabel!
    @IBOutlet weak var findEmailPasswordLabel: UILabel!
    @IBOutlet weak var borderBarView: UIView!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var signInLogoTopConstraint: NSLayoutConstraint!
    
    weak var actor: SignInActorDelegate?
    
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
//        self.setDarkModeUI()
        if self.isIphone == .iPhone {
            self.setSignInVCPhoneUI()
        } else if self.isIphone == .iPad {
            
        }
    }
    
    func setLightModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageLight")
        self.signInTitleLabel.textColor = .black
        
        self.emailTextField.backgroundColor = .signInTextFieldGray
        self.passwordTextField.backgroundColor = .signInTextFieldGray
        
        self.signInButtonLabel.textColor = .deepPink
        self.signInButtonLabel.layer.borderColor = UIColor.deepPink.cgColor
        
        self.findEmailPasswordLabel.textColor = .brownishGrey
        self.signUpLabel.textColor = .brownGrey
    }
    
    func setDarkModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageDark")
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
extension SignInVC: SignInVCRouterDelegate {
    
    static func makeSignInVC() -> SignInVC {
        let vc = SignInVC()
        let actor = SignInActor.shared
        let dataManager = SignInDataManager.shared
        
        vc.actor = actor
        actor.view = vc
        actor.dataManager = dataManager
        dataManager.actor = actor
        return vc
    }
    
    func presentMainVC() {
        
    }
    
    func presentFindEmailPasswordVC() {
        
    }
    
    func presentSignUpVC() {
        
    }
}
