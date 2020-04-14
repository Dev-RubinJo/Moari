//
//  SignUp.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/26.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Firebase

class SignUp: BaseVC {
    
    @IBOutlet weak var signUpPopUpView: UIView!
    @IBOutlet weak var signUpPopUpTitle: UILabel!
    @IBOutlet weak var signUpPopUpButton: UIButton!
    @IBOutlet weak var signUpPopUpBorderView: UIView!
    @IBOutlet weak var outsideView: UIView!
    
    weak var delegate: SignUpPopUpDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpPopUpView.layer.cornerRadius = 3
        self.initSignUpPopUpTapListener()
        
        // TODO: 각 들어갈 문구 작성하기
        self.signUpPopUpTitle.text = "SIGNUP_POPUP_TITLE".localized
        self.signUpPopUpButton.setTitle("SIGNUP_POPUP_BUTTON".localized, for: .normal)
    }
    
    func initSignUpPopUpTapListener() {
        self.signUpPopUpButton.addTarget(self, action: #selector(self.didTapSignUpPopUpButton(_:)), for: .touchUpInside)
        
        let outsideViewTapListener = UITapGestureRecognizer(target: self, action: #selector(self.didTapOutsideView(_:)))
        self.outsideView.isUserInteractionEnabled = true
        self.outsideView.addGestureRecognizer(outsideViewTapListener)
    }
    
    @objc func didTapSignUpPopUpButton(_ sender: UIButton) {
        Analytics.logEvent("Sign_Up_PopUp_OK_ios", parameters: ["req": "Sign_Up_PopUp_OK_ios"])
        self.delegate?.pressSignInButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapOutsideView(_ sender: UIView) {
        self.dismiss(animated: true, completion: nil)
    }
}
