//
//  SignInVC+UITextFieldDelegate.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/19.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension SignInVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case self.emailTextField:
            // 엔터 -> skip
            if string == "\n" {
                if textField == self.emailTextField {
                    self.passwordTextField.becomeFirstResponder()
                }
                return false
            }
        case self.passwordTextField:
            //지금까지 입력된 값
            var currentString = textField.text!
            currentString.append(string)

            if textField == self.passwordTextField {
                if currentString.count > 20 {
                    return false
                }
            }
            return true
        default:
            return false
        }
        return true
    }
}
