//
//  UIColor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    
    
    /// SignInVC SignInButtonLabel Light Mode Color
    @nonobjc class var defaultPink: UIColor {
      return UIColor(red: 212.0 / 255.0, green: 0.0, blue: 91.0 / 255.0, alpha: 1.0)
    }

    /// System black and white color
    static let systemWBColor = UIColor(named: "SystemWBColor")!
    
    /// TextField background Color
    static let textFieldBackgroundGray = UIColor(named: "TextFieldBackgroundGray")!
    
    /// SignInVC Bottom Label Border bar Color
    @nonobjc class var signInBottomBorderBar: UIColor {
      return UIColor(white: 151.0 / 255.0, alpha: 1.0)
    }

    /// SignInVC Bottom LabelColor(Find email password, Sign Up)
    @nonobjc class var signInBottomLabels: UIColor {
      return UIColor(white: 117.0 / 255.0, alpha: 1.0)
    }

    /// UINavigationBar Bottom Border Color
    @nonobjc class var navigationBarBottomBorder: UIColor {
      return UIColor(white: 189.0 / 255.0, alpha: 1.0)
    }
    
    /// TextField, TextView Cursor Color
    @nonobjc class var cursorColor: UIColor {
      return UIColor(red: 194.0 / 255.0, green: 24.0 / 255.0, blue: 91.0 / 255.0, alpha: 1.0)
    }
    
    /// SignUp PopUp Border Color
    @nonobjc class var popUpBorderColor: UIColor {
      return UIColor(white: 224.0 / 255.0, alpha: 1.0)
    }
    
    /// CategoryVC Cell Border Color If It is not exist
    @nonobjc class var notExistCategoryCellBorderColor: UIColor {
        return UIColor(red: 106.0 / 255.0, green: 110.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
    }
    
    /// CategoryVC Cell Border Color If It exist
    @nonobjc class var existCategoryCellBorderColor: UIColor {
        return UIColor(red: 154.0 / 255.0, green: 166.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
    }
}
