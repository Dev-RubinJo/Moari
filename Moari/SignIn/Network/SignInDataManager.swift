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
    
    func signIn(fromVC vc: SignInVC, email: String, password: String) {
        let headers = ["Content-Type": "application/json"]
        let parameters: Parameters = [
            "email": "\(email)",
            "password": "\(password)"]
        
        Alamofire.request("\(Server.api)/app/signIn", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<SignInDataResponse>) in
                switch response.result {
                case .success(let signInResponse):
                    switch signInResponse.code{
                    case 200:
                        UserDefaults.standard.set(signInResponse.jwt, forKey: "LoginToken")
                        print("로그인 성공")
                    case 310:
                        print("이메일을 확인해주세요")
                        fallthrough
                    case 312:
                        print("비활성화 된 계정입니다. 고객센터")
                        fallthrough
                    case 313:
                        print("탈퇴한 계정입니다 고객센터에 문의해주세")
                        fallthrough
                    default:
                        return
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
}
