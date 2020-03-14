//
//  CategoryDetailVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CategoryDetailVC: BaseVC, CategoryDetailVCProtocol {
    
    /// 선택한 카테고리에 대한 리뷰 리스트를 띄워주는 콜렉션 뷰
    @IBOutlet weak var categoryDetailCollectionView: UICollectionView!
    
    weak var actor: CategoryDetailActorDelegate?
    var category: Category?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = .default
        
        self.categoryDetailCollectionView.delegate = self
        self.categoryDetailCollectionView.dataSource = self
        
        let categoryDetailCellNib = UINib(nibName: "CategoryDetailCell", bundle: nil)
        self.categoryDetailCollectionView.register(categoryDetailCellNib, forCellWithReuseIdentifier: "CategoryDetailCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let theme = UserDefaults.standard.integer(forKey: "Theme")
        switch theme {
        case 0:
            UIApplication.shared.statusBarStyle = .default
        case 1:
            UIApplication.shared.statusBarStyle = .lightContent
        case 2:
            UIApplication.shared.statusBarStyle = .default
        default:
            UIApplication.shared.statusBarStyle = .default
        }
        self.actor?.didLoadCategoryDetailList(fromVC: self)
    }
}

// 롱클릭 이벤트 => 리뷰 삭제
// 상단 플러스버튼 => 리뷰 추가
// 셀 클릭 이벤트 => 리뷰 보기
