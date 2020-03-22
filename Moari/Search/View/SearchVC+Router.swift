//
//  SearchVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension SearchVC: SearchVCRouterDelegate {
    
    static var makeSearchVC: SearchVC {
        get {
            let vc = SearchVC()
            let actor = SearchActor()
            let dataManager = SearchDataManager()
            
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
