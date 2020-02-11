//
//  SplashDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class SplashDataManager: SplashDataManagerDelegate {
    
    static let shared = SplashDataManager()
    private init() {}
    
    weak var actor: SplashActorDelegate?
}
