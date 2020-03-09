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
    
    weak var delegate: AddCategoryPopUpDelegate?
    weak var categoryActor: CategoryActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addCategoryPopUpView.layer.cornerRadius = 3
        
        self.addCategoryDoneButton.addTarget(self, action: #selector(self.pressAddCategoryDoneButton(_:)), for: .touchUpInside)
        self.addCategoryCancelButton.addTarget(self, action: #selector(self.pressAddCategoryCancelButton(_:)), for: .touchUpInside)
    }
}
extension AddCategory {
    
    @objc func pressAddCategoryDoneButton(_ sender: UIButton) {
//        self.categoryActor. <- 여기에 추가하는 api를 엮을 수 있도록 하기
        self.delegate?.didTapAddCategoryDoneButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressAddCategoryCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
