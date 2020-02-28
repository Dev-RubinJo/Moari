//
//  SignUpActor+Alert.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/26.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

extension SignUpActor: SignUpAlertActorDelegate {
    
    func presentInvalidEmailAlert(toVC vc: SignUpVC) {
        // TODO: 이메일 형식이 올바르지 않다는 문구 작성하기
        vc.presentAlert(title: "", message: "")
    }
    
    func presentInvalidPasswordAlert(toVC vc: SignUpVC) {
        // TODO: 비밀번호 형식이 올바르지 않다는 문구 작성하기
        vc.presentAlert(title: "", message: "")
    }
    
    func presentInvalidPasswordCheckAlert(toVC vc: SignUpVC) {
        // TODO: 비밀번호 확인이 다르다는 문구 작성하기
        vc.presentAlert(title: "", message: "")
    }
    
    func presentCheckTermAlert(toVC vc: SignUpVC) {
        // TODO: 약관 동의 체크 하라는 문구 작성하기
        vc.presentAlert(title: "", message: "")
    }
}
