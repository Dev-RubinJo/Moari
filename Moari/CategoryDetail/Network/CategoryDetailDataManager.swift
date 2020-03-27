//
//  CategoryDetailDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class CategoryDetailDataManager: CategoryDetailDataManagerDelegate {
    
    weak var actor: CategoryDetailActorDelegate?
    
    func getReviewList(fromVC vc: CategoryDetailVC) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        guard let categoryId = vc.category?.categoryId else { return }
        let headers: [String: String] = ["x-access-Token": loginToken]
        Alamofire.request("\(Server.api)/category/\(categoryId)/review/0", method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<CategoryDetailResponse>) in
                switch response.result {
                case .success(let categoryDetailResponse):
                    switch categoryDetailResponse.code {
                    case 200:
                        self.actor?.removeAllReviewList()
                        for resultIndex in 0 ..< categoryDetailResponse.result.count {
                            let categoryReviewResponse = categoryDetailResponse.result[resultIndex]
                            let review = Review(reviewId: categoryReviewResponse.reviewId, reviewCategory: categoryReviewResponse.reviewCategory, title: categoryReviewResponse.title, imageUrl: categoryReviewResponse.imageUrl, starRate: categoryReviewResponse.starRate)
                            self.actor?.setReviewList(review: review)
                        }
                        vc.categoryDetailCollectionView.reloadData()
                    default:
                        break
                    }
                    
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    func reloadReviewList(fromVC vc: CategoryDetailVC, reviewCount count: Int) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        guard let categoryId = vc.category?.categoryId else { return }
        let headers: [String: String] = ["x-access-Token": loginToken]
        Alamofire.request("\(Server.api)/category/\(categoryId)/review/\(count)", method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<CategoryDetailResponse>) in
                switch response.result {
                case .success(let categoryDetailResponse):
                    switch categoryDetailResponse.code {
                    case 200:
//                        print(self.actor?.reviewList)
                        for resultIndex in 0 ..< categoryDetailResponse.result.count {
                            let categoryReviewResponse = categoryDetailResponse.result[resultIndex]
                            let review = Review(reviewId: categoryReviewResponse.reviewId, reviewCategory: categoryReviewResponse.reviewCategory, title: categoryReviewResponse.title, imageUrl: categoryReviewResponse.imageUrl, starRate: categoryReviewResponse.starRate)
                            self.actor?.setReviewList(review: review)
                        }
                        vc.categoryDetailCollectionView.reloadData()
                    default:
                        break
                    }
                    
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    func deleteReview(fromVC vc: CategoryDetailVC, reviewId: Int) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        Alamofire.request("\(Server.api)/review/\(reviewId)", method: .delete, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<CategoryDetailDeleteResponse>) in
                switch response.result {
                case .success(let categoryDetailResponse):
                    switch categoryDetailResponse.code {
                    case 200:
                        vc.categoryDetailCollectionView.reloadData()
                    default:
                        vc.categoryDetailCollectionView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
}
