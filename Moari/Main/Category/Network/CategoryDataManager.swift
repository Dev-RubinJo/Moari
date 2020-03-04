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
    
    weak var actor: CategoryActorDelegate?
    
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
                        for category in categoryResponse.result {
                            self.actor?.setCategoryList(category: category)
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
                        vc.categoryCollectionView.reloadData()
                    default:
                        break
                    }
                case .failure(let error):
                    print(error)
                }
            })
    }
    // TODO: 카테고리 추가 api 적용
    func addCategory(toVC vc: CategoryVC) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
    }
    
    // TODO: 카테고리 삭제 api 적용
    func deleteCategory(toVC vc: CategoryVC) {
        guard let loginToken = UserDefaults.standard.string(forKey: "LoginToken") else {
            
            return
        }
        let headers: [String: String] = ["x-access-Token": loginToken]
    }
}
