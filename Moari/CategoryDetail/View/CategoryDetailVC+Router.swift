//
//  CategoryDetailVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension CategoryDetailVC: CategoryDetailVCRouterDelegate {
    
    static var makeCategoryDetailVC: CategoryDetailVC {
        get {
            let vc = CategoryDetailVC()
            let actor = CategoryDetailActor()
            let dataManager = CategoryDetailDataManager()
            
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
        reviewDetailVC.categoryDetailVC = self
        self.navigationController?.pushViewController(reviewDetailVC, animated: true)
    }
    
    func presentAddReviewVC(categoryId id: Int) {
        let addReviewRootVC = AddReviewVC.makeAddReviewVC
        let addReviewVC = UINavigationController.init(rootViewController: addReviewRootVC)
        addReviewRootVC.isAdd = true
        addReviewRootVC.categoryId = id
        addReviewRootVC.categoryDetailVC = self
        addReviewVC.modalPresentationStyle = .fullScreen
        self.present(addReviewVC, animated: true, completion: nil)
    }
}
