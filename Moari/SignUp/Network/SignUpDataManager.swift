
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
    
    weak var actor: (SignUpActorDelegate & SignUpAlertActorDelegate & SignUpPopUpActorDelegate)?
    
    func signUp(fromVC vc: SignUpVC, email: String, password: String, nickName: String) {
        let headers: [String: String] = ["Content-Type": "application/json"]
        let parameters: Parameters = [
            "email": email,
            "password": password,
            "name": nickName
        ]
        
        Alamofire.request("\(Server.api)/app/signUp", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<SignUpResponse>) in
                switch response.result {
                case .success(let signUpResponse):
                    switch signUpResponse.code {
                    case 200:
                        self.actor?.presentSignUpPopUp(fromVC: vc)
                    case 310:
                        // TODO: 중복된 이메일 Alert띄우기 메서드 구현 후 적용
                        fallthrough
                    default:
                        break
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    func signInAfterSignUp(email: String, password: String) {
        let headers: [String: String] = ["Content-Type": "application/json"]
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
        
        
        Alamofire.request("\(Server.api)/app/signIn", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<SignInResponse>) in
                switch response.result {
                case .success(let signInResponse):
                    switch signInResponse.code {
                    case 200:
                        UserDefaults.standard.set(signInResponse.name, forKey: "NickName")
                        UserDefaults.standard.set(signInResponse.jwt, forKey: "LoginToken")
                        self.actor?.completeSignInAfterSignUp()
                    default:
                        break
                    }
                    print("로그인 성공")
                case .failure(let error):
                    print(error)
                }
            })
    }
}
