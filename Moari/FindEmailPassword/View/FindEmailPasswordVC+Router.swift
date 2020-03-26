//
//  FindEmailPasswordVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension FindEmailPasswordVC: FindEmailPasswordVCRouterDelegate {
    
    static var makeFindEmailPasswordVC: FindEmailPasswordVC {
        get {
            let vc = FindEmailPasswordVC()
            let actor = FindEmailPasswordActor()
            let dataManager = FindEmailPasswordDataManager()
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
}
