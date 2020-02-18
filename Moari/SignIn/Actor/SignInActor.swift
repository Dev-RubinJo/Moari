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
    
    
}
