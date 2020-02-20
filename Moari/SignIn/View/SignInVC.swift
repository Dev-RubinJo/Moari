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
    
    var emailTextFieldPlaceholder = NSAttributedString(string: "EMAIL".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
    var passwordTextFieldPlaceholder = NSAttributedString(string: "PASSWORD".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
    
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
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        if self.isIphone == .iPhone {
            self.setSignInVCPhoneUI()
        } else if self.isIphone == .iPad {
            
        }
    }
    
    func setLightModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageLight")
        self.signInTitleLabel.textColor = .black
        
        self.emailTextField.backgroundColor = .signInTextFieldGrayLight
        self.passwordTextField.backgroundColor = .signInTextFieldGrayLight
        
        self.signInButtonLabel.textColor = .defaultPink
        self.signInButtonLabel.layer.borderColor = UIColor.defaultPink.cgColor
        
        self.findEmailPasswordLabel.textColor = .signInBottomLabels
        self.signUpLabel.textColor = .signInBottomLabels
    }
    
    func setDarkModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageDark")
        self.signInTitleLabel.textColor = .white
        
        self.emailTextField.backgroundColor = .signInTextFieldGrayDark
        self.passwordTextField.backgroundColor = .signInTextFieldGrayDark
        
        self.signInButtonLabel.textColor = .defaultPink
        self.signInButtonLabel.layer.borderColor = UIColor.defaultPink.cgColor
        
        self.findEmailPasswordLabel.textColor = .signInBottomLabels
        self.signUpLabel.textColor = .signInBottomLabels
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
    // TODO: MainVC 만들어서 넣기
    func presentMainVC() {
        
    }
    // TODO: FindEmailPasswordVC 만들어서 넣기
    func presentFindEmailPasswordVC() {
        
    }
    // TODO: SignUpVC 만들어서 넣기
    func presentSignUpVC() {
        
    }
}
