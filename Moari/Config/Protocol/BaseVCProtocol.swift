//
//  BaseVCProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation

@objc protocol BaseVCProtocol {
    
    /// 라이트모드에서의 세팅 메서드
    @objc optional func setLightModeUI()
    
    /// 다크모드를 안쓰는 화면이 있을 수 있기에 optional func로 선언
    @objc optional func setDarkModeUI()
    
    /// 시스템 모드를 따라가는 메서드
    @objc optional func setSystemColorModeUI()
    
    /// 최종 테마에 따라 화면 테마 적용하는 메서드
    @objc optional func setColorModeUI()
}
