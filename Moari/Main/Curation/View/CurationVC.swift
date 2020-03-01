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
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
