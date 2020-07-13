//
//  CurationVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase

class CurationVC: BaseVC, CurationVCProtocol {
    
    @IBOutlet weak var curationCollectionView: UICollectionView!
    
    var actor: CurationActorDelegate?
    
    lazy var fontSize: CGFloat = {
        switch UIScreen.main.nativeBounds.height {
        case 1136: // se1
            return 15.0
        case 1334:
            return 17.0
        case 1920:
            return 19.0
        case 2436:
            return 17.0
        case 1792, 2688:
            return 19.0
        default:
            return 19.0
        }
    }()
    
    var logoButton: UIButton = UIButton()
    let colorSet: [UIColor] = [.curationPink, .curationBlue, .curationDarkGray, .curationBrown, .curationGreen]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTapListener()
//        self.actor?.didLoadCuration(fromVC: self)
        let curationCellNib = UINib(nibName: "CurationCell", bundle: nil)
        self.curationCollectionView.register(curationCellNib, forCellWithReuseIdentifier: "CurationCell")
        
        self.curationCollectionView.delegate = self
        self.curationCollectionView.dataSource = self
        self.navigationController?.navigationBar.isTranslucent = true
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Analytics.logEvent("CurationVC_Show_ios", parameters: ["req": "CurationVC_Show_ios"])
        
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
            let randNumber = Int(arc4random_uniform(5))
            cell.curationCellTopConstraint.constant = self.topbarHeight
            
            cell.backgroundColorView.backgroundColor = self.colorSet[randNumber]
            self.view.backgroundColor = cell.backgroundColorView.backgroundColor
            guard let imageUrlString = self.actor?.curationList[indexPath.item].imageUrl else { return UICollectionViewCell() }
            if imageUrlString != "" {
                let imageUrl = URL(string: imageUrlString)
                cell.backgroundImageView.kf.setImage(with: imageUrl)
            } else {
                cell.backgroundImageView.image = UIImage(named: "defaultImage")
            }
            
            switch UIScreen.main.nativeBounds.height {
            case 1136: // se1
                cell.reviewTitleViewTopConstraint.constant = 60
                cell.reviewTitleViewHeightConstraint.constant = 70
                cell.reviewTitleTextView.font = UIFont(name: "AppleSDGothicNeo-Light", size: 22)
            case 1334, 2436:
                //                print("iPhone 6/6S/7/8")
                cell.reviewTitleViewTopConstraint.constant = 64
                cell.reviewTitleViewHeightConstraint.constant = 85
                cell.reviewTitleTextView.font = UIFont(name: "AppleSDGothicNeo-Light", size: 25)
            default:
                break
            }
            
            cell.reviewTitleTextView.text = self.actor?.curationList[indexPath.item].title
            cell.reviewTitleTextView.centerVertically()
            cell.reviewSimpleContentTextView.text = self.actor?.curationList[indexPath.item].simpleContent
            self.actor?.setTextViewLineSpacing(cell.reviewSimpleContentTextView, lineSpace: 5.0, fontSize: self.fontSize, color: .white, textAlignment: .center)
            cell.reviewSimpleContentTextView.centerVertically()
            cell.reviewContentLabel.text = self.actor?.curationList[indexPath.item].reviewContent
            self.actor?.setTextViewLineSpacing(cell.reviewContentLabel, lineSpace: 6, fontSize: 17.0, color: .white, textAlignment: .natural)
            self.actor?.updateStarRateImageView(updateCell: cell, value: self.actor?.curationList[indexPath.item].starRate ?? 0)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var screenSize = CGSize()
        screenSize.height = self.curationCollectionView.bounds.height
        screenSize.width = self.curationCollectionView.bounds.width
        
        return screenSize
    }
}
