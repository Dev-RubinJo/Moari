//
//  CurationVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension CurationVC {
    
    func setCurationVCUI() {
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.logoButton.setImage(UIImage(named: "navigationTitleLogoCurationDark"), for: .normal)
        self.navigationItem.titleView = self.logoButton
        self.navigationController?.navigationBar.tintColor = .white        

        let addReviewButton = UIBarButtonItem(image: UIImage(named: "addReviewDark"), style: .plain, target: self, action: #selector(self.pressAddReviewButton(_:)))
        self.navigationItem.rightBarButtonItem = addReviewButton
        
        if self.isIphone == .iPhone {
            
        } else if self.isIphone == .iPad {
            
        }
    }
    
    func initTapListener() {
        self.logoButton.addTarget(self, action: #selector(self.pressTitleButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressTitleButton(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0
    }
    
    @objc func pressAddReviewButton(_ sender: UIBarButtonItem) {
        
        // Router로 옮기기
        let vc = TestVC.makeTest
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
