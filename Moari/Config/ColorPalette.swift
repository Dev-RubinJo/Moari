//
//  ColorPalette.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

struct ColorPalette {
    
    private init() {}
    /// 어느 뷰에서 어떤 용도로 쓰이는 색상인지 설명 적기
    static let blackMain: UInt = 0x3c3c3c
    // rgb 128 128 128
    static let grayDarkMain: UInt = 0x808080
    // rgb 152 152 152
    static let graySoftMain: UInt = 0x989898
    // rgb 254 221 55
    static let yellowMain: UInt = 0xfedd37
    // rgb 207 207 207
    static let borderDark: UInt = 0xcfcfcf
    // rgb 237 237 237
    static let borderSoft: UInt = 0xededed
    
    /// SignInVC SignInButtonLabel Light Mode Color
    static let deepPink: UInt = 0xd4005b
    
    /// SignInVC TextField background Color
    static let signInTextFieldBGColor: UInt = 0xfafafa
    
}
