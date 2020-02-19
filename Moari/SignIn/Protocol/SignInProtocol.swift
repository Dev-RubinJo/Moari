//
//  SignInProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol SignInVCDelegate: BaseVCProtocol {
    
    var actor: SignInActorDelegate? { get set }
}

protocol SignInVCRouterDelegate: class {
    
    static func makeSignInVC() -> SignInVC
    
    func presentMainVC()
    
    func presentFindEmailPasswordVC()
    
    func presentSignUpVC()
}

protocol SignInActorDelegate: class {
    
    var view: SignInVCRouterDelegate? { get set }
    
    var dataManager: SignInDataManagerDelegate? { get set }
    
    func didTapSignInButton()
    
    func didTapFindEmailPasswordLabel()
    
    func didTapSignUpLabel()
}

protocol SignInDataManagerDelegate: class {
    
    var actor: SignInActorDelegate? { get set }
    
    func signIn(fromVC vc: SignInVC, id: String, password: String)
}
