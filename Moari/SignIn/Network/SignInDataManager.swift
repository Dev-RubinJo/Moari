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
    
    weak var actor: (SignInActorDelegate & SignInAlertActorDelegate)?
    
    func signIn(fromVC vc: SignInVC, email: String, password: String) {
        let headers = ["Content-Type": "application/json"]
        let parameters: Parameters = [
            "email": "\(email)",
            "password": "\(password)"]
        
        Alamofire.request("\(Server.api)/app/signIn", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<SignInResponse>) in
                switch response.result {
                case .success(let signInResponse):
                    switch signInResponse.code{
                    case 200:
                        UserDefaults.standard.set(email, forKey: "UserEmail")
                        UserDefaults.standard.set(signInResponse.jwt, forKey: "LoginToken")
                        UserDefaults.standard.set(signInResponse.name, forKey: "NickName")
                        self.actor?.successSignIn()
                    case 310:
                        print("이메일을 확인해주세요")
                        self.actor?.presentValidationAlert(toVC: vc, email: false, password: true)
                    case 311:
                        // 비밀번호 틀린 Alert만들기
                        vc.presentAlert(title: "비밀번호 오류", message: "비밀번호를 다시 확인해주세요!")
                        print("비밀번호가 틀림")
                    case 312:
                        vc.presentAlert(title: "비활성화된 이메일", message: "비활성화된 이메일입니다! 고객센터에 문의해주세요!!")
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
    
    deinit {
        print("signIn dataManager deinit")
    }
}
