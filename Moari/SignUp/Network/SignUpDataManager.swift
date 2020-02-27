
//
//  SignUpDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class SignUpDataManager: SignUpDataManagerDelegate {
    
    static let shared = SignUpDataManager()
    private init() {}
    
    weak var actor: (SignUpActorDelegate)?
    
    func signUp(fromVC vc: SignUpVC, email: String, password: String, nickName: String) {
        
    }
}
extension SignUpDataManager {
    
    private func signInAfterSignUp(email: String, password: String) {
          
    }
}
