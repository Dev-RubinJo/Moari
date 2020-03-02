//
//  CategoryDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class CategoryDataManager: CategoryDataManagerDelegate {
    
    static let shared = CategoryDataManager()
    private init() {}
    
    weak var actor: CategoryActorDelegate?
    
    func loadCategoryList(toVC vc: CategoryVC) {
        
    }
}
