//
//  SignUpVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SignUpVC: BaseVC, SignUpVCProtocol {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var usingTermCheckButtonImageView: UIImageView!
    @IBOutlet weak var usingTermView: UIView!
    @IBOutlet weak var usingTermLabel: UILabel!
    @IBOutlet weak var usingTermArrowImageView: UIImageView!
    
    @IBOutlet weak var personalTermCheckButtonImageView: UIImageView!
    @IBOutlet weak var personalTermView: UIView!
    @IBOutlet weak var personalTermLabel: UILabel!
    @IBOutlet weak var personalTermArrowImageView: UIImageView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    weak var actor: (SignUpActorDelegate & SignUpAlertActorDelegate)?
    
    var email: String {
        get {
            self.emailTextField.text ?? ""
        }
    }
    
    var password: String {
        get {
            self.passwordTextField.text ?? ""
        }
    }
    
    // 약관동의 체크를 했는지 안했는지 구분하기 위한 변수
    // TODO: think 이 변수를 Actor에 넣는다면?
    var usingPolicyCheck: Bool = false
    var personalPolicyCheck: Bool = false
    
    let checkOnImage: UIImage = UIImage(named: "checkOn") ?? UIImage()
    let checkOffImage: UIImage = UIImage(named: "checkOff") ?? UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordCheckTextField.delegate = self
        self.nickNameTextField.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setSignUpVCUI()
        self.initTapListener()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setSignUpVCUI()
    }
}
