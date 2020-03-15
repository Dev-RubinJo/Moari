//
//  EditThemeVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension EditThemeVC: EditThemeVCRouterDelegate {
    
    class var makeEditThemeVC: EditThemeVC {
        get {
            let vc = EditThemeVC()
            let actor = EditThemeActor.shared
            
            vc.actor = actor
            actor.view = vc
            return vc
        }
    }
}
