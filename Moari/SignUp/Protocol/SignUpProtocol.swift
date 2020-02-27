//
//  SignUpProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol SignUpVCProtocol: BaseVCProtocol {
    
    var actor: (SignUpActorDelegate & SignUpAlertActorDelegate)? { get set }
}

protocol SignUpVCRouterDelegate: class {
    
    static var makeSignUpVC: SignUpVC { get }
    
    func presentUsingPolicyView()
    
    func presentPersonPolicyView()
    
    func presentMainVC()
}

protocol SignUpActorDelegate: class {
    
    var view: SignUpVCRouterDelegate? { get set }
    
    var dataManager: SignUpDataManagerDelegate? { get set }
    
    func didTapUsingTermLabel()
    
    func didTapUsingTermCheckImageView(updateVC vc: SignUpVC)
    
    func didTapPersonalTermLabel()
    
    func didTapPersonalTermCheckImageView(updateVC vc: SignUpVC)
    
    func didTapSignUpButton(fromVC vc: SignUpVC)
}

protocol SignUpAlertActorDelegate: class {
    
    func presentInvalidEmailAlert(toVC vc: SignUpVC)
    
    func presentInvalidPasswordAlert(toVC vc: SignUpVC)
    
    func presentInvalidPasswordCheckAlert(toVC vc: SignUpVC)
    
    func presentCheckTermAlert(toVC vc: SignUpVC)
}

protocol SignUpPopUpActorDelegate: class {
    
    func presentSignUpPopUp(fromVC vc: SignUpVC)
}

protocol SignUpDataManagerDelegate: class {
    
    var actor: (SignUpActorDelegate)? { get set }
        
    func signUp(fromVC vc: SignUpVC, email: String, password: String, nickName: String)
}
