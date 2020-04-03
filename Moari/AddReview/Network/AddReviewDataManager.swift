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
import FirebaseStorage

class AddReviewDataManager: AddReviewDataManagerDelegate {
    
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
                        vc.review = review
                        vc.starRateValue = review.starRate
                        if review.imageUrl != "" {
                            vc.imageUrl = review.imageUrl
                            let imageUrl = URL(string: review.imageUrl)
                            vc.backgroundImageView.kf.setImage(with: imageUrl!)
                            vc.image = vc.backgroundImageView.image
                            
                        } else {
                            vc.backgroundImageView.image = UIImage(named: "defaultImage")
                        }
                        
                        vc.reviewTitleTextView.text = review.title
                        vc.reviewTitleTextView.centerVertically()
                        self.actor?.updateStarRateImageView(updateVC: vc, value: review.starRate)
                        vc.reviewContentTextView.text = review.simpleContent
                        
                        self.actor?.setTextViewLineSpacing(vc.reviewContentTextView, lineSpace: 5, fontSize: (self.actor?.getSimpleReviewFontSize())!, color: .white, textAlignment: .center)
                        vc.reviewContentTextView.centerVertically()
                        
                        if let categoryList = self.actor?.categoryList {
                            for category in categoryList {
                                if review.categoryId == category.categoryId {
                                    vc.selectCategoryButton.setTitle(category.categoryName , for: .normal)
                                    vc.selectCategoryButton.setTitleColor(.categoryNameColor, for: .normal)
                                    vc.selectCategoryButton.isUserInteractionEnabled = false
                                    break
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
        let headers: [String: String] = [
            "x-access-Token": loginToken,
            "Content-Type": "application/json"
        ]
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        if let reviewId = id {
            if vc.backgroundImageView.image != UIImage(named: "defaultImage") {
                if vc.imageChangeFlag {
                    if let image = vc.backgroundImageView.image {
                        let storageReference = Storage.storage().reference().child("iOS/\(UserDefaults.standard.string(forKey: "NickName")!)/\(vc.categoryId!).jpg")
                        let imageData = image.jpegData(compressionQuality: 0.001)
                        vc.appearIndicator()
                        storageReference.putData(imageData!, metadata:  metadata) { (metadata, error) in
                            storageReference.downloadURL { (url, error) in
                                let parameters: Parameters = [
                                    "categoryType": vc.review!.categoryId!,
                                    "title": vc.reviewTitleTextView.text!,
                                    "content": vc.contentTextView.text!,
                                    "image": "\(url!)",
                                    "grade": vc.starRateValue,
                                    "review": vc.reviewContentTextView.text!,
                                    "reviewDate": vc.selectDateTextField.text!.replace(target: ". ", withString: "-")
                                ]
                                Alamofire.request("\(Server.api)/review/\(reviewId)", method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                                    .validate()
                                    .responseObject(completionHandler: { (response: DataResponse<WriteReviewResponse>) in
                                        switch response.result {
                                        case .success(let writeResponse):
                                            vc.reviewTitleBorderImageView.isHidden = true
                                            vc.reviewTitlePlaceholderLabel.isHidden = true
                                            vc.starRateBorderImageView.isHidden = true
                                            vc.reviewContentBorderImageView.isHidden = true
                                            vc.reviewContentPlaceholderLabel.isHidden = true
                                            vc.shareReviewButton.isHidden = false
                                            vc.editReviewButton.isHidden = false
                                            vc.deleteReviewButton.isHidden = true
                                            vc.editImageButton.isHidden = true
                                            vc.selectDateTextField.isUserInteractionEnabled = false
                                            vc.reviewTitleTextView.isEditable = false
                                            vc.reviewContentTextView.isEditable = false
                                            vc.contentTextView.isEditable = false
                                            vc.contentViewPlaceholderLabel.isHidden = true
                                            vc.navigationItem.rightBarButtonItem = nil
                                            vc.imageChangeFlag = false
                                            vc.disappearIndicator()
                                        case .failure(let error):
                                            print(error)
                                        }
                                    })
                            }
                        }
                    }
                } else {
                    let parameters: Parameters = [
                        "categoryType": vc.review!.categoryId!,
                        "title": vc.reviewTitleTextView.text!,
                        "content": vc.contentTextView.text!,
                        "image": vc.imageUrl,
                        "grade": vc.starRateValue,
                        "review": vc.reviewContentTextView.text!,
                        "reviewDate": vc.selectDateTextField.text!.replace(target: ". ", withString: "-")
                    ]
                    vc.appearIndicator()
                    Alamofire.request("\(Server.api)/review/\(reviewId)", method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                        .validate()
                        .responseObject(completionHandler: { (response: DataResponse<WriteReviewResponse>) in
                            switch response.result {
                            case .success(let writeResponse):

                                vc.reviewTitleBorderImageView.isHidden = true
                                vc.reviewTitlePlaceholderLabel.isHidden = true
                                vc.starRateBorderImageView.isHidden = true
                                vc.reviewContentBorderImageView.isHidden = true
                                vc.reviewContentPlaceholderLabel.isHidden = true
                                vc.shareReviewButton.isHidden = false
                                vc.editReviewButton.isHidden = false
                                vc.deleteReviewButton.isHidden = true
                                vc.editImageButton.isHidden = true
                                vc.selectDateTextField.isUserInteractionEnabled = false
                                vc.reviewTitleTextView.isEditable = false
                                vc.reviewContentTextView.isEditable = false
                                vc.contentTextView.isEditable = false
                                vc.contentViewPlaceholderLabel.isHidden = true
                                vc.navigationItem.rightBarButtonItem = nil
                                vc.disappearIndicator()
                            case .failure(let error):
                                print(error)
                            }
                        })
                }
            } else {
                let parameters: Parameters = [
                    "categoryType": vc.review!.categoryId!,
                    "title": vc.reviewTitleTextView.text!,
                    "content": vc.contentTextView.text!,
                    "image": "",
                    "grade": vc.starRateValue,
                    "review": vc.reviewContentTextView.text!,
                    "reviewDate": vc.selectDateTextField.text!.replace(target: ". ", withString: "-")
                ]
                vc.appearIndicator()
                Alamofire.request("\(Server.api)/review/\(reviewId)", method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                    .validate()
                    .responseObject(completionHandler: { (response: DataResponse<WriteReviewResponse>) in
                        switch response.result {
                        case .success(let writeResponse):

                            vc.reviewTitleBorderImageView.isHidden = true
                            vc.reviewTitlePlaceholderLabel.isHidden = true
                            vc.starRateBorderImageView.isHidden = true
                            vc.reviewContentBorderImageView.isHidden = true
                            vc.reviewContentPlaceholderLabel.isHidden = true
                            vc.shareReviewButton.isHidden = false
                            vc.editReviewButton.isHidden = false
                            vc.deleteReviewButton.isHidden = true
                            vc.editImageButton.isHidden = true
                            vc.selectDateTextField.isUserInteractionEnabled = false
                            vc.reviewTitleTextView.isEditable = false
                            vc.reviewContentTextView.isEditable = false
                            vc.contentTextView.isEditable = false
                            vc.contentViewPlaceholderLabel.isHidden = true
                            vc.navigationItem.rightBarButtonItem = nil
                            vc.disappearIndicator()
                        case .failure(let error):
                            print(error)
                        }
                    })
            }
            
        } else {
            //            if vc.backgroundImageView.image == UIImage(named: "defaultImageMoari") {
            //                vc.backgroundImageView.image = UIImage(named: "defaultImageMoari")
            //            }
            if vc.backgroundImageView.image != UIImage(named: "defaultImage") {
                if let image = vc.backgroundImageView.image {
                    let storageReference = Storage.storage().reference().child("iOS/\(UserDefaults.standard.string(forKey: "NickName")!)/\(vc.reviewTitleTextView.text!).jpg")
                    let imageData = image.jpegData(compressionQuality: 0.001)
                    vc.appearIndicator()
                    storageReference.putData(imageData!, metadata:  metadata) { (metadata, error) in
                        storageReference.downloadURL { (url, error) in
                            let parameters: Parameters = [
                                "title": vc.reviewTitleTextView.text!,
                                "content": vc.contentTextView.text!,
                                "image": "\(url!)",
                                "grade": vc.starRateValue,
                                "review": vc.reviewContentTextView.text!,
                                "reviewDate": vc.selectDateTextField.text!.replace(target: ". ", withString: "-")
                            ]
                            
                            Alamofire.request("\(Server.api)/category/\(category)/review", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                                .validate()
                                .responseObject(completionHandler: { (response: DataResponse<WriteReviewResponse>) in
                                    switch response.result {
                                    case .success(let writeResponse):
                                        vc.isAdd = false
                                        vc.reviewTitleBorderImageView.isHidden = true
                                        vc.reviewTitlePlaceholderLabel.isHidden = true
                                        vc.starRateBorderImageView.isHidden = true
                                        vc.reviewContentBorderImageView.isHidden = true
                                        vc.reviewContentPlaceholderLabel.isHidden = true
                                        vc.shareReviewButton.isHidden = false
                                        vc.editReviewButton.isHidden = false
                                        vc.deleteReviewButton.isHidden = true
                                        vc.editImageButton.isHidden = true
                                        vc.selectDateTextField.isUserInteractionEnabled = false
                                        vc.reviewTitleTextView.isEditable = false
                                        vc.reviewContentTextView.isEditable = false
                                        vc.contentTextView.isEditable = false
                                        vc.contentViewPlaceholderLabel.isHidden = true
                                        vc.navigationItem.rightBarButtonItem = nil
                                        
                                        vc.reviewId = writeResponse.reviewId
                                        vc.review = ReviewDetail(reviewId: writeResponse.reviewId, categoryId: vc.categoryId, title: vc.reviewTitleTextView.text, simpleContent: vc.reviewContentTextView.text, imageUrl: "\(url!)", starRate: vc.starRateValue, reviewContent: vc.contentTextView.text, reviewDate: vc.selectDateTextField.text)
                                        vc.navigationItem.title = ""
                                        vc.image = vc.backgroundImageView.image
                                        
                                        vc.disappearIndicator()
                                    case .failure(let error):
                                        print(error)
                                    }
                                })
                        }
                    }
                }
            } else {
                let parameters: Parameters = [
                    "title": vc.reviewTitleTextView.text!,
                    "content": vc.contentTextView.text!,
                    "image": "",
                    "grade": vc.starRateValue,
                    "review": vc.reviewContentTextView.text!,
                    "reviewDate": vc.selectDateTextField.text!.replace(target: ". ", withString: "-")
                ]
                vc.appearIndicator()
                Alamofire.request("\(Server.api)/category/\(category)/review", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                    .validate()
                    .responseObject(completionHandler: { (response: DataResponse<WriteReviewResponse>) in
                        switch response.result {
                        case .success(let writeResponse):
                            vc.isAdd = false
                            vc.reviewTitleBorderImageView.isHidden = true
                            vc.reviewTitlePlaceholderLabel.isHidden = true
                            vc.starRateBorderImageView.isHidden = true
                            vc.reviewContentBorderImageView.isHidden = true
                            vc.reviewContentPlaceholderLabel.isHidden = true
                            vc.shareReviewButton.isHidden = false
                            vc.editReviewButton.isHidden = false
                            vc.deleteReviewButton.isHidden = true
                            vc.editImageButton.isHidden = true
                            vc.selectDateTextField.isUserInteractionEnabled = false
                            vc.reviewTitleTextView.isEditable = false
                            vc.reviewContentTextView.isEditable = false
                            vc.contentTextView.isEditable = false
                            vc.contentViewPlaceholderLabel.isHidden = true
                            vc.navigationItem.rightBarButtonItem = nil
                            
                            vc.reviewId = writeResponse.reviewId
                            
                            vc.review = ReviewDetail(reviewId: writeResponse.reviewId, categoryId: vc.categoryId, title: vc.reviewTitleTextView.text, simpleContent: vc.reviewContentTextView.text, imageUrl: "", starRate: vc.starRateValue, reviewContent: vc.contentTextView.text, reviewDate: vc.selectDateTextField.text)
                            vc.navigationItem.title = ""
                            vc.image = vc.backgroundImageView.image
                            vc.disappearIndicator()
                        case .failure(let error):
                            print(error)
                        }
                    })
            }
        }
    }
    
    func deleteReview(fromVC vc: AddReviewVC, reviewId id: Int) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        
        Alamofire.request("\(Server.api)/review/\(id)", method: .delete, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseObject(completionHandler: {(response: DataResponse<WriteReviewResponse>) in
                switch response.result {
                case .success( _):
                    vc.categoryDetailVC?.isLoad = true
                    vc.navigationController?.popViewController(animated: true)
                case .failure(let error):
                    print(error)
                }
            })
    }
}
