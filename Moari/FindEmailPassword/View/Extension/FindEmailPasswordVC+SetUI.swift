//
//  FindEmailPasswordVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension FindEmailPasswordVC {
    
    func setFindEmailPasswordVCUI() {
        self.navigationItem.title = "FIND_EMAIL_PASSWORD_TITLE".localized
        
        self.findEmailPasswordGuideLabel.text = "FIND_EMAIL_PASSWORD_GUIDE_LABEL".localized
        
        let emailTextFieldPlaceholder = NSAttributedString(string: "EMAIL".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.emailTextField.attributedPlaceholder = emailTextFieldPlaceholder
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.emailTextField.leftView = emailPaddingView
        self.emailTextField.leftViewMode = .always
        self.emailTextField.layer.cornerRadius = 3
        
        let buttonTitleFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        let checkEmailButtonTitle = NSAttributedString(string: "FIND_EMAIL_PASSWORD_CHECK_EMAIL_BUTTON_TITLE".localized, attributes: [NSAttributedString.Key.font: buttonTitleFont!])
        self.checkEmailButton.setAttributedTitle(checkEmailButtonTitle, for: .normal)
        self.checkEmailButton.layer.cornerRadius = 3
        if #available(iOS 13.0, *) {
            self.checkEmailButton.layer.borderColor = UIColor.systemWBColor.cgColor
        } else {
            self.checkEmailButton.layer.borderColor = UIColor.black.cgColor
        }
        self.checkEmailButton.layer.borderWidth = 1
        
        
        let sendTemporaryPasswordButtonTitle = NSAttributedString(string: "FIND_EMAIL_PASSWORD_SEND_TEMP_PASSWORD_BUTTON_TITLE".localized, attributes: [NSAttributedString.Key.font: buttonTitleFont!])
        self.sendTemporaryPasswordButton.setAttributedTitle(sendTemporaryPasswordButtonTitle, for: .normal)
        self.sendTemporaryPasswordButton.tintColor = .defaultPink
        self.sendTemporaryPasswordButton.layer.cornerRadius = 3
        self.sendTemporaryPasswordButton.layer.borderColor = UIColor.defaultPink.cgColor
        self.sendTemporaryPasswordButton.layer.borderWidth = 1
        
        
        self.alertLabel.isHidden = true
        self.sendTemporaryPasswordButton.isHidden = true
        self.temporaryPasswordAlertLabel.isHidden = true
        if self.isIphone == .iPhone {
            
        } else if self.isIphone == .iPad {
            
        }
    }
    
    func initTapListener() {
        self.checkEmailButton.addTarget(self, action: #selector(self.pressCheckEmailButton(_:)), for: .touchUpInside)
        self.sendTemporaryPasswordButton.addTarget(self, action: #selector(self.pressSendTemporaryPasswordButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressCheckEmailButton(_ sender: UIButton) {
        self.actor?.didTapCheckForRegisteredEmailButton(fromVC: self)
    }
    
    @objc func pressSendTemporaryPasswordButton(_ sender: UIButton) {
        self.actor?.didTapSendTemporaryPasswordButton(fromVC: self)
    }
}
