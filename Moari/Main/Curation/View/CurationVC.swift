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
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setCurationVCUI()
        // Category, Curation 도메인 부터는 RootViewController 가 이니기 때문에 어쩔 수 없이 UIApplication의 statusBarStyle를 강제로 변환
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
