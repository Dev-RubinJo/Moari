//
//  CategoryProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol CategoryVCProtocol: BaseVCProtocol {
    
    var actor: CategoryActorDelegate? { get set }
}

protocol CategoryVCRouterDelegate: class {
    
    static var makeCategoryVC: CategoryVC { get }
    
    func presentCategoryDetailVC()
    
    func presentAddReviewVC()
}

protocol CategoryActorDelegate: class {
    
    var view: CategoryVCRouterDelegate? { get set }
    
    var dataManager: CategoryDataManagerDelegate? { get set }
    
    func didLoadCategoryVC(vc: CategoryVC)
    
    func didTapAddReviewButton()
}

protocol CategoryDataManagerDelegate: class {
    
    var actor: CategoryActorDelegate? { get set }
    
    func loadCategoryList(toVC vc: CategoryVC)
}
