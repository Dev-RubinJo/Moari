//
//  SignInDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class SignInDataManager: SignInDataManagerDelegate {
    
    static let shared = SignInDataManager()
    private init() {}
    
    weak var actor: SignInActorDelegate?
}
