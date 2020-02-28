//
//  CategoryVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CategoryVC: BaseVC, CategoryVCProtocol {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryVCTitleLabelTopConstraint: NSLayoutConstraint!
    
//    @IBAction func makeImageTest(_ sender: Any) {
//        let image = UIView.makeImage(with: self.view)
//        print(image)
//        self.testImageView.image = image
//    }
//    @IBOutlet weak var testImageView: UIImageView!
    
    weak var actor: CategoryActorDelegate?
    
    var logoButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setColorModeUI()
        self.setCategoryVCUI()
        
        let categoryCellNib = UINib(nibName: "CategoryCell", bundle: nil)
        self.categoryCollectionView.register(categoryCellNib, forCellWithReuseIdentifier: "CategoryCell")
        
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
//        logoButton.addTarget(self, action: #selector(self.test(_:)), for: .touchUpInside)
        self.navigationItem.titleView = self.logoButton
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setColorModeUI()
    }
    
    func setLightModeUI() {
        self.logoButton.setImage(UIImage(named: "navigationTitleLogoCategoryDark"), for: .normal)
    }
    
    func setDarkModeUI() {
        self.logoButton.setImage(UIImage(named: "navigationTitleLogoCategoryDark"), for: .normal)
    }
    
    func setSystemColorModeUI() {
        if self.isDarkMode {
            self.setDarkModeUI()
        } else {
            self.setLightModeUI()
        }
    }
    
    func setColorModeUI() {
        switch self.theme {
        case 0:
            self.setLightModeUI()
        case 1:
            self.setDarkModeUI()
        case 2:
            self.setSystemColorModeUI()
        default:
            self.setLightModeUI()
        }
    }
}
