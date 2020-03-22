//
//  CategoryList.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/15.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class CategoryList {
    
    static let shared = CategoryList()
    private init() {}
    
    private var _categoryList: [CategoryForReview] = []
    
    var categoryList: [CategoryForReview] {
        get {
            self._categoryList
        }
    }
    
    func appendCategoryToCategoryList(category: CategoryForReview) {
        self._categoryList.append(category)
    }
    
    func removeAllCategoryInCategoryList() {
        self._categoryList.removeAll()
    }
}
