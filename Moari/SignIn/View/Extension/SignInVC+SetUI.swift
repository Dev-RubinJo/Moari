//
//  SignInVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/19.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Firebase

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
        self.signInButtonLabel.layer.borderColor = UIColor.defaultPink.cgColor
        
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
    
    @objc func keyboardWillShow(_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String: Any] else {return}
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardHeight = keyboardFrame.cgRectValue.height
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                self.view.frame.origin.y = -keyboardHeight + 120 // 키보드 높이만큼 위로 올라가기
            case 1334:
                self.view.frame.origin.y = -keyboardHeight + 200
            default:
                return
            }
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0 // Move view to original position
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
        Analytics.logEvent("pressSignIn_ios", parameters: ["req": "pressSignIn_ios"])
        self.actor?.didTapSignInButton(fromVC: self)
    }
    
    @objc func pressFindEmailPasswordButton(_ sender: UILabel) {
        Analytics.logEvent("pressFindEmailPassword_ios", parameters: ["req": "pressFindEmailPassword_ios"])
        self.actor?.didTapFindEmailPasswordLabel()
    }
    
    @objc func pressSignUpButton(_ sender: UILabel) {
        Analytics.logEvent("pressSignUp_ios", parameters: ["req": "pressSignUp_ios"])
        self.actor?.didTapSignUpLabel()
    }
}
