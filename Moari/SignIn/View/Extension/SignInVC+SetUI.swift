//
//  SignInVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/19.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension SignInVC {
    func setSignInVCUI() {
        
        var signInTitleLabelAttributedString = NSMutableAttributedString()
        if self.deviceLocale.isEqual("ko") { // 한국어일때
            signInTitleLabelAttributedString = NSMutableAttributedString(string: "모아 보는 리뷰, 모아리", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 17.0)!,
              .foregroundColor: UIColor(white: 0.0, alpha: 1.0),
              .kern: 0.0
            ])
            signInTitleLabelAttributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 17.0)!, range: NSRange(location: 10, length: 3))
        } else if self.deviceLocale.isEqual("en") { // 영어일때
            
        }
        
        self.signInTitleLabel.attributedText = signInTitleLabelAttributedString
        self.emailTextField.layer.cornerRadius = 3
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.emailTextField.leftView = emailPaddingView
        self.emailTextField.leftViewMode = .always
        self.emailTextField.attributedPlaceholder = self.emailTextFieldPlaceholder
        
        self.passwordTextField.layer.cornerRadius = 3
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.passwordTextField.leftView = passwordPaddingView
        self.passwordTextField.leftViewMode = .always
        self.passwordTextField.attributedPlaceholder = self.passwordTextFieldPlaceholder
        
        self.signInButtonLabel.text = "SIGNIN".localized
        self.signInButtonLabel.layer.borderWidth = 1.0
        self.signInButtonLabel.layer.cornerRadius = 3
        
        self.findEmailPasswordLabel.text = "FIND_EMAIL_PASSWORD_TITLE".localized
        self.signUpLabel.text = "SIGNUP".localized
        
        if self.isIphone == .iPhone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                self.signInLogoTopConstraint.constant = 100
                self.findEmailPasswordLabelRightConstraint.constant = 15
                self.signUpLabelLeftConstraint.constant = 18
                self.borderBarViewCenterConstraint.constant = 35
            case 1334:
                self.signInLogoTopConstraint.constant = 120
                self.findEmailPasswordLabelRightConstraint.constant = 25
                self.signUpLabelLeftConstraint.constant = 25
            default:
                self.signInLogoTopConstraint.constant = 140
            }
            
        } else if self.isIphone == .iPad {
            
        }
    }
    
    func initTapListener() {
        let signInListener = UITapGestureRecognizer(target: self, action: #selector(self.pressSignInButton(_:)))
        self.signInButtonLabel.isUserInteractionEnabled = true
        self.signInButtonLabel.addGestureRecognizer(signInListener)
        
        let findEmailPasswordListener = UITapGestureRecognizer(target: self, action: #selector(self.pressFindEmailPasswordButton(_:)))
        self.findEmailPasswordLabel.isUserInteractionEnabled = true
        self.findEmailPasswordLabel.addGestureRecognizer(findEmailPasswordListener)
        
        let signUpListener = UITapGestureRecognizer(target: self, action: #selector(self.pressSignUpButton(_:)))
        self.signUpLabel.isUserInteractionEnabled = true
        self.signUpLabel.addGestureRecognizer(signUpListener)
    }
    
    @objc func pressSignInButton(_ sender: UILabel) {
        self.actor?.didTapSignInButton(fromVC: self)
    }
    
    @objc func pressFindEmailPasswordButton(_ sender: UILabel) {
        self.actor?.didTapFindEmailPasswordLabel()
    }
    
    @objc func pressSignUpButton(_ sender: UILabel) {
        self.actor?.didTapSignUpLabel()
    }
}
