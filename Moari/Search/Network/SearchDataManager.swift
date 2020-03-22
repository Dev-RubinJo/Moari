//
//  SearchDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/22.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class SearchDataManager: SearchDataManagerDelegate {
    
    weak var actor: SearchActorDelegate?
    
    func getReviewList(fromVC vc: SearchVC, keyWord: String) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
//        let parameters: Parameters = ["word": keyWord]
        let urlString = "\(Server.api)/search/0?word=\(keyWord)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        Alamofire.request("\(urlString!)", method: .get, encoding: JSONEncoding.default, headers: headers)
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
                        vc.reviewResultCollectionView.reloadData()
                    default:
                        break
                    }
                    
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    func getReviewListMore(fromVC vc: SearchVC, keyWord: String, itemCount: Int) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        let parameters: Parameters = ["word": keyWord]
        Alamofire.request("\(Server.api)/search/\(itemCount)", method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
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
                        vc.reviewResultCollectionView.reloadData()
                    default:
                        break
                    }
                    
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
}
