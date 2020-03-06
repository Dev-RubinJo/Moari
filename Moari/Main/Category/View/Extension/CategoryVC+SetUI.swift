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
//        guard let userName = UserDefaults.standard.string(forKey: "NickName") else { return }
        if self.deviceLocale.isEqual("ko") { // 한국어일때
            // \(userName)님의 리뷰\n20개가 모였습니다.
            categoryTitleLabelAttributedString = NSMutableAttributedString(string: "감성님의 리뷰\n20개가 모였습니다.", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 28.0)!,
              .foregroundColor: UIColor(white: 1.0, alpha: 1.0),
              .kern: 0.0
            ])
            categoryTitleLabelAttributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 28.0)!, range: NSRange(location: 0, length: 2))
        } else if self.deviceLocale.isEqual("en") { // 영어일때
            categoryTitleLabelAttributedString = NSMutableAttributedString(string: "감성님의 리뷰\n20개가 모였습니다.", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 28.0)!,
              .foregroundColor: UIColor(white: 1.0, alpha: 1.0),
              .kern: 0.0
            ])
            categoryTitleLabelAttributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 28.0)!, range: NSRange(location: 0, length: 2))
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
