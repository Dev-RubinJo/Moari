//
//  CategoryActor+PopUp.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/10.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension CategoryActor: CategoryPopUpActorDelegate {
    func presentAddCategoryPopUp(fromVC vc: CategoryVC, category: Category?) {
        let addCategoryPopUpStoryboard = UIStoryboard(name: "AddCategory", bundle: nil)
        guard let addCategoryPopUpView = addCategoryPopUpStoryboard.instantiateViewController(withIdentifier: "AddCategory") as? AddCategory else { return }
        
        addCategoryPopUpView.category = category
        addCategoryPopUpView.delegate = vc
        addCategoryPopUpView.categoryActor = self
        
        
        addCategoryPopUpView.modalPresentationStyle = .custom
        addCategoryPopUpView.modalTransitionStyle = .crossDissolve
        
        vc.present(addCategoryPopUpView, animated: true, completion: nil)
    }
    
    func presentEditCategoryPopUp(fromVC vc: CategoryVC, category: Category?) {
        let editCategoryPopUpStoryboard = UIStoryboard(name: "EditCategory", bundle: nil)
        guard let editCategoryPopUpView = editCategoryPopUpStoryboard.instantiateViewController(withIdentifier: "EditCategory") as? EditCategory else { return }
        editCategoryPopUpView.modalPresentationStyle = .custom
        editCategoryPopUpView.modalTransitionStyle = .crossDissolve
        
        // TODO: Delegate 적용하기
        editCategoryPopUpView.category = category
        editCategoryPopUpView.delegate = vc
        editCategoryPopUpView.categoryActor = self
        
        vc.present(editCategoryPopUpView, animated: true, completion: nil)
    }
    
    func presentDeleteCategoryPopUp(fromVC vc: CategoryVC, category: Category?) {
        let deleteCategoryPopUpStoryboard = UIStoryboard(name: "DeleteCategory", bundle: nil)
        guard let deleteCategoryPopUpView = deleteCategoryPopUpStoryboard.instantiateViewController(withIdentifier: "DeleteCategory") as? DeleteCategory else { return }
        deleteCategoryPopUpView.delegate = vc
        deleteCategoryPopUpView.categoryActor = self
        deleteCategoryPopUpView.category = category
        deleteCategoryPopUpView.modalPresentationStyle = .custom
        deleteCategoryPopUpView.modalTransitionStyle = .crossDissolve
        
        vc.present(deleteCategoryPopUpView, animated: true, completion: nil)
    }
}
