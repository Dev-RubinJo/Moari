//
//  SearchActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SearchActor: SearchActorDelegate {
    
    weak var view: SearchVCRouterDelegate?
    var dataManager: SearchDataManagerDelegate?
    
    var _reviewList: [Review] = []
    
    var reviewList: [Review] {
        get {
            return self._reviewList
        }
    }
    
    func removeAllReviewList() {
        self._reviewList.removeAll()
    }
    
    func setReviewList(review: Review) {
        self._reviewList.append(review)
    }
    
    func searchReviewList(fromVC vc: SearchVC, keyWord: String) {
        self.dataManager?.getReviewList(fromVC: vc, keyWord: keyWord)
    }
    
    func searchReviewListMore(fromVC vc: SearchVC, keyWord: String, itemCount: Int) {
        self.dataManager?.getReviewListMore(fromVC: vc, keyWord: keyWord, itemCount: itemCount)
    }
    
    func updateStarRateImageView(updateCell cell: CategoryDetailCell, value: Double) {
        switch value {
        case 0.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate0")
        case 0.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate1")
        case 1.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate2")
        case 1.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate3")
        case 2.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate4")
        case 2.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate5")
        case 3.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate6")
        case 3.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate7")
        case 4.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate8")
        case 4.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate9")
        default:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate10")
        }
    }
    
    func didTapReviewCell(reviewCategory category: Int, reviewId id: Int) {
        self.view?.presentReviewDetailVC(reviewCategory: category, reviewId: id)
    }
}
