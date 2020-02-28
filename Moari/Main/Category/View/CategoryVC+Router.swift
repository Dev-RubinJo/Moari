//
//  CategoryVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension CategoryVC: CategoryVCRouterDelegate {
    
    static var makeCategoryVC: CategoryVC {
        get {
            let vc = CategoryVC()
            let actor = CategoryActor.shared
            let dataManager = CategoryDataManager.shared
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
}
