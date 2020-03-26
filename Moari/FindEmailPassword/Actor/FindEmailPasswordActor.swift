//
//  FindEmailPasswordActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class FindEmailPasswordActor: FindEmailPasswordActorDelegate {
    
    weak var view: FindEmailPasswordVCRouterDelegate?
    var dataManager: FindEmailPasswordDataManagerDelegate?
    
    func didTapCheckForRegisteredEmailButton(fromVC vc: FindEmailPasswordVC) {
        guard let email = vc.emailTextField.text else { return }
        self.dataManager?.checkEmail(fromVC: vc, email: email)
    }
    
    func didTapSendTemporaryPasswordButton(fromVC vc: FindEmailPasswordVC) {
        guard let email = vc.emailTextField.text else { return }
        self.dataManager?.sendTemporaryPassword(fromVC: vc, email: email)
    }
    
    func notRegisteredEmail(updateVC vc: FindEmailPasswordVC) {
        vc.alertLabel.isHidden = false
        if vc.isIphone == .iPhone {
            switch UIScreen.main.nativeBounds.height {
            case 1136, 1334:
                vc.alertLabel.text = "NOT_REGISTERED_EMAIL".localizedWith(value: "\n")
                fallthrough
            default:
                vc.alertLabel.text = "NOT_REGISTERED_EMAIL".localizedWith(value: " ")
            }
        }
        
        vc.sendTemporaryPasswordButton.isHidden = true
        vc.temporaryPasswordAlertLabel.isHidden = true
    }
    
    func registeredEmail(updateVC vc: FindEmailPasswordVC) {
        vc.alertLabel.isHidden = false
        vc.alertLabel.text = "REGISTERED_EMAIL".localized
        
        vc.sendTemporaryPasswordButton.isHidden = false
        vc.temporaryPasswordAlertLabel.isHidden = true
    }
    
    func sendTemporaryPassword(updateVC vc: FindEmailPasswordVC) {
        vc.temporaryPasswordAlertLabel.isHidden = false
        vc.temporaryPasswordAlertLabel.text = "SEND_TEMPORARY_PASSWORD".localized
    }
}
