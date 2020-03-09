//
//  SignUpVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/26.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension SignUpVC {
    func setSignUpVCUI() {
        self.navigationItem.title = "SIGN_UP_TITLE".localized
        
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: .navigationBarBottomBorder)
        
        let emailTextFieldPlaceholder = NSAttributedString(string: "EMAIL".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.emailTextField.attributedPlaceholder = emailTextFieldPlaceholder
        let emailPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.emailTextField.leftView = emailPaddingView
        self.emailTextField.leftViewMode = .always
        self.emailTextField.layer.cornerRadius = 3
        
        let passwordTextFieldPlaceholder = NSAttributedString(string: "PASSWORD_SIGN_UP_PLACEHOLDER".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.passwordTextField.attributedPlaceholder = passwordTextFieldPlaceholder
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.passwordTextField.leftView = passwordPaddingView
        self.passwordTextField.leftViewMode = .always
        self.passwordTextField.layer.cornerRadius = 3
        
        let passwordCheckTextFieldPlaceholder = NSAttributedString(string: "PASSWORD_CHECK_PLACEHOLDER".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.passwordCheckTextField.attributedPlaceholder = passwordCheckTextFieldPlaceholder
        let passwordCheckPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.passwordCheckTextField.leftView = passwordCheckPaddingView
        self.passwordCheckTextField.leftViewMode = .always
        self.passwordCheckTextField.layer.cornerRadius = 3
        
        let nickNameTextFieldPlaceholder = NSAttributedString(string: "NICKNAME_PLACEHOLDER".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.nickNameTextField.attributedPlaceholder = nickNameTextFieldPlaceholder
        let nickNamePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.nickNameTextField.leftView = nickNamePaddingView
        self.nickNameTextField.leftViewMode = .always
        self.nickNameTextField.layer.cornerRadius = 3
        
        self.usingTermLabel.text = "USING_POLICY_LABEL".localized
        self.personalTermLabel.text = "PERSONAL_POLICY_LABEL".localized
        
        self.usingTermArrowImageView.image = UIImage(named: "goNextButton")
        self.personalTermArrowImageView.image = UIImage(named: "goNextButton")
        
        self.signUpButton.setTitle("SIGN_UP_BUTTON".localized, for: .normal)
        self.signUpButton.layer.cornerRadius = 3
        self.signUpButton.layer.borderColor = UIColor.defaultPink.cgColor
        self.signUpButton.layer.borderWidth = 1
        
        if self.isIphone == .iPhone {
            
        } else if self.isIphone == .iPad {
            
        }
    }
    
    func initTapListener() {
        let usingTermCheckImageViewListener = UITapGestureRecognizer(target: self, action: #selector(self.pressUsingTermCheckImageView(_:)))
        self.usingTermCheckButtonImageView.isUserInteractionEnabled = true
        self.usingTermCheckButtonImageView.addGestureRecognizer(usingTermCheckImageViewListener)
        
        let usingTermViewListener = UITapGestureRecognizer(target: self, action: #selector(self.pressUsingTermView(_:)))
        self.usingTermView.isUserInteractionEnabled = true
        self.usingTermView.addGestureRecognizer(usingTermViewListener)
        
        let personalTermCheckImageViewListener = UITapGestureRecognizer(target: self, action: #selector(self.pressPersonalTermCheckImageView(_:)))
        self.personalTermCheckButtonImageView.isUserInteractionEnabled = true
        self.personalTermCheckButtonImageView.addGestureRecognizer(personalTermCheckImageViewListener)
        
        let personalTermViewListener = UITapGestureRecognizer(target: self, action: #selector(self.pressPersonalTermView(_:)))
        self.personalTermView.isUserInteractionEnabled = true
        self.personalTermView.addGestureRecognizer(personalTermViewListener)
        
        self.signUpButton.addTarget(self, action: #selector(self.pressSignUpButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressUsingTermCheckImageView(_ sender: UIImageView) {
        self.actor?.didTapUsingTermCheckImageView(updateVC: self)
    }
    
    @objc func pressUsingTermView(_ sender: UIView) {
        self.actor?.didTapUsingTermLabel()
    }
    
    @objc func pressPersonalTermCheckImageView(_ sender: UIImageView) {
        self.actor?.didTapPersonalTermCheckImageView(updateVC: self)
    }
    
    @objc func pressPersonalTermView(_ sender: UIView) {
        self.actor?.didTapPersonalTermLabel()
    }
    
    @objc func pressSignUpButton(_ sender: UIButton) {
        // 전체 벨리데이션이 맞을 때 회원가입이 가능하도록
        if self.emailTextField.text!.validateEmail() && self.passwordTextField.text!.validatePassword() && (self.passwordTextField.text == self.passwordCheckTextField.text) && self.usingPolicyCheck && self.personalPolicyCheck {
            self.actor?.didTapSignUpButton(fromVC: self)
        } else if !self.emailTextField.text!.validateEmail() { // 이메일 벨리데이션이 안맞을 때
            self.actor?.presentInvalidEmailAlert(toVC: self)
        } else if !self.passwordTextField.text!.validatePassword() { // 비밀번호 벨리데이션이 안맞을 때
            self.actor?.presentInvalidPasswordAlert(toVC: self)
        } else if self.passwordTextField.text != self.passwordCheckTextField.text { // 비밀번호 & 비밀번호 확인이 틀릴때
            self.actor?.presentInvalidPasswordCheckAlert(toVC: self)
        } else if !self.usingPolicyCheck || !self.personalPolicyCheck { // 약관 동의 체크 하나라도 안했을때
            self.actor?.presentCheckTermAlert(toVC: self)
        }
    }
}
