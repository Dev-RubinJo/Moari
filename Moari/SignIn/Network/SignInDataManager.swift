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
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let shared = SignInDataManager()
    private init() {}
    
    weak var actor: SignInActorDelegate?
    
    func signIn(fromVC vc: SignInVC, id: String, password: String) {
        
    }
}
