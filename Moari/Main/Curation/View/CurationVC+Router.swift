//
//  CurationVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension CurationVC: CurationVCRouterDelegate {
    
    static var makeCurationVC: CurationVC {
        get {
            let vc = CurationVC()
            let actor = CurationActor()
            let dataManager = CurationDataManager()
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
}
