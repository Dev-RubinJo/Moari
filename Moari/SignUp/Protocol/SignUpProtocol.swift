//
//  SignUpProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol SignUpVCProtocol: BaseVCProtocol {
    
    var actor: SignUpActorDelegate? { get set }
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
}

protocol SignUpDataManagerDelegate: class {
    
    var actor: (SignUpActorDelegate)? { get set }
        
    func signUp()
}
