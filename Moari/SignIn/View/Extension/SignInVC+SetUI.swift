//
//  SignInVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/19.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension SignInVC {
    func setSignInVCPhoneUI() {
        
        if self.isIphone == .iPhone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                self.signInLogoTopConstraint.constant = 100
            default:
                self.signInLogoTopConstraint.constant = 140
            }
        }
        
        var signInTitleLabelAttributedString = NSMutableAttributedString()
        if self.deviceLocale.isEqual("ko") {
            signInTitleLabelAttributedString = NSMutableAttributedString(string: "모아 보는 리뷰, 모아리", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 17.0)!,
              .foregroundColor: UIColor(white: 0.0, alpha: 1.0),
              .kern: 0.0
            ])
            signInTitleLabelAttributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 17.0)!, range: NSRange(location: 10, length: 3))
        } else if self.deviceLocale.isEqual("en") {
            
        }
        
        
        self.signInTitleLabel.attributedText = signInTitleLabelAttributedString
        self.emailTextField.layer.cornerRadius = 3
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.emailTextField.leftView = emailPaddingView
        self.emailTextField.leftViewMode = .always
        
        self.passwordTextField.layer.cornerRadius = 3
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.passwordTextField.leftView = passwordPaddingView
        self.passwordTextField.leftViewMode = .always
        
        self.signInButtonLabel.text = "SIGNIN".localized
        self.signInButtonLabel.layer.borderWidth = 1.0
        self.signInButtonLabel.layer.cornerRadius = 3
    }
    
    func setSignInVCPadUI() {
        
    }
}
