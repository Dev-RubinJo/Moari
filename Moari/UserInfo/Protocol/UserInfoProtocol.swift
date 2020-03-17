//
//  UserInfoProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol UserInfoVCProtococl {
    
    var actor: (UserInfoActorDelegate & UserInfoPopUpActorDelegate)? { get set }
}

protocol UserInfoVCRouterDelegate: class {
    
    static var makeUserInfoVC: UserInfoVC { get }
    
    func presentSignInVC()
}

protocol UserInfoActorDelegate: class {
    
    var view: UserInfoVCRouterDelegate? { get set }
    
    var dataManager: UserInfoDataManagerDelegate? { get set }
    
    func didTapEditUserInfoButton(fromVC vc: UserInfoVC, nickName name: String?, password: String?)
    
    func didTapSignOutButton(fromVC vc: UserInfoVC)
    
    func didTapFinalDeleteUserButton(fromVC vc: UserInfoVC)
}

protocol UserInfoPopUpActorDelegate: class {
    
    func presentSignOutPopUp(fromVC vc: UserInfoVC)
    
    func presentDeleteUserPopUp(fromVC vc: UserInfoVC)
    
    func presentFinalDeleteUserPopUp(fromVC vc: UserInfoVC)
}

protocol UserInfoDataManagerDelegate: class {
    
    var actor: UserInfoActorDelegate? { get set }
    
    func editUserInfo(fromVC vc: UserInfoVC, nickName name: String?, password: String?)
    
    func deleteUser(fromVC vc: UserInfoVC)
}
