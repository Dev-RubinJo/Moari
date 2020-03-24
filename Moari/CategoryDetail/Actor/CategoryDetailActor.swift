//
//  CategoryDetailActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CategoryDetailActor: CategoryDetailActorDelegate {
    
    static let shared = CategoryDetailActor()
    
    weak var view: CategoryDetailVCRouterDelegate?
    weak var dataManager: CategoryDetailDataManagerDelegate?
    
    var _reviewList: [Review] = []
    
    var reviewList: [Review] {
        get {
            return self._reviewList
        }
    }
    
    func removeAllReviewList() {
        self._reviewList.removeAll()
    }
    
    // MARK: 리뷰 삭제넣기
    func removeReviewFromList(fromVC vc: CategoryDetailVC, review: Review) {
        guard let reviewId = review.reviewId else { return }
        self.dataManager?.deleteReview(fromVC: vc, reviewId: reviewId)
    }
    
    func setReviewList(review: Review) {
        self._reviewList.append(review)
    }
    
    // MARK: 첫 리뷰리스트 가져오기
    func didLoadCategoryDetailList(fromVC vc: CategoryDetailVC) {
        self.dataManager?.getReviewList(fromVC: vc)
    }
    
    func loadCategoryDetailListMore(fromVC vc: CategoryDetailVC, reviewCount count: Int) {
        self.dataManager?.reloadReviewList(fromVC: vc, reviewCount: count)
    }
    
    func presentDeleteReviewPopUp(fromVC vc: CategoryDetailVC, reviewId id: Int) {
        let deleteReviewPopUpStoryboard = UIStoryboard(name: "DeleteReview", bundle: nil)
        guard let deleteReviewPopUpView = deleteReviewPopUpStoryboard.instantiateViewController(withIdentifier: "DeleteReview") as? DeleteReview else { return }
        deleteReviewPopUpView.modalPresentationStyle = .custom
        deleteReviewPopUpView.modalTransitionStyle = .crossDissolve
        deleteReviewPopUpView.delegate = vc
        deleteReviewPopUpView.reviewId = id
        vc.present(deleteReviewPopUpView, animated: true, completion: nil)
    }
    
    func deleteReviewAction(fromVC vc: CategoryDetailVC, reviewId id: Int) {
        for reviewIndex in 0 ..< self._reviewList.count - 1 {
            if self.reviewList[reviewIndex].reviewId == id {
                self._reviewList.remove(at: reviewIndex)
            }
        }
        self.dataManager?.deleteReview(fromVC: vc, reviewId: id)
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
    
    func didTapAddReviewButton(fromVC vc: CategoryDetailVC) {
        guard let categoryId = vc.category?.categoryId else { return }
        self.view?.presentAddReviewVC(categoryId: categoryId)
    }
}


// TODO: 20개가 넘으면 또 가져오도록 하기
// TODO: 리뷰 삭제 팝업 띄우기

// TODO: 리뷰 추가하기 화면 넘어가도록 하기
// 위아래 기능 구분하면서 하기
// TODO: 리뷰 상세보기 화면 넘어가도록 하기
