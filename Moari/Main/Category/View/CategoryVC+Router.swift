//
//  CategoryVC+Router.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension CategoryVC: CategoryVCRouterDelegate {
    
    static var makeCategoryVC: CategoryVC {
        get {
            let vc = CategoryVC()
            let actor = CategoryActor()
            let dataManager = CategoryDataManager()
            
            vc.actor = actor
            actor.view = vc
            actor.dataManager = dataManager
            dataManager.actor = actor
            return vc
        }
    }
    
    func presentCategoryDetailVC() {
        // TODO: CategoryDetailVC 띄우기
        let categoryDetailVC = CategoryDetailVC.makeCategoryDetailVC
        categoryDetailVC.category = self.category
        self.navigationController?.pushViewController(categoryDetailVC, animated: true)
    }
    
    func presentAddReviewVC() {
        let addReviewRootVC = AddReviewVC.makeAddReviewVC
        let addReviewVC = UINavigationController.init(rootViewController: addReviewRootVC)
        addReviewRootVC.isAdd = true
        addReviewVC.modalPresentationStyle = .fullScreen
        self.present(addReviewVC, animated: true, completion: nil)
    }
}
