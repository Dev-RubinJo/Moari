//
//  SignInVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SignInVC: BaseVC, SignInVCProtocol {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var signInTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButtonLabel: UILabel!
    @IBOutlet weak var findEmailPasswordLabel: UILabel!
    @IBOutlet weak var borderBarView: UIView!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBOutlet weak var signInLogoTopConstraint: NSLayoutConstraint!
    /// 이메일, 비밀번호 찾기 오른쪽 마진
    @IBOutlet weak var findEmailPasswordLabelRightConstraint: NSLayoutConstraint!
    /// 회원가입 왼쪽 마진
    @IBOutlet weak var signUpLabelLeftConstraint: NSLayoutConstraint!
    /// 이메일찾기, 회원가입 가운데 뷰 x축 좌표
    @IBOutlet weak var borderBarViewCenterConstraint: NSLayoutConstraint!
    
    weak var actor: SignInActorDelegate?
    
    var emailTextFieldPlaceholder = NSAttributedString(string: "EMAIL".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
    var passwordTextFieldPlaceholder = NSAttributedString(string: "PASSWORD".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setColorModeUI()
        //        self.setDarkModeUI()
        //        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.setSignInVCUI()
        
        self.initTapListener()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.setColorModeUI()
    }
    
    func setLightModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageLight")
        self.signInTitleLabel.textColor = .black
        
        self.emailTextField.backgroundColor = .textFieldGrayLight
        self.passwordTextField.backgroundColor = .textFieldGrayLight
        
        self.signInButtonLabel.textColor = .defaultPink
        self.signInButtonLabel.layer.borderColor = UIColor.defaultPink.cgColor
        
        self.findEmailPasswordLabel.textColor = .signInBottomLabels
        self.signUpLabel.textColor = .signInBottomLabels
        UIApplication.shared.statusBarStyle = .default
    }
    
    func setDarkModeUI() {
        self.logoImageView.image = UIImage(named: "logoImageDark")
        self.signInTitleLabel.textColor = .white
        
        self.emailTextField.backgroundColor = .textFieldGrayDark
        self.passwordTextField.backgroundColor = .textFieldGrayDark
        
        self.signInButtonLabel.textColor = .defaultPink
        self.signInButtonLabel.layer.borderColor = UIColor.defaultPink.cgColor
        
        self.findEmailPasswordLabel.textColor = .signInBottomLabels
        self.signUpLabel.textColor = .signInBottomLabels
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
        switch self.theme {
        case 0:
            self.setLightModeUI()
        case 1:
            self.setDarkModeUI()
        case 2:
            if #available(iOS 13.0, *) {
                self.setSystemColorModeUI()
            } else {
                fallthrough
            }
        default:
            self.setLightModeUI()
        }
    }
}
