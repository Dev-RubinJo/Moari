//
//  EditThemeActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class EditThemeActor: EditThemeActorDelegate {
    
    static let shared = EditThemeActor()
    private init() {}
    
    weak var view: EditThemeVCRouterDelegate?
}
