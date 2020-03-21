//
//  CategoryVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension CategoryVC {
    
    func setCategoryVCUI() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.logoButton.setImage(UIImage(named: "navigationTitleLogoCategoryDark"), for: .normal)
        self.navigationItem.titleView = self.logoButton
        self.navigationController?.navigationBar.tintColor = .white
        
        let drawerViewButton = UIBarButtonItem(image: UIImage(named: "drawerMenuDark"), style: .plain, target: self, action: #selector(self.pressDrawerViewButton(_:)))
        
        let addReviewButton = UIBarButtonItem(image: UIImage(named: "addReviewDark"), style: .plain, target: self, action: #selector(self.pressAddReviewButton(_:)))
        
        self.navigationItem.leftBarButtonItem = drawerViewButton
        self.navigationItem.rightBarButtonItem = addReviewButton
        
        var categoryTitleLabelAttributedString = NSMutableAttributedString()
        guard let userName = UserDefaults.standard.string(forKey: "NickName") else { return }
        let reviewCount = UserDefaults.standard.integer(forKey: "ReviewCount")
        if self.deviceLocale.isEqual("ko") { // 한국어일때
            // \(userName)님의 리뷰\n20개가 모였습니다.
            categoryTitleLabelAttributedString = NSMutableAttributedString(string: "\(userName)님의 리뷰\n\(reviewCount)개가 모였습니다.", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 28.0)!,
              .kern: 0.0
            ])
            categoryTitleLabelAttributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 28.0)!, range: NSRange(location: 0, length: userName.count))
        } else if self.deviceLocale.isEqual("en") { // 영어일때
            categoryTitleLabelAttributedString = NSMutableAttributedString(string: "\(userName)님의 리뷰\n\(reviewCount)개가 모였습니다.", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 28.0)!,
              .kern: 0.0
            ])
            categoryTitleLabelAttributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 28.0)!, range: NSRange(location: 0, length: userName.count))
//            categoryTitleLabelAttributedString = NSMutableAttributedString(string: "Hi! 루빈\nYou've collected 20reviews.", attributes: [
//              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 27.0)!,
//              .kern: 0.0
//            ])
//            categoryTitleLabelAttributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 27.0)!, range: NSRange(location: 4, length: 2))
        }
        self.categoryTitleLabel.attributedText = categoryTitleLabelAttributedString
        
        if self.isIphone == .iPhone {
            switch UIScreen.main.nativeBounds.height {
            case 1136: // se
                self.categoryVCTitleLabelTopConstraint.constant = 40
            case 1334:
                self.categoryVCTitleLabelTopConstraint.constant = 60
            default:
                self.categoryVCTitleLabelTopConstraint.constant = 80
            }
            
        } else if self.isIphone == .iPad {
            
        }
    }
    
    func initTapListener() {
        self.logoButton.addTarget(self, action: #selector(self.pressTitleButton(_:)), for: .touchUpInside)
        
        let longPressGestureListener = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureForEditCategoryPopUp(_:)))
        longPressGestureListener.minimumPressDuration = 0.5
        self.categoryCollectionView.addGestureRecognizer(longPressGestureListener)
    }
    
    @objc func pressTitleButton(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func pressDrawerViewButton(_ sender: UIBarButtonItem) {
        self.drawerController?.openSide(.left)
    }

    @objc func pressAddReviewButton(_ sender: UIBarButtonItem) {
        self.actor?.didTapAddReviewButton()
    }
}


extension CategoryVC {
    
    // MARK: long press Gesture
    @objc func longPressGestureForEditCategoryPopUp(_ gesture: UIGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = self.categoryCollectionView.indexPathForItem(at: gesture.location(in: self.categoryCollectionView)) else { return }
            if (self.actor?.categoryList[selectedIndexPath.item])!.categoryId == 0 || (self.actor?.categoryList[selectedIndexPath.item])!.categoryId == 1 || (self.actor?.categoryList[selectedIndexPath.item])!.categoryId == 2 || (self.actor?.categoryList[selectedIndexPath.item])!.categoryId == 3 || (self.actor?.categoryList[selectedIndexPath.item])!.categoryId == 4 {
                break
            } else {
                self.actor?.presentEditCategoryPopUp(fromVC: self, category: self.actor?.categoryList[selectedIndexPath.item])
            }
            
        case .ended:
            fallthrough
        default:
            self.categoryCollectionView.reloadData()
        }
    }
}
