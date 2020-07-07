//
//  CategoryVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Firebase

class CategoryVC: BaseVC, CategoryVCProtocol {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryVCTitleLabelTopConstraint: NSLayoutConstraint!

    var actor: (CategoryActorDelegate & CategoryPopUpActorDelegate)?
    
    var logoButton: UIButton = UIButton()
    var category: Category = Category()
    var reviewCount: Int = 0
    
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
        
        // FIXME: 버그
        self.actor?.didLoadCategoryVC(vc: self)
        
        if UserDefaults.standard.bool(forKey: "ShowTutorial") {
            let usingGuideView = UsingGuideView()
            usingGuideView.modalPresentationStyle = .fullScreen
            self.present(usingGuideView, animated: true, completion: nil)
        }
        
        Analytics.logEvent("CategoryVC_Show_ios", parameters: ["req": "CategoryVC_Show_ios"])
    }
}

// MARK: - Collection View 기능
extension CategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        if self.actor?.categoryList.count ?? 0 > 0 {
            if self.actor?.categoryList[indexPath.item].categoryId != 0 {
                cell.categotyCellBackgroundView.alpha = 0.2
                cell.categoryCellBorderView.alpha = 0.7
                cell.categoryCellBorderView.layer.borderColor = UIColor.white.cgColor
                cell.categoryCellBorderView.layer.borderWidth = 0.5
                // TODO: 기본제공 카테고리 영문화 적용하기
                // if categoryId 로 구분하면 될듯하다
                cell.categoryTitleLabel.text = self.actor?.categoryList[indexPath.item].categoryName
            } else {
                cell.categotyCellBackgroundView.alpha = 0.1
                cell.categoryCellBorderView.alpha = 0.45
                cell.categoryCellBorderView.layer.borderColor = UIColor.white.cgColor
                cell.categoryCellBorderView.layer.borderWidth = 0.5
                // TODO: 추가하기 영문화
                cell.categoryTitleLabel.text = "추가하기"
                cell.categoryTitleLabel.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 16)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.actor?.categoryList[indexPath.item].categoryId != 0 {
            guard let category = self.actor?.categoryList[indexPath.item] else { return }
            self.category = category
            self.actor?.didTapCategoryCell(indexPath.item)
        } else {
            self.actor?.presentAddCategoryPopUp(fromVC: self, category: nil)
        }
    }
    
    // 기종별 Cell 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.isIphone {
        case .iPhone:
            switch UIScreen.main.nativeBounds.height {
            case 1136: // se
                return CGSize(width: 90.6, height: 90.6)
            case 1334, 2436: // 6, 7, 8 X, 11pro
                return CGSize(width: 109, height: 109)
            default:
                return CGSize(width: 122, height: 122)
            }
        case .iPad:
            // TODO: 아이패드 레이아웃 넣기
            break
        }
        return CGSize()
    }
}
extension CategoryVC: AddCategoryPopUpDelegate {
    func didTapAddCategoryDoneButton() {
        print(1)
    }
}
