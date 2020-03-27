//
//  UserInfoVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class UserInfoVC: BaseVC, UserInfoVCProtococl {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var editUserInfoButton: UIButton!
    @IBOutlet weak var userInfoVCTitleLabel: UILabel!
    
    @IBOutlet weak var emailGuideLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var userNameGuideLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordGuideLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var deleteUserButton: UIButton!
    
    var actor: (UserInfoActorDelegate & UserInfoPopUpActorDelegate)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.setUserInfoVCUI()
        self.initTapListener()
    }
}
extension UserInfoVC {
    func setUserInfoVCUI() {
        guard let email = UserDefaults.standard.string(forKey: "UserEmail") else { return }
        guard let nickName = UserDefaults.standard.string(forKey: "NickName") else { return }
        self.emailLabel.text = email
        
        let userNameTextFieldPlaceholder = NSAttributedString(string: nickName, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.userNameTextField.attributedPlaceholder = userNameTextFieldPlaceholder
        let userNamePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.userNameTextField.leftView = userNamePaddingView
        self.userNameTextField.leftViewMode = .always
        self.userNameTextField.layer.cornerRadius = 3
        
        let passwordTextFieldPlaceholder = NSAttributedString(string: "PASSWORD_SIGN_UP_PLACEHOLDER".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.passwordTextField.attributedPlaceholder = passwordTextFieldPlaceholder
        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.passwordTextField.leftView = passwordPaddingView
        self.passwordTextField.leftViewMode = .always
        self.passwordTextField.layer.cornerRadius = 3
        
        let passwordCheckTextFieldPlaceholder = NSAttributedString(string: "PASSWORD_CHECK_PLACEHOLDER".localized, attributes: [NSAttributedString.Key.foregroundColor: UIColor.signInBottomBorderBar])
        self.passwordCheckTextField.attributedPlaceholder = passwordCheckTextFieldPlaceholder
        let passwordCheckPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 0))
        self.passwordCheckTextField.leftView = passwordCheckPaddingView
        self.passwordCheckTextField.leftViewMode = .always
        self.passwordCheckTextField.layer.cornerRadius = 3
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        guard let userInfo = sender.userInfo as? [String: Any] else {return}
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardHeight = keyboardFrame.cgRectValue.height
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                self.view.frame.origin.y = -keyboardHeight + 120 // 키보드 높이만큼 위로 올라가기
            default:
                return
            }
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    func initTapListener() {
        self.dismissButton.addTarget(self, action: #selector(self.pressDismissButton(_:)), for: .touchUpInside)
        self.editUserInfoButton.addTarget(self, action: #selector(self.pressEditUserInfoButton(_:)), for: .touchUpInside)
        self.signOutButton.addTarget(self, action: #selector(self.pressSignOutButton(_:)), for: .touchUpInside)
        self.deleteUserButton.addTarget(self, action: #selector(self.pressDeleteUserButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressDismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressEditUserInfoButton(_ sender: UIButton) {
        if self.userNameTextField.text == "" && self.passwordTextField.text == "" {
            self.showToast(text: "수정할 내용이 없어요!")
        } else if self.passwordTextField.text != self.passwordCheckTextField.text {
            self.showToast(text: "비밀번호를 다시 확인해주세요!")
        } else {
            self.actor?.didTapEditUserInfoButton(fromVC: self, nickName: self.userNameTextField.text, password: self.passwordTextField.text)
        }
    }
    
    @objc func pressSignOutButton(_ sender: UIButton) {
        self.actor?.presentSignOutPopUp(fromVC: self)
    }
    
    @objc func pressDeleteUserButton(_ sender: UIButton) {
        self.actor?.presentDeleteUserPopUp(fromVC: self)
    }
}
