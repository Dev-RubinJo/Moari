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
        
        self.setColorModeUI()
        self.setSignUpVCUI()
        self.initTapListener()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setColorModeUI()
    }
    
    func setLightModeUI() {
        self.emailTextField.backgroundColor = .textFieldGrayLight
        self.passwordTextField.backgroundColor = .textFieldGrayLight
        self.passwordCheckTextField.backgroundColor = .textFieldGrayLight
        self.nickNameTextField.backgroundColor = .textFieldGrayLight
        
        self.usingTermArrowImageView.image = UIImage(named: "goNextICLight")
        self.personalTermArrowImageView.image = UIImage(named: "goNextICLight")
        UIApplication.shared.statusBarStyle = .default
    }
    
    func setDarkModeUI() {
        self.emailTextField.backgroundColor = .textFieldGrayDark
        self.passwordTextField.backgroundColor = .textFieldGrayDark
        self.passwordCheckTextField.backgroundColor = .textFieldGrayDark
        self.nickNameTextField.backgroundColor = .textFieldGrayDark
        
        self.usingTermArrowImageView.image = UIImage(named: "goNextICDark")
        self.personalTermArrowImageView.image = UIImage(named: "goNextICDark")
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func setSystemColorModeUI() {
        if self.isDarkMode {
            self.setDarkModeUI()
        } else {
            self.setLightModeUI()
        }
    }
    
    func setColorModeUI() {
        self.signUpButton.setTitleColor(.defaultPink, for: .normal)
        self.signUpButton.layer.borderColor = UIColor.defaultPink.cgColor
        // TODO: SetUI로 옮기기
        self.signUpButton.layer.borderWidth = 1
        switch self.theme {
        case 0:
            self.setLightModeUI()
        case 1:
            self.setDarkModeUI()
        case 2:
            self.setSystemColorModeUI()
        default:
            self.setLightModeUI()
        }
    }
}
