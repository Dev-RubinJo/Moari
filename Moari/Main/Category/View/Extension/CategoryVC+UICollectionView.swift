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
        
        cell.categoryCellBackgroundView.layer.borderColor = UIColor.notExistCategoryCellBorderColor.cgColor
        cell.categoryCellBackgroundView.layer.borderWidth = 1
        
        return cell
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
