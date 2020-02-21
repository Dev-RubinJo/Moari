//
//  SignInActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class SignInActor: SignInActorDelegate {
    
    static let shared = SignInActor()
    private init() {}
    
    weak var view: SignInVCRouterDelegate?
    weak var dataManager: SignInDataManagerDelegate?
    
    func didTapSignInButton(fromVC vc: SignInVC) {
        self.checkTextFields(vc: vc)
    }
    
    func didTapFindEmailPasswordLabel() {
        
    }
    
    func didTapSignUpLabel() {
        
    }
    
    func presentValidationAlert(toVC vc: SignInVC, email: Bool, password: Bool) {
        var title = ""
        var message = ""
        if !email && !password {
            title = "이메일과 비밀번호가 잘못 입력되었습니다"
            message = "이메일과 비밀번호를 다시 한번 확인하여 입력해주세요!"
        } else if !email {
            title = "이메일이 잘못 입력되었습니다"
            message = "이메일을 다시 한번 확인하여 입력해주세요!"
        } else if !password {
            title = "비밀번호 형식이 맞지 않습니다"
            message = "비밀번호 형식(대소문자 영어, 숫자)에 맞춰서 8 ~ 16자리를 입력해주세요!"
        }
        vc.presentAlert(title: title, message: message)
    }
}
extension SignInActor {
    
    private func checkTextFields(vc: SignInVC) {
        if vc.emailTextField.text!.validateEmail() && vc.passwordTextField.text!.validatePassword() {
            guard let id = vc.emailTextField.text else { return }
            guard let password = vc.passwordTextField.text else { return }
            self.dataManager?.signIn(fromVC: vc, id: id, password: password)
        } else {
            let email = vc.emailTextField.text!.validateEmail()
            let password = vc.passwordTextField.text!.validatePassword()
            self.presentValidationAlert(toVC: vc, email: email, password: password)
        }
    }
}
