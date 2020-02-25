
//
//  SignUpDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation

class SignUpDataManager: SignUpDataManagerDelegate {
    
    static let shared = SignUpDataManager()
    private init() {}
    
    weak var actor: (SignUpActorDelegate)?
    
    func signUp() {
        
    }
}
extension SignUpDataManager {
    
    private func signInAfterSignUp(email: String, password: String) {
          
    }
}
