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
        
        let drawerViewButton = UIBarButtonItem(image: UIImage(named: "drawerMenuDark"), style: .plain, target: self, action: #selector(self.pressDrawerViewButton(_:)))

        let addReviewButton = UIBarButtonItem(image: UIImage(named: "addReviewDark"), style: .plain, target: self, action: #selector(self.pressAddReviewButton(_:)))
        
        self.navigationItem.leftBarButtonItem = drawerViewButton
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
    
    @objc func pressDrawerViewButton(_ sender: UIBarButtonItem) {
        self.drawerController?.openSide(.left)
    }
    
    @objc func pressAddReviewButton(_ sender: UIBarButtonItem) {
        // Actor로 옮기기
        let addReviewRootVC = AddReviewVC.makeAddReviewVC
        let addReviewVC = UINavigationController.init(rootViewController: addReviewRootVC)
        addReviewRootVC.isAdd = true
        addReviewVC.modalPresentationStyle = .fullScreen
        self.present(addReviewVC, animated: true, completion: nil)
    }
}
