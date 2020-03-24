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
        vc.presentAlert(title: "이메일 오류!", message: "이메일이 올바르지 않아요!")
    }
    
    func presentInvalidPasswordAlert(toVC vc: SignUpVC) {
        // TODO: 비밀번호 형식이 올바르지 않다는 문구 작성하기
        vc.presentAlert(title: "비밀번호 오류!", message: "비밀번호 형식이 맞지 않아요!")
    }
    
    func presentInvalidPasswordCheckAlert(toVC vc: SignUpVC) {
        // TODO: 비밀번호 확인이 다르다는 문구 작성하기
        vc.presentAlert(title: "비밀번호 확인!", message: "비밀번호와 비밀번호 확인을 다시 확인해주세요!")
    }
    
    func presentCheckTermAlert(toVC vc: SignUpVC) {
        // TODO: 약관 동의 체크 하라는 문구 작성하기
        vc.presentAlert(title: "약관동의는 필수!", message: "약관동의를 읽고 꼭 체크해주세요!")
    }
}
