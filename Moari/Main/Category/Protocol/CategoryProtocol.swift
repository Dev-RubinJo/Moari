//
//  CategoryProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol CategoryVCProtocol: BaseVCProtocol {
    
    var actor: (CategoryActorDelegate & CategoryPopUpActorDelegate)? { get set }
}

protocol CategoryVCRouterDelegate: class {
    
    static var makeCategoryVC: CategoryVC { get }
    
    func presentCategoryDetailVC()
    
    func presentAddReviewVC()
}

protocol CategoryActorDelegate: class {
    
    var view: CategoryVCRouterDelegate? { get set }
    
    var dataManager: CategoryDataManagerDelegate? { get set }
    
    var categoryList: [Category] { get }
    
    func setCategoryList(category: Category)
    
    func removeCategory(categoryId id: Int)
    
    func removeAllCategoryListObjcet()
    
    func didLoadCategoryVC(vc: CategoryVC)
    
    func didTapCategoryCell(_ index: Int)
    
    func didTapAddReviewButton()
    
    func didTapAddCategoryDoneButton(toVC vc: CategoryVC, categoryName name: String)
    
    func didTapEditCategoryDoneButton(toVC vc: CategoryVC, categoryName name: String, categoryId id: Int)
    
    func didTapDeleteCategoryButton(toVC vc: CategoryVC, categoryId id: Int)
}

protocol CategoryPopUpActorDelegate: class {
    
    func presentAddCategoryPopUp(fromVC vc: CategoryVC, category: Category?)
    
    func presentEditCategoryPopUp(fromVC vc: CategoryVC, category: Category?)
    
    func presentDeleteCategoryPopUp(fromVC vc: CategoryVC, category: Category?)
}

protocol CategoryDataManagerDelegate: class {
    
    var actor: (CategoryActorDelegate & CategoryPopUpActorDelegate)? { get set }
    
    func loadCategoryList(toVC vc: CategoryVC)
    
    func addCategory(toVC vc: CategoryVC, categoryName name: String)
    
    func editCategoryName(toVC vc: CategoryVC, CategoryName name: String, categoryId id: Int)
    
    func deleteCategory(toVC vc: CategoryVC, categoryId id: Int)
}
