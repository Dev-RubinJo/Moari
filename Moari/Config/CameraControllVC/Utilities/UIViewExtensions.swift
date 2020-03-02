//
//  UIViewExtensions.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/02.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension UIView {
  func autoRemoveConstraint(_ constraint : NSLayoutConstraint?) {
    if constraint != nil {
      removeConstraint(constraint!)
    }
  }
}
