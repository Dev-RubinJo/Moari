//
//  CategoryDetailVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension CategoryDetailVC: CategoryDetailVCRouterDelegate {
    
    static var makeCategoryDetailVC: CategoryDetailVC {
        get {
            let vc = CategoryDetailVC()
            
            return vc
        }
    }
}
