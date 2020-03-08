//
//  FindEmailPasswordVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class FindEmailPasswordVC: BaseVC, FindEmailPasswordVCProtocol {
    
    @IBOutlet weak var findEmailPasswordGuideLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    /// 가입되었는지 안되었는지 결과에 따라 화면에 나타나도록 하는 Label
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var checkEmailButton: UIButton!
    @IBOutlet weak var sendTemporaryPasswordButton: UIButton!
    /// 임시 비밀번호가 전송되었는지 아닌지 확인할 수 있도록 해주는 Label
    @IBOutlet weak var temporaryPasswordAlertLabel: UILabel!
    
    weak var actor: FindEmailPasswordActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setFindEmailPasswordVCUI()
        self.initTapListener()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setFindEmailPasswordVCUI()
    }
}
