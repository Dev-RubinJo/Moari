//
//  UserInfoActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation

class UserInfoActor: UserInfoActorDelegate {

    weak var view: UserInfoVCRouterDelegate?
    var dataManager: UserInfoDataManagerDelegate?
    
    func didTapEditUserInfoButton(fromVC vc: UserInfoVC, nickName name: String?, password: String?) {
        if let name = name, let password = password {
            self.dataManager?.editUserInfo(fromVC: vc, nickName: name, password: password)
        } else if let name = name {
            self.dataManager?.editUserInfo(fromVC: vc, nickName: name, password: nil)
        } else if let password = password {
            self.dataManager?.editUserInfo(fromVC: vc, nickName: nil, password: password)
        }
    }
    
    func didTapSignOutButton(fromVC vc: UserInfoVC) {
        UserDefaults.standard.removeObject(forKey: "LoginToken")
    }
    
    func didTapFinalDeleteUserButton(fromVC vc: UserInfoVC) {
        self.dataManager?.deleteUser(fromVC: vc)
    }
}
