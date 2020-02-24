//
//  SignInVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension SignInVC: SignInVCRouterDelegate {

    static var makeSignInVC: SignInVC {
        get {
            let vc = SignInVC()
            let actor = SignInActor.shared
            let dataManager = SignInDataManager.shared
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
    // TODO: MainVC 만들어서 넣기
    func presentMainVC() {
        
    }
    // TODO: FindEmailPasswordVC 만들어서 넣기
    func presentFindEmailPasswordVC() {
        let findVC = FindEmailPasswordVC.makeFindEmailPasswordVC
        self.navigationController?.pushViewController(findVC, animated: true)
    }
    // TODO: SignUpVC 만들어서 넣기
    func presentSignUpVC() {
        let signUpVC = SignUpVC.makeSignUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
