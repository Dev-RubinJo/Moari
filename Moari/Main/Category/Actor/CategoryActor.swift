//
//  CategoryActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class CategoryActor: CategoryActorDelegate {
    
    static let shared = CategoryActor()
    private init() {}
    
    weak var view: CategoryVCRouterDelegate?
    
    weak var dataManager: CategoryDataManagerDelegate?
    
    private var _categoryList: [Category] = []
    
    var categoryList: [Category] {
        get {
            return self._categoryList
        }
    }
    
    func setCategoryList(category: Category) {
        self._categoryList.append(category)
    }
    
    func didLoadCategoryVC(vc: CategoryVC) {
        self.dataManager?.loadCategoryList(toVC: vc)
    }
    
    func didTapCategoryCell(_ index: Int) {
        // TODO: 카테고리 리뷰 리스트 api엮기
        self.view?.presentCategoryDetailVC()
    }
    
    func didTapAddReviewButton() {
        self.view?.presentAddReviewVC()
    }
}
