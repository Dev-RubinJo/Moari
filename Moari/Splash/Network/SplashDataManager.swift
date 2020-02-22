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
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let shared = SplashDataManager()
    private init() {}
    
    weak var actor: (SplashActorDelegate & SplashAlertActorDelegate)?
    
    func checkToken(fromVC vc: SplashVC) {
        if self.appDelegate.getLoginTokenHeader["x-access-Token"] == "" {
            self.actor?.invalidToken()
        } else {
            Alamofire.request("\(Server.api)", method: .post, parameters: [:], encoding: JSONEncoding.default, headers: self.appDelegate.getLoginTokenHeader)
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
}
