//
//  CategoryDetailDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class CategoryDetailDataManager: CategoryDetailDataManagerDelegate {
    
    static let shared = CategoryDetailDataManager()
    private init() {}
    
    weak var actor: CategoryDetailActorDelegate?
    
    
}
