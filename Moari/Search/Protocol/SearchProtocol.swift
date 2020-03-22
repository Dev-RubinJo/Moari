//
//  SearchProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/21.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol SearchVCProtocol {
    
    var actor: SearchActorDelegate? { get set }
}

protocol SearchVCRouterDelegate: class {
    
    static var makeSearchVC: SearchVC { get }
    
    func presentReviewDetailVC(reviewCategory category: Int, reviewId id: Int)
}

protocol SearchActorDelegate: class {
    
    var view: SearchVCRouterDelegate? { get set }
    
    var dataManager: SearchDataManagerDelegate? { get set }
    
    var reviewList: [Review] { get }
    
    func removeAllReviewList()
    
    func setReviewList(review: Review)
    
    func searchReviewList(fromVC vc: SearchVC, keyWord: String)
    
    func searchReviewListMore(fromVC vc: SearchVC, keyWord: String, itemCount: Int)
    
    func updateStarRateImageView(updateCell cell: CategoryDetailCell, value: Double)
    
    func didTapReviewCell(reviewCategory category: Int, reviewId id: Int)
}

protocol SearchDataManagerDelegate: class {
    
    var actor: SearchActorDelegate? { get set }
    
    func getReviewList(fromVC vc: SearchVC, keyWord: String)
    
    func getReviewListMore(fromVC vc: SearchVC, keyWord: String, itemCount: Int)
}
