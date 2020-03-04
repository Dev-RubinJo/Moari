//
//  SplashDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class SplashDataManager: SplashDataManagerDelegate {
    
    static let shared = SplashDataManager()
    private init() {}
    
    weak var actor: (SplashActorDelegate & SplashAlertActorDelegate)?
    
    func checkToken(fromVC vc: SplashVC) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            self.actor?.invalidToken()
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        
        Alamofire.request("\(Server.api)/app/signIn", method: .post, parameters: [:], encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<SplashDataResponse>) in
                switch response.result {
                case .success(let checkTokenResponse):
                    switch checkTokenResponse.code {
                    case 200:
                        self.actor?.vaildToken()
                    case 403:
                        self.actor?.presentInvalidTokenAlert(toVC: vc)
                        fallthrough
                    default:
                        self.actor?.invalidToken()
                    }
                case .failure(_ ):
                    print("error")
                }
            })
    }
}
