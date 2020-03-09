//
//  AddReviewVC+UITextField.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/08.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension AddReviewVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.textColor = .signInBottomLabels
        self.updateScrollView(heightValue: self.baseHeight + self.keyboardHeight)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.updateScrollView(heightValue: self.baseHeight + self.contentTextViewHeight.height)
    }
}
