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
        
        self.emailTextField.delegate = self
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
    }
}
