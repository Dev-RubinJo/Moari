//
//  UITextView.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/02.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension UITextView {
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}
