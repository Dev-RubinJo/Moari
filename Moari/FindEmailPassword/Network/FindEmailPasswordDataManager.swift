//
//  FindEmailPasswordDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class FindEmailPasswordDataManager: FindEmailPasswordDataManagerDelegate {
    
    static let shared = FindEmailPasswordDataManager()
    private init() {}
    
    weak var actor: (FindEmailPasswordActorDelegate & FindEmailPasswordAlertActorDelegate)?
    
    func checkEmail(fromVC vc: FindEmailPasswordVC, email: String) {
        if email.validateEmail() {
            let headers = ["Content-Type": "application/json"]
            let parameters: Parameters = ["email": email]
            
            Alamofire.request("\(Server.api)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        } else {
            self.actor?.presentInvalidEmailAlert(toVC: vc)
        }
        
    }
    
    func sendTemporaryPassword(email: String) {
        let headers = ["Content-Type": "application/json"]
        let parameters: Parameters = ["email": email]
        
        Alamofire.request("\(Server.api)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        
    }
}
