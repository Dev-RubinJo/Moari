//
//  EditThemeProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol EditThemeVCProtocol {
    
    var actor: EditThemeActorDelegate? { get set }
}

protocol EditThemeVCRouterDelegate: class {
    
    static var makeEditThemeVC: EditThemeVC { get }
}

protocol EditThemeActorDelegate: class {
    
    var view: EditThemeVCRouterDelegate? { get set }
}
