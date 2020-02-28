//
//  SignUpActor+PopUp.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/26.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension SignUpActor: SignUpPopUpActorDelegate {
    
    func presentSignUpPopUp(fromVC vc: SignUpVC) {
        let signUpPopUpStoryboard = UIStoryboard(name: "SignUp", bundle: nil)
        guard let signUpPopUpView = signUpPopUpStoryboard.instantiateViewController(withIdentifier: "SignUp") as? SignUp else { return }
        signUpPopUpView.delegate = self
        signUpPopUpView.modalPresentationStyle = .custom
        signUpPopUpView.modalTransitionStyle = .crossDissolve
        
        vc.present(signUpPopUpView, animated: true, completion: nil)
    }
}
