//
//  UserInfoDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Kingfisher

class UserInfoDataManager: UserInfoDataManagerDelegate {

    weak var actor: UserInfoActorDelegate?
    let cache = ImageCache.default
    
    func editUserInfo(fromVC vc: UserInfoVC, nickName name: String?, password: String?) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = [
            "x-access-Token": loginToken,
            "Content-Type": "application/json"
        ]
        let parameters: Parameters = [
            "name": name ?? "",
            "password": password ?? ""
        ]
        
        Alamofire.request("\(Server.api)/user", method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: {(response: DataResponse<UserInfoResponse>) in
                switch response.result {
                case .success(let editUserResponse):
                    switch editUserResponse.code {
                    case 200:
                        if name != nil {
                            UserDefaults.standard.set(name!, forKey: "NickName")
                        }
                        vc.showToast(text: "계정정보가 수정되었습니다")
                        break
                    default:
                        break
                    }
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    func deleteUser(fromVC vc: UserInfoVC) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        
        Alamofire.request("\(Server.api)/user", method: .delete, headers: headers)
            .validate()
            .responseObject(completionHandler: {(response: DataResponse<UserInfoResponse>) in
                switch response.result {
                case .success(let deleteResponse):
                    switch deleteResponse.code {
                    case 200:
                        UserDefaults.standard.removeObject(forKey: "LoginToken")
                        UserDefaults.standard.removeObject(forKey: "UserEmail")
                        UserDefaults.standard.removeObject(forKey: "NickName")
                        self.cache.clearMemoryCache()
                        vc.presentSignInVC()
                    default:
                        break
                    }
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
}
// 2부 122
