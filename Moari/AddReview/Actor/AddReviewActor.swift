//
//  AddReviewActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class AddReviewActor: AddReviewActorDelegate {
    
    weak var view: (AddReviewVCProtocol & AddReviewVCRouterDelegate)?
    var dataManager: AddReviewDataManagerDelegate?
    
    var categoryList: [CategoryForReview] {
        get {
            CategoryList.shared.categoryList
        }
    }
    
    func setCategoryList(category: CategoryForReview) {
        CategoryList.shared.appendCategoryToCategoryList(category: category)
    }
    
    func removeAllCategory() {
        CategoryList.shared.removeAllCategoryInCategoryList()
    }
    
    func didLoadReview(updateVC vc: AddReviewVC, categoryId category: Int, reviewId id: Int) {
        self.dataManager?.loadReviewDetail(fromVC: vc, categoryId: category, reviewId: id)
    }
    
    func addReview(fromVC vc: AddReviewVC, categoryId category: Int) {
        self.dataManager?.writeReview(fromVC: vc, categoryId: category, reviewId: nil)
    }
    
    func editReview(fromVC vc: AddReviewVC, reviewId id: Int) {
        self.dataManager?.writeReview(fromVC: vc, categoryId: 0, reviewId: id)
    }
    
    func deleteReview(fromVC vc: AddReviewVC, reviewId id: Int) {
        self.dataManager?.deleteReview(fromVC: vc, reviewId: id)
    }
    
    func updateStarRateImageView(updateVC vc: AddReviewVC, value: Double) {
        switch value {
        case 0.0:
            vc.starRateImageView.image = UIImage(named: "starRate0")
        case 0.5:
            vc.starRateImageView.image = UIImage(named: "starRate1")
        case 1.0:
            vc.starRateImageView.image = UIImage(named: "starRate2")
        case 1.5:
            vc.starRateImageView.image = UIImage(named: "starRate3")
        case 2.0:
            vc.starRateImageView.image = UIImage(named: "starRate4")
        case 2.5:
            vc.starRateImageView.image = UIImage(named: "starRate5")
        case 3.0:
            vc.starRateImageView.image = UIImage(named: "starRate6")
        case 3.5:
            vc.starRateImageView.image = UIImage(named: "starRate7")
        case 4.0:
            vc.starRateImageView.image = UIImage(named: "starRate8")
        case 4.5:
            vc.starRateImageView.image = UIImage(named: "starRate9")
        default:
            vc.starRateImageView.image = UIImage(named: "starRate10")
        }
    }
    
    func getSimpleReviewFontSize() -> CGFloat {
        return self.view!.fontSize
    }
    
    func setTextViewLineSpacing(_ textView: UITextView, lineSpace: CGFloat, fontSize: CGFloat, color: UIColor, textAlignment: NSTextAlignment) {
        let attrString = NSMutableAttributedString(string: textView.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        attrString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: fontSize)!, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(.foregroundColor, value: color, range: NSMakeRange(0, attrString.length))
        textView.attributedText = attrString
        textView.textAlignment = textAlignment
    }
}

