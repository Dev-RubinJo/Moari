//
//  AddReviewActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class AddReviewActor: AddReviewActorDelegate {
    
    static let shared = AddReviewActor()
    private init() {}
    
    weak var view: AddReviewVCRouterDelegate?
    weak var dataManager: AddReviewDataManagerDelegate?
    
    private var _categoryList: [CategoryForReview] = []
    
    var categoryList: [CategoryForReview] {
        get {
            self._categoryList
        }
    }
    
    func setCategoryList(category: CategoryForReview) {
        self._categoryList.append(category)
    }
    
    func removeAllCategory() {
        self._categoryList.removeAll()
    }
    
    func didLoadReview(updateVC vc: AddReviewVC, categoryId category: Int, reviewId id: Int) {
        self.dataManager?.loadReviewDetail(fromVC: vc, categoryId: category, reviewId: id)
    }
    
    func updateStarRateImageView(updateVC vc: AddReviewVC, value: Double) {
        switch value {
        case 0.0:
            vc.starRateImageView.image = UIImage(named: "starRate0")
        case 0.5:
            vc.starRateImageView.image = UIImage(named: "starRate1")
        case 1.0:
            vc.starRateImageView.image = UIImage(named: "starRate2")
        case 1.5:
            vc.starRateImageView.image = UIImage(named: "starRate3")
        case 2.0:
            vc.starRateImageView.image = UIImage(named: "starRate4")
        case 2.5:
            vc.starRateImageView.image = UIImage(named: "starRate5")
        case 3.0:
            vc.starRateImageView.image = UIImage(named: "starRate6")
        case 3.5:
            vc.starRateImageView.image = UIImage(named: "starRate7")
        case 4.0:
            vc.starRateImageView.image = UIImage(named: "starRate8")
        case 4.5:
            vc.starRateImageView.image = UIImage(named: "starRate9")
        default:
            vc.starRateImageView.image = UIImage(named: "starRate10")
        }
    }
}

