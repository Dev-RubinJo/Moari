//
//  EditCategory.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class EditCategory: BaseVC {
    
    @IBOutlet weak var outsideView: UIView!
    @IBOutlet weak var editCategoryPopUpView: UIView!
    @IBOutlet weak var editCategoryDeleteButton: UIButton!
    @IBOutlet weak var editCategoryNameButton: UIButton!
    
    // category를 받아올 변수
    var category: Category?
    weak var delegate: EditCategoryDelegate?
    weak var categoryActor: (CategoryActorDelegate & CategoryPopUpActorDelegate)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.editCategoryPopUpView.layer.cornerRadius = 3
        
        let outsideViewListener: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressOutsideView(_:)))
        self.outsideView.isUserInteractionEnabled = true
        self.outsideView.addGestureRecognizer(outsideViewListener)
        
        self.editCategoryNameButton.addTarget(self, action: #selector(self.pressEditCategoryNameButton(_:)), for: .touchUpInside)
        self.editCategoryDeleteButton.addTarget(self, action: #selector(self.pressEditCategoryDeleteButton(_:)), for: .touchUpInside)
    }
}
extension EditCategory {
    @objc func pressOutsideView(_ sender: UIView) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressEditCategoryNameButton(_ sender: UIButton) {
        
        // TODO: VC에서 띄우는 방향 찾기
        // TODO: 수정하기 플로우 Actor로 옮기기
        let categoryVC = self.delegate?.getCategoryVC()
        self.dismiss(animated: true, completion: nil)
        self.categoryActor?.presentAddCategoryPopUp(fromVC: categoryVC!, category: self.category)
    }
    
    @objc func pressEditCategoryDeleteButton(_ sender: UIButton) {
        let categoryVC = self.delegate?.getCategoryVC()
        self.dismiss(animated: true, completion: nil)
        self.categoryActor?.presentDeleteCategoryPopUp(fromVC: categoryVC!, category: self.category)
    }
}
