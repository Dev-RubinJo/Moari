//
//  DeleteCategory.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class DeleteCategory: BaseVC {
    
    @IBOutlet weak var deletePopUpView: UIView!
    @IBOutlet weak var deletePopUpLabel: UILabel!
    @IBOutlet weak var deletePopUpDoneButton: UIButton!
    @IBOutlet weak var deletePopUpCancelButton: UIButton!
    
    // category를 받아올 변수
    var category: Category?
    weak var delegate: EditCategoryDelegate?
    weak var categoryActor: (CategoryActorDelegate)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDeletePopUpUI()
        self.deletePopUpDoneButton.addTarget(self, action: #selector(self.pressDeletePopUpDoneButton(_:)), for: .touchUpInside)
        self.deletePopUpCancelButton.addTarget(self, action: #selector(self.pressDeletePopUpCancelButton(_:)), for: .touchUpInside)
    }
}
extension DeleteCategory {
    func setDeletePopUpUI() {
        self.deletePopUpView.layer.cornerRadius = 3
        
        if self.deviceLocale == "ko" {
            let attributedString = NSMutableAttributedString(string: "\((self.category?.categoryName)!) 카테고리를삭제하시겠습니까?", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)!,
              .foregroundColor: UIColor.deletePopUpAttributeColor,
              .kern: 0.0
            ])
            attributedString.addAttribute(.foregroundColor, value: UIColor.cursorColor, range: NSRange(location: 0, length: 3))
            self.deletePopUpLabel.attributedText = attributedString
        } else if self.deviceLocale == "en" {
            let attributedString = NSMutableAttributedString(string: "\((self.category?.categoryName)!) 카테고리를삭제하시겠습니까?", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)!,
              .foregroundColor: UIColor.deletePopUpAttributeColor,
              .kern: 0.0
            ])
            attributedString.addAttribute(.foregroundColor, value: UIColor.cursorColor, range: NSRange(location: 0, length: 3))
            self.deletePopUpLabel.attributedText = attributedString
            // TODO: 추후 영문지원할 때 이것으로 바꾸기
//            let attributedString = NSMutableAttributedString(string: "Do you want to delete \((self.category?.categoryName)!)?", attributes: [
//              .font: UIFont(name: "AppleSDGothicNeo-Light", size: 17.0)!,
//              .foregroundColor: UIColor.deletePopUpAttributeColor,
//              .kern: 0.0
//            ])
//            attributedString.addAttribute(.foregroundColor, value: UIColor.cursorColor, range: NSRange(location: 22, length: (self.category?.categoryName.count)!))
//            self.deletePopUpLabel.attributedText = attributedString
        }
    }
    
    @objc func pressDeletePopUpDoneButton(_ sender: UIButton) {
        guard let categoryVC = self.delegate?.getCategoryVC() else { return }
        guard let id = self.category?.categoryId else { return }
        self.categoryActor?.didTapDeleteCategoryButton(toVC: categoryVC, categoryId: id)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressDeletePopUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
