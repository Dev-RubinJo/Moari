//
//  CategoryVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension CategoryVC {
    
    func setCategoryVCUI() {
        
        
        
        
        if self.isIphone == .iPhone {
            switch UIScreen.main.nativeBounds.height {
            case 1136: // se
                //272
                // cell size is 90.6
                break
            case 1334: // 6, 7, 8
                // 327
                // cell size is 109
                break
            case 2436: // pro
                break
            case 1920: // +
                break
            case 1792: // 11, xr
                break
            case 2688: // pro max
                break
            default:
                break
            }
            
        } else if self.isIphone == .iPad {
            
        }
    }
}
