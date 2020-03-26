//
//  UserInfoVC+PopUp.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/21.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation

extension UserInfoVC: DeleteUserPopUpDelegate {
    
    func getUserInfoVC() -> UserInfoVC {
        return self
    }
}
extension UserInfoVC: FinalDeleteUserPopUpDelegate {
    
    func didTapFinalDeleteUserDoneButton() {
        self.actor?.didTapFinalDeleteUserButton(fromVC: self)
    }
}
extension UserInfoVC: SignOutPopUpDelegate {
    func didTapSignOutDoneButton() {
        UserDefaults.standard.removeObject(forKey: "LoginToken")
        UserDefaults.standard.removeObject(forKey: "UserEmail")
        UserDefaults.standard.removeObject(forKey: "NickName")
        UserDefaults.standard.removeObject(forKey: "ReviewCount")
        self.presentSignInVC()
    }
}
