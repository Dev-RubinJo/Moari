//
//  UserInfoActor+PopUp.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension UserInfoActor: UserInfoPopUpActorDelegate {
    func presentSignOutPopUp(fromVC vc: UserInfoVC) {
        
        let signOutPopUpStoryboard = UIStoryboard(name: "SignOut", bundle: nil)
        guard let signOutPopUpView = signOutPopUpStoryboard.instantiateViewController(withIdentifier: "SignOut") as? SignOut else { return }
        signOutPopUpView.modalPresentationStyle = .custom
        signOutPopUpView.modalTransitionStyle = .crossDissolve
        signOutPopUpView.delegate = vc
        vc.present(signOutPopUpView, animated: true, completion: nil)
    }
    
    func presentDeleteUserPopUp(fromVC vc: UserInfoVC) {
        let deleteUserPopUpStoryboard = UIStoryboard(name: "DeleteUser", bundle: nil)
        guard let deleteUserPopUpView = deleteUserPopUpStoryboard.instantiateViewController(withIdentifier: "DeleteUser") as? DeleteUser else { return }
        deleteUserPopUpView.modalPresentationStyle = .custom
        deleteUserPopUpView.modalTransitionStyle = .crossDissolve
        deleteUserPopUpView.userInfoActor = self
        deleteUserPopUpView.delegate = vc
        vc.present(deleteUserPopUpView, animated: true, completion: nil)
    }
    
    func presentFinalDeleteUserPopUp(fromVC vc: UserInfoVC) {
        let finalDeleteUserPopUpStoryboard = UIStoryboard(name: "FinalDeleteUser", bundle: nil)
        guard let finalDeleteUserPopUpView = finalDeleteUserPopUpStoryboard.instantiateViewController(withIdentifier: "FinalDeleteUser") as? FinalDeleteUser else { return }
        finalDeleteUserPopUpView.modalPresentationStyle = .custom
        finalDeleteUserPopUpView.modalTransitionStyle = .crossDissolve
        finalDeleteUserPopUpView.delegate = vc
        vc.present(finalDeleteUserPopUpView, animated: true, completion: nil)
    }
}
