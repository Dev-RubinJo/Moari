//
//  SignUpVC+UITextFieldDelegate.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/26.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension SignUpVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case self.emailTextField, self.nickNameTextField:
            // 엔터 -> skip
            if string == "\n" {
                if textField == self.emailTextField {
                    self.passwordTextField.becomeFirstResponder()
                } else if textField == self.nickNameTextField {
                    self.view.endEditing(true)
                }
                return false
            } else {
                return true
            }
        case self.passwordTextField, self.passwordCheckTextField:
            if string == "\n" {
                if textField == self.passwordTextField {
                    self.passwordCheckTextField.becomeFirstResponder()
                } else if textField == self.passwordCheckTextField {
                    self.nickNameTextField.becomeFirstResponder()
                }
                return false
            }
            
            //지금까지 입력된 값
            var currentString = textField.text!
            currentString.append(string)
            
            if textField == self.passwordTextField {
                if currentString.count > 20 {
                    return false
                }
            }
            
            if textField == self.passwordCheckTextField {
                if currentString.count > 20 {
                    return false
                }
            }
            return true
        default:
            return false
        }
    }
}
