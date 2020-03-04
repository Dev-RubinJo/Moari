//
//  CurationVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CurationVC: BaseVC, CurationVCProtocol {
    
    @IBOutlet weak var curationCollectionView: UICollectionView!
    
    weak var actor: CurationActorDelegate?
    
    var logoButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setCurationVCUI()
        self.initTapListener()
        
        let curationCellNib = UINib(nibName: "CurationCell", bundle: nil)
        self.curationCollectionView.register(curationCellNib, forCellWithReuseIdentifier: "CurationCell")
        
        self.curationCollectionView.delegate = self
        self.curationCollectionView.dataSource = self
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setCurationVCUI()
        // Category, Curation 도메인 부터는 RootViewController 가 이니기 때문에 어쩔 수 없이 UIApplication의 statusBarStyle를 강제로 변환
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
extension CurationVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurationCell", for: indexPath) as? CurationCell else {
            return UICollectionViewCell()
        }
        
//        cell.backgroundColorView.backgroundColor = 지정할 컬러
        self.curationCollectionView.backgroundColor = cell.backgroundColorView.backgroundColor
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize = UIScreen.main.bounds.size
        
        return screenSize
    }
    
}
