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

    weak var actor: (CategoryActorDelegate & CategoryPopUpActorDelegate)?
    
    var logoButton: UIButton = UIButton()
    var category: Category = Category()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTapListener()
        let categoryCellNib = UINib(nibName: "CategoryCell", bundle: nil)
        self.categoryCollectionView.register(categoryCellNib, forCellWithReuseIdentifier: "CategoryCell")
        
        self.categoryCollectionView.delegate = self
        self.categoryCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setCategoryVCUI()
        // Category, Curation 도메인 부터는 RootViewController 가 이니기 때문에 어쩔 수 없이 UIApplication의 statusBarStyle를 강제로 변환
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: .clear)
        
        self.actor?.didLoadCategoryVC(vc: self)
    }
}
    
//    @IBAction func makeImageTest(_ sender: Any) {
//        let image = UIView.makeImage(with: self.view)
//        print(image)
//        self.testImageView.image = image
//    }
//    @IBOutlet weak var testImageView: UIImageView!
