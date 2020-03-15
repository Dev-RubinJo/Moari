//
//  UserInfoDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class UserInfoDataManager: UserInfoDataManagerDelegate {
    
    static let shared = UserInfoDataManager()
    private init() {}
    
    weak var actor: UserInfoActorDelegate?
}
