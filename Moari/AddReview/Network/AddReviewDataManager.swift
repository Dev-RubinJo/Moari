//
//  AddReviewDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Kingfisher

class AddReviewDataManager: AddReviewDataManagerDelegate {
    
    static let shared = AddReviewDataManager()
    private init() {}
    
    weak var actor: AddReviewActorDelegate?
    
    func loadReviewDetail(fromVC vc: AddReviewVC, categoryId category: Int, reviewId id: Int) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        Alamofire.request("\(Server.api)/review/\(id)", method: .get, encoding: JSONEncoding.default, headers: headers)
        .validate()
            .responseObject(completionHandler: { (response: DataResponse<ReviewDetailResponse>) in
                switch response.result {
                case .success(let reviewResponse):
                    switch reviewResponse.code {
                    case 200:
                        let review = reviewResponse.result[0]
                        let imageUrl = URL(string: review.imageUrl)
                        vc.backgroundImageView.kf.setImage(with: imageUrl!)
                        vc.reviewTitleTextView.text = review.title
                        vc.reviewTitleTextView.centerVertically()
                        self.actor?.updateStarRateImageView(updateVC: vc, value: review.starRate)
                        vc.reviewContentTextView.text = review.simpleContent
                        vc.reviewContentTextView.centerVertically()
                        
                        if let categoryList = self.actor?.categoryList {
                            for category in categoryList {
                                if review.categoryId == category.categoryId {
                                    vc.selectCategoryButton.setTitle(category.categoryName , for: .normal)
                                    vc.selectCategoryButton.setTitleColor(.categoryNameColor, for: .normal)
                                    vc.selectCategoryButton.isUserInteractionEnabled = false
                                }
                            }
                        }
                        
                        vc.selectDateTextField.text = review.reviewDate.replace(target: "-", withString: ". ")
                        vc.contentTextView.text = review.reviewContent
                        vc.setUpScrollView()
                    default:
                        break
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    func writeReview(fromVC vc: AddReviewVC, categoryId category: Int, reviewId id: Int?) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        if let reviewId = id {
            
        } else {
            
        }
    }
}
