//
//  CategoryDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class CategoryDataManager: CategoryDataManagerDelegate {
    
    static let shared = CategoryDataManager()
    private init() {}
    
    weak var actor: (CategoryActorDelegate & CategoryPopUpActorDelegate)?
    
    func loadCategoryList(toVC vc: CategoryVC) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        
        Alamofire.request("\(Server.api)/category", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<CategoryListResponse>) in
                switch response.result {
                case .success(let categoryResponse):
                    switch categoryResponse.code {
                    case 200:
                        UserDefaults.standard.set(categoryResponse.userInfo.name, forKey: "NickName")
                        UserDefaults.standard.set(categoryResponse.userInfo.reviewCount, forKey: "ReviewCount")
                        
                        self.actor?.removeAllCategoryListObjcet()
                        for category in categoryResponse.result {
                            self.actor?.setCategoryList(category: category)
//                            print(category)
                        }
                        if self.actor?.categoryList.count ?? 0 < 8 {
                            for _ in 0 ..< (8 - (self.actor?.categoryList.count ?? 0)) {
                                if self.actor?.categoryList.count ?? 0 == 8 {
                                    break
                                } else {
                                    let emptyCategory = Category(categoryName: "", categoryId: 0)
                                    self.actor?.setCategoryList(category: emptyCategory)
                                }
                            }
                        }
//                        print("reload")
                        
                        let addReviewRootVC = AddReviewVC.makeAddReviewVC
                        addReviewRootVC.actor?.removeAllCategory()
                        for category in self.actor?.categoryList ?? [] {
                            if category.categoryId == 0 {
                                break
                            }
                            addReviewRootVC.actor?.setCategoryList(category: CategoryForReview(name: category.categoryName, id: category.categoryId))
                        }
                        vc.categoryCollectionView.reloadData()
                    default:
                        break
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
    // MARK: 카테고리 추가 api 적용
    func addCategory(toVC vc: CategoryVC, categoryName name: String) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        let parameters: Parameters = ["categoryName": name]
        Alamofire.request("\(Server.api)/category", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        .validate()
            .responseObject(completionHandler: {(response: DataResponse<CategoryDefaultResponse>) in
                switch response.result {
                case .success(let categoryResponse):
                    switch categoryResponse.code {
                    case 200:
                        self.loadCategoryList(toVC: vc)
                    default:
                        break
                    }
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    // MARK: 카테고리 수정 api 적용
    func editCategoryName(toVC vc: CategoryVC, CategoryName name: String, categoryId id: Int) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        let parameters: Parameters = ["categoryName": name]
        Alamofire.request("\(Server.api)/category/\(id)", method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        .validate()
            .responseObject(completionHandler: {(response: DataResponse<CategoryDefaultResponse>) in
                switch response.result {
                case .success(let categoryResponse):
                    switch categoryResponse.code {
                    case 200:
                        self.loadCategoryList(toVC: vc)
                    default:
                        break
                    }
                    break
                case .failure(let error):
                    print(error)
                }
            })
    }
    
    // MARK: 카테고리 삭제 api 적용
    func deleteCategory(toVC vc: CategoryVC, categoryId id: Int) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
        Alamofire.request("\(Server.api)/category/\(id)", method: .delete, encoding: JSONEncoding.default, headers: headers)
        .validate()
            .responseObject(completionHandler: { (response: DataResponse<CategoryDefaultResponse>) in
                switch response.result {
                case .success(let deleteResponse):
                    self.loadCategoryList(toVC: vc)
                case .failure(let error):
                    print(error)
                }
            })
    }
}
