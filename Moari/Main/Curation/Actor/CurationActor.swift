//
//  CurationActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class CurationActor: CurationActorDelegate {
    
    static let shared = CurationActor()
    private init() {}
    
    weak var view: CurationVCRouterDelegate?
    weak var dataManager: CurationDataManagerDelegate?
}
