//
//  UserInfoActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class UserInfoActor: UserInfoActorDelegate {
    
    static let shared = UserInfoActor()
    private init() {}
    
    weak var view: UserInfoVCRouterDelegate?
    weak var dataManager: UserInfoDataManagerDelegate?
    
}
