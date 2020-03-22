//
//  CategoryDetailProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol CategoryDetailVCProtocol: BaseVCProtocol {
    
    var actor: CategoryDetailActorDelegate? { get set }
}

protocol CategoryDetailVCRouterDelegate: class {
    
    static var makeCategoryDetailVC: CategoryDetailVC { get }
    
    func presentReviewDetailVC(reviewCategory category: Int, reviewId id: Int)
    
    func presentAddReviewVC(categoryId id: Int)
}

protocol CategoryDetailActorDelegate: class {
    
    var view: CategoryDetailVCRouterDelegate? { get set }
    
    var dataManager: CategoryDetailDataManagerDelegate? { get set }
    
    var reviewList: [Review] { get }
    
    func removeAllReviewList()
    
    func removeReviewFromList(fromVC vc: CategoryDetailVC, review: Review)
    
    func setReviewList(review: Review)
    
    func didLoadCategoryDetailList(fromVC vc: CategoryDetailVC)
    
    func updateStarRateImageView(updateCell cell: CategoryDetailCell, value: Double)
    
    func didTapReviewCell(reviewCategory category: Int, reviewId id: Int)
    
    func presentDeleteReviewPopUp(fromVC vc: CategoryDetailVC, reviewId id: Int)
    
    func deleteReviewAction(fromVC vc: CategoryDetailVC, reviewId id: Int)
    
    func didTapAddReviewButton(fromVC vc: CategoryDetailVC)
}

//protocol CategoryDetailPopUpActorDelegate: class {
//
//    func presentDeleteReviewPopUp()
//}

protocol CategoryDetailDataManagerDelegate: class {
    
    var actor: CategoryDetailActorDelegate? { get set }
    
    func getReviewList(fromVC vc: CategoryDetailVC)
    
    func reloadReviewList(fromVC vc: CategoryDetailVC, reviewCount count: Int)
    
    func deleteReview(fromVC vc: CategoryDetailVC, reviewId: Int)
}
