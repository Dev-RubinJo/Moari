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
            let actor = CategoryDetailActor.shared
            let dataManager = CategoryDetailDataManager.shared
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
    
    func presentReviewDetailVC(reviewCategory category: Int, reviewId id: Int) {
        let reviewDetailVC = AddReviewVC.makeAddReviewVC
        reviewDetailVC.isAdd = false
        reviewDetailVC.reviewId = id
        reviewDetailVC.categoryId = category
        self.navigationController?.pushViewController(reviewDetailVC, animated: true)
    }
}
