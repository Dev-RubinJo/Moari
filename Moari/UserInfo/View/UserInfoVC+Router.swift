//
//  UserInfoVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension UserInfoVC: UserInfoVCRouterDelegate {
    
    static var makeUserInfoVC: UserInfoVC {
        get {
            let vc = UserInfoVC()
            let actor = UserInfoActor.shared
            let dataManager = UserInfoDataManager.shared
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
}
