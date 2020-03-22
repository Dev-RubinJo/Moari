//
//  AddReviewProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol AddReviewVCProtocol: BaseVCProtocol {
    
    var actor: AddReviewActorDelegate? { get set }
}

protocol AddReviewVCRouterDelegate: class {
    
    static var makeAddReviewVC: AddReviewVC { get }
}

protocol AddReviewActorDelegate: class {
    
    var view: AddReviewVCRouterDelegate? { get set }
    
    var dataManager: AddReviewDataManagerDelegate? { get set }
    
    var categoryList: [CategoryForReview] { get }
    
    func setCategoryList(category: CategoryForReview)

    func removeAllCategory()
    
    func didLoadReview(updateVC vc: AddReviewVC, categoryId category: Int, reviewId id: Int)
    
    func addReview(fromVC vc: AddReviewVC, categoryId category: Int)
    
    func editReview(fromVC vc: AddReviewVC, reviewId id: Int)
    
    func deleteReview(fromVC vc: AddReviewVC, reviewId id: Int)
    
    func updateStarRateImageView(updateVC vc: AddReviewVC, value: Double)
}

protocol AddReviewDataManagerDelegate: class {
    
    var actor: AddReviewActorDelegate? { get set }
    
    func loadReviewDetail(fromVC vc: AddReviewVC, categoryId category: Int, reviewId id: Int)
    
    func writeReview(fromVC vc: AddReviewVC, categoryId category: Int, reviewId id: Int?)
    
    func deleteReview(fromVC vc: AddReviewVC, reviewId id: Int)
}
