//
//  AddCategory.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class AddCategory: BaseVC {
    
    @IBOutlet weak var addCategoryPopUpView: UIView!
    @IBOutlet weak var addCategoryPopUpTextField: UITextField!
    @IBOutlet weak var addCategoryDoneButton: UIButton!
    @IBOutlet weak var addCategoryCancelButton: UIButton!
    
    var category: Category?
    weak var delegate: EditCategoryDelegate?
    weak var categoryActor: (CategoryActorDelegate)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addCategoryPopUpView.layer.cornerRadius = 3
        
        self.addCategoryDoneButton.addTarget(self, action: #selector(self.pressAddCategoryDoneButton(_:)), for: .touchUpInside)
        self.addCategoryCancelButton.addTarget(self, action: #selector(self.pressAddCategoryCancelButton(_:)), for: .touchUpInside)
    }
}
extension AddCategory {
    
    @objc func pressAddCategoryDoneButton(_ sender: UIButton) {
        guard let categoryVC = self.delegate?.getCategoryVC() else { return }
        if self.addCategoryPopUpTextField.text == "" {
            self.presentAlert(title: "카테고리가 비어있어요", message: "카테고리를 입력해주세요!")
            return
        }
        if self.category == nil {
            self.categoryActor?.didTapAddCategoryDoneButton(toVC: categoryVC, categoryName: self.addCategoryPopUpTextField.text!)
        } else {
            guard let id = self.category?.categoryId else { return }
            self.categoryActor?.didTapEditCategoryDoneButton(toVC: categoryVC, categoryName: self.addCategoryPopUpTextField.text!, categoryId: id)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressAddCategoryCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
