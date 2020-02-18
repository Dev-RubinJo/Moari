//
//  BaseVCProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import Foundation

@objc protocol BaseVCProtocol {
    
    func initVC()
    
    /// 다크모드를 안쓰는 화면이 있을 수 있기에 optional func로 선언
    @objc optional func setDarkModeUI()
}
