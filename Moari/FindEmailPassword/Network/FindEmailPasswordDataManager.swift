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
    
    weak var actor: (FindEmailPasswordActorDelegate & FindEmailPasswordAlertActorDelegate)?
    
    func checkEmail(fromVC vc: FindEmailPasswordVC, email: String) {
        if email.validateEmail() {
            let headers = ["Content-Type": "application/json"]
            let parameters: Parameters = ["email": email]
            
            Alamofire.request("\(Server.api)/validation/user", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
                .responseObject(completionHandler: {(response: DataResponse<FindEmailPasswordResponse>) in
                    switch response.result {
                    case .success(let findResponse):
                        switch findResponse.code {
                        case 200:
                            self.actor?.registeredEmail(updateVC: vc)
                        default:
                            self.actor?.notRegisteredEmail(updateVC: vc)
                        }
                    case .failure(let error):
                        print(error)
                    }
                })
        } else {
            self.actor?.presentInvalidEmailAlert(toVC: vc)
        }
        
    }
    
    func sendTemporaryPassword(fromVC vc: FindEmailPasswordVC, email: String) {
        let headers = ["Content-Type": "application/json"]
        let parameters: Parameters = ["email": email]
        
        Alamofire.request("\(Server.api)/find/user", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        .validate()
            .responseObject(completionHandler: { (response: DataResponse<FindEmailPasswordResponse>) in
                switch response.result {
                case .success(let findResponse):
                    switch findResponse.code {
                    case 200:
                        self.actor?.sendTemporaryPassword(updateVC: vc)
                    default:
                        break
                    }
                    
                case .failure(let error):
                    print(error)
                }
            })
        
    }
}
