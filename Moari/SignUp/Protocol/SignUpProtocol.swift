//
//  SignUpProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/23.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

protocol SignUpVCProtocol: BaseVCProtocol {
    
    var actor: (SignUpActorDelegate & SignUpAlertActorDelegate)? { get set }
    
    /// 회원가입 후 로그인을 위한 변수를 가져오기 위해 정의한 프로퍼티
    var email: String { get }
    /// 회원가입 후 로그인을 위한 변수를 가져오기 위해 정의한 프로퍼티
    var password: String { get }
}

protocol SignUpVCRouterDelegate: class {
    
    var window: UIWindow? { get }
    
    static var makeSignUpVC: SignUpVC { get }
    
    func presentUsingPolicyView()
    
    func presentPersonPolicyView()
    
    func presentMainVC()
}

protocol SignUpActorDelegate: class {
    
    var view: (SignUpVCProtocol & SignUpVCRouterDelegate)? { get set }
    
    var dataManager: SignUpDataManagerDelegate? { get set }
    
    func didTapUsingTermLabel()
    
    func didTapUsingTermCheckImageView(updateVC vc: SignUpVC)
    
    func didTapPersonalTermLabel()
    
    func didTapPersonalTermCheckImageView(updateVC vc: SignUpVC)
    
    func didTapSignUpButton(fromVC vc: SignUpVC)
    
    /// 회원가입 팝업에서 로그인하기 버튼 누르고 난 후 로그인 되었을 때의 Actor 메서드
    func completeSignInAfterSignUp()
}

protocol SignUpAlertActorDelegate: class {
    
    func presentInvalidEmailAlert(toVC vc: SignUpVC)
    
    func presentInvalidPasswordAlert(toVC vc: SignUpVC)
    
    func presentInvalidPasswordCheckAlert(toVC vc: SignUpVC)
    
    func presentCheckTermAlert(toVC vc: SignUpVC)
}

protocol SignUpPopUpActorDelegate: class {
    
    func presentSignUpPopUp(fromVC vc: SignUpVC)
}

protocol SignUpDataManagerDelegate: class {
    
    var actor: (SignUpActorDelegate & SignUpAlertActorDelegate & SignUpPopUpActorDelegate)? { get set }
        
    func signUp(fromVC vc: SignUpVC, email: String, password: String, nickName: String)
    
    func signInAfterSignUp(email: String, password: String)
}
