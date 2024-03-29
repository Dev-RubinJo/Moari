//
//  SignInProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

protocol SignInVCProtocol: BaseVCProtocol {
    
    var actor: SignInActorDelegate? { get set }
}

protocol SignInVCRouterDelegate: class {
    
    var window: UIWindow? { get }
    
    static var makeSignInVC: SignInVC { get }
    
    func presentMainVC()
    
    func presentFindEmailPasswordVC()
    
    func presentSignUpVC()
}

protocol SignInActorDelegate: class {
    
    var view: SignInVCRouterDelegate? { get set }
    
    var dataManager: SignInDataManagerDelegate? { get set }
    
    func didTapSignInButton(fromVC vc: SignInVC)
    
    func didTapFindEmailPasswordLabel()
    
    func didTapSignUpLabel()
    
    func successSignIn()
}

protocol SignInAlertActorDelegate: class {
    
    /// 이메일, 비밀번호 벨리데이션에 따른 Alert를 띄워주는 메서드 true값이 벨리데이션 맞을때, false값이 벨리데이션이 틀릴 때의 값이다.
    /// - Parameter email: 이메일 벨리데이션 bool
    /// - Parameter password: 비밀번호 벨리데이션 bool
    func presentValidationAlert(toVC vc: SignInVC, email: Bool, password: Bool)
}

protocol SignInDataManagerDelegate: class {
    
    var actor: (SignInActorDelegate & SignInAlertActorDelegate)? { get set }
    
    func signIn(fromVC vc: SignInVC, email: String, password: String)
}
