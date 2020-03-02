//
//  CategoryActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class CategoryActor: CategoryActorDelegate {
    
    static let shared = CategoryActor()
    private init() {}
    
    weak var view: CategoryVCRouterDelegate?
    
    weak var dataManager: CategoryDataManagerDelegate?
    
    func didLoadCategoryVC(vc: CategoryVC) {
        
    }
    
    func didTapAddReviewButton() {
        self.view?.presentAddReviewVC()
    }
    
}
