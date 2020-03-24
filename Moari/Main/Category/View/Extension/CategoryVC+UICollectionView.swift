//
//  CategoryVC+UICollectionView.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

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
        // TODO: 카테고리를 선택하고 선택한 카테고리의 리뷰들 띄우기
        // 롱클릭 이벤트 1 ~ 4번째 카테고리는 적용 안되도록 하기
        // 롱클릭 이벤트 0번 카테고리는 적용 안되도록 하기
        
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
                //272
                // cell size is 90.6
                return CGSize(width: 90.6, height: 90.6)
            case 1334, 2436: // 6, 7, 8 X, 11pro
                // 327
                // cell size is 109
                return CGSize(width: 109, height: 109)
            default:
                // 366 // 6+7+8+ xr 11 11promax
                // cell size is 122
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
