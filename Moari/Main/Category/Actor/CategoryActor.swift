//
//  CategoryActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Firebase

class CategoryActor: CategoryActorDelegate {
    
    weak var view: CategoryVCRouterDelegate?
    var dataManager: CategoryDataManagerDelegate?
    
    private var _categoryList: [Category] = []
    
    var categoryList: [Category] {
        get {
            return self._categoryList
        }
    }
    
    func setCategoryList(category: Category) {
        self._categoryList.append(category)
    }
    
    func removeCategory(categoryId id: Int) {
        for categoryIndex in 0 ..< self.categoryList.count {
            if self.categoryList[categoryIndex].categoryId == id {
                self._categoryList.remove(at: categoryIndex)
                break
            }
        }
    }
    
    func removeAllCategoryListObjcet() {
        self._categoryList.removeAll()
    }
    
    func didLoadCategoryVC(vc: CategoryVC) {
        Analytics.logEvent("Load_Category_List_ios", parameters: ["req": "Load_Category_List_ios"])
        self.dataManager?.loadCategoryList(toVC: vc)
    }
    
    func didTapCategoryCell(_ index: Int) {
        // TODO: 카테고리 리뷰 리스트 api엮기
        self.view?.presentCategoryDetailVC()
    }
    
    func didTapAddReviewButton() {
        Analytics.logEvent("Did_Tap_Add_Review_From_CategoryVC_ios", parameters: ["req": "Did_Tap_Add_Review_From_CategoryVC_ios"])
        self.view?.presentAddReviewVC()
    }
    
    func didTapAddCategoryDoneButton(toVC vc: CategoryVC, categoryName name: String) {
        Analytics.logEvent("Did_Tap_Add_Category_Done_ios", parameters: ["req": "Did_Tap_Add_Category_Done_ios"])
        self.dataManager?.addCategory(toVC: vc, categoryName: name)
    }
    
    func didTapEditCategoryDoneButton(toVC vc: CategoryVC, categoryName name: String, categoryId id: Int) {
        Analytics.logEvent("Did_Tap_Edit_Category_Done_ios", parameters: ["req": "Did_Tap_Edit_Category_Done_ios"])
        self.dataManager?.editCategoryName(toVC: vc, CategoryName: name, categoryId: id)
    }
    
    func didTapDeleteCategoryButton(toVC vc: CategoryVC, categoryId id: Int) {
        Analytics.logEvent("Did_Tap_Delete_Category_Done_ios", parameters: ["req": "Did_Tap_Delete_Category_Done_ios"])
        self.dataManager?.deleteCategory(toVC: vc, categoryId: id)
    }
}
