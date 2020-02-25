//
//  SignUpActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation

class SignUpActor: SignUpActorDelegate {
    
    static let shared = SignUpActor()
    private init() {}
    
    weak var view: SignUpVCRouterDelegate?
    weak var dataManager: SignUpDataManagerDelegate?
}
