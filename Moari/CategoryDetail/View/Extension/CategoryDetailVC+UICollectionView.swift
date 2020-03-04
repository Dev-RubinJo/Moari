//
//  CategoryDetailVC+UICollectionView.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension CategoryDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDetailCell", for: indexPath) as? CategoryDetailCell else {
            return UICollectionViewCell()
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.isIphone {
        case .iPhone:
            switch UIScreen.main.nativeBounds.height {
            case 1136: // se
                //272
                // cell size is 90.6
                return CGSize(width: 160, height: 160)
            case 1334, 2436: // 6, 7, 8 X, 11pro
                // 327
                // cell size is 109
                return CGSize(width: 187.5, height: 187.5)
            default:
                // 366 // 6+7+8+ xr 11 11promax
                // cell size is 122
                return CGSize(width: 207, height: 207)
            }
        case .iPad:
            // TODO: 아이패드 레이아웃 넣기
            break
        }
        return CGSize()
    }
}
