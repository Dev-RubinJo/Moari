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
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryVCTitleLabelTopConstraint: NSLayoutConstraint!
    
//    @IBAction func makeImageTest(_ sender: Any) {
//        let image = UIView.makeImage(with: self.view)
//        print(image)
//        self.testImageView.image = image
//    }
//    @IBOutlet weak var testImageView: UIImageView!
    
    weak var actor: CategoryActorDelegate?
    weak var mainDelegate: MainVCDelegate?
    
    var logoButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initTapListener()
        self.setCategoryVCUI()
        
        let categoryCellNib = UINib(nibName: "CategoryCell", bundle: nil)
        self.categoryCollectionView.register(categoryCellNib, forCellWithReuseIdentifier: "CategoryCell")
        
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
        self.mainDelegate = MainVC.shared
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setCategoryVCUI()
    }
}
