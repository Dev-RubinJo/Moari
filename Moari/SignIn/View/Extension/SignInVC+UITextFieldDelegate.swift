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
        // 자동완성 -> false
        if string == " " {
            return false
        }
        //        // 지우기, 붙여넣기
        if string.count != 1 {
            // 지우기는 허용
            if string.count == 0 {
                return true
            } else {
                //                textField.text = nil
                return true
            }
        }
        // 엔터 -> skip
        if string == "\n" {
            if textField == self.emailTextField && self.emailTextField.text?.validateEmail() ?? false {
                self.passwordTextField.becomeFirstResponder()
            }
            return false
        }
        //지금까지 입력된 값
        var currentString = textField.text!
        currentString.append(string)
        
        if textField == self.emailTextField {
            
        }
        
        if textField == self.passwordTextField {
            if currentString.count == 4 {
                
            } else if currentString.count > 4 {
                return false
            }
        }
        
        textField.text = currentString
        return false
    }
}
