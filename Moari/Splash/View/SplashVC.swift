//
//  SplashVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SplashVC: BaseVC, SplashVCProtocol {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    static let viewRouter: SplashVCRouterDelegate = SplashVC()
    
    weak var actor: SplashActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoImageView.image = UIImage(named: "logoImage")
        self.delay(0.5) { [weak self] in
            self?.actor?.didLoadSplash(fromVC: self!)
        }
    }
    // 다크모드 지원은 어떻게?
}
