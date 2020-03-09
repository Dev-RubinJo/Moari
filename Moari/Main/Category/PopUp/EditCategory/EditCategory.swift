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
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressEditCategoryDeleteButton(_ sender: UIButton) {
        
        
        self.dismiss(animated: true, completion: nil)
    }
}
