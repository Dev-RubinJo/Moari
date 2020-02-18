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
}

protocol SignInActorDelegate: class {
    
    var view: SignInVCRouterDelegate? { get set }
    
    var dataManager: SignInDataManagerDelegate? { get set }
}

protocol SignInDataManagerDelegate: class {
    
    var actor: SignInActorDelegate? { get set }
}
