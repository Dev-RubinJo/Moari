//
//  UserInfoProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol UserInfoVCProtococl {
    
    var actor: UserInfoActorDelegate? { get set }
}

protocol UserInfoVCRouterDelegate: class {
    
    static var makeUserInfoVC: UserInfoVC { get }
}

protocol UserInfoActorDelegate: class {
    
    var view: UserInfoVCRouterDelegate? { get set }
    
    var dataManager: UserInfoDataManagerDelegate? { get set }
}

protocol UserInfoDataManagerDelegate: class {
    
    var actor: UserInfoActorDelegate? { get set }
}
