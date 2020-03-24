//
//  SignInActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class SignInActor: SignInActorDelegate {
    
    weak var view: SignInVCRouterDelegate?
    var dataManager: SignInDataManagerDelegate?
    
    func didTapSignInButton(fromVC vc: SignInVC) {
        self.checkTextFields(vc: vc)
    }
    
    func didTapFindEmailPasswordLabel() {
        self.view?.presentFindEmailPasswordVC()
    }
    
    func didTapSignUpLabel() {
        self.view?.presentSignUpVC()
    }
    
    func successSignIn() {
        self.view?.presentMainVC()
    }
    
    deinit {
        print("signIn actor deinit")
    }
}
extension SignInActor {
    private func checkTextFields(vc: SignInVC) {
        if vc.emailTextField.text!.validateEmail() && vc.passwordTextField.text != nil {
            guard let id = vc.emailTextField.text else { return }
            guard let password = vc.passwordTextField.text else { return }
            self.dataManager?.signIn(fromVC: vc, email: id, password: password)
        } else {
            let email = vc.emailTextField.text!.validateEmail()
            let password = vc.passwordTextField.text!.validatePassword()
            self.presentValidationAlert(toVC: vc, email: email, password: password)
        }
    }
}
