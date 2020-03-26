//
//  AddReviewVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension AddReviewVC: AddReviewVCRouterDelegate {
    
    static var makeAddReviewVC: AddReviewVC {
        get {
            let vc = AddReviewVC()
            let actor = AddReviewActor()
            let dataManager = AddReviewDataManager()
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
}
