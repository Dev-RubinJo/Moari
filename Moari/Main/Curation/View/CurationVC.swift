//
//  CurationVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Kingfisher

class CurationVC: BaseVC, CurationVCProtocol {
    
    @IBOutlet weak var curationCollectionView: UICollectionView!
    
    var actor: CurationActorDelegate?
    
    var logoButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTapListener()
//        self.actor?.didLoadCuration(fromVC: self)
        let curationCellNib = UINib(nibName: "CurationCell", bundle: nil)
        self.curationCollectionView.register(curationCellNib, forCellWithReuseIdentifier: "CurationCell")
        
        self.curationCollectionView.delegate = self
        self.curationCollectionView.dataSource = self
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setCurationVCUI()
        self.actor?.didLoadCuration(fromVC: self)
        // Category, Curation 도메인 부터는 RootViewController 가 이니기 때문에 어쩔 수 없이 UIApplication의 statusBarStyle를 강제로 변환
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
extension CurationVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.actor?.curationList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.curationCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurationCell", for: indexPath) as? CurationCell else {
                return UICollectionViewCell()
            }
            //        cell.backgroundColorView.backgroundColor = 지정할 컬러
            self.curationCollectionView.backgroundColor = cell.backgroundColorView.backgroundColor
            guard let imageUrlString = self.actor?.curationList[indexPath.item].imageUrl else { return UICollectionViewCell() }
            let imageUrl = URL(string: imageUrlString)
            cell.backgroundImageView.kf.setImage(with: imageUrl)
            cell.reviewTitleLabel.text = self.actor?.curationList[indexPath.item].title
            cell.reviewSimpleContentLabel.text = self.actor?.curationList[indexPath.item].simpleContent
            cell.reviewContentLabel.text = self.actor?.curationList[indexPath.item].reviewContent
            self.actor?.updateStarRateImageView(updateCell: cell, value: self.actor?.curationList[indexPath.item].starRate ?? 0)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        var screenSize = UIScreen.main.bounds.size
//        screenSize.height = screenSize.height - (self.navigationController?.navigationBar.bounds.height)!
        var screenSize = CGSize()
        screenSize.height = self.curationCollectionView.bounds.height
        screenSize.width = self.curationCollectionView.bounds.width
        
        return screenSize
    }
}
