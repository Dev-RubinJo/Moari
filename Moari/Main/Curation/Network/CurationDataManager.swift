//
//  CurationDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class CurationDataManager: CurationDataManagerDelegate {
    
    static let shared = CurationDataManager()
    private init() {}
    
    weak var actor: CurationActorDelegate?
}
