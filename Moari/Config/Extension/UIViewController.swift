//
//  UIViewController.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

// 참고 = https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
extension UIViewController {
    
    /// 다크모드인지 아닌지 확인할 수 있도록 하는 프로퍼티
    var isDarkMode: Bool {
        get {
            if #available(iOS 13.0, *) {
                if self.traitCollection.userInterfaceStyle == .dark {
                    // User Interface is Dark
                    return true
                } else {
                    // User Interface is Light
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    /// 현재 사용 기종 카테고리가 어떤건지 알 수 있도록 하는 프로퍼티
    /// - if iPhone, will return Device.iPhone
    /// - if iPad, will return Device.iPad
    var isIphone: Device {
        get {
            let device = UIDevice().userInterfaceIdiom
            if device == .phone {
                return .iPhone
            } else if device == .pad {
                return .iPad
            }
            return .iPhone
        }
    }
    
    /// 현재 테마가 어떤 테마인지 알 수 있는 프로퍼티
    var theme: Int {
        get {
            UserDefaults.standard.integer(forKey: "Theme")
        }
    }
    
    var indicator: IndicatorView {
        get {
            return IndicatorView.shared
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: 확인만 뜨는 UIAlertController
    func presentAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionDone = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(actionDone)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: 커스텀 버튼과 취소가 뜨는 UIAlertController
    func presentAlertWithAction(title: String, message: String, _ actionCustom: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        alert.addAction(actionCancel)
        alert.addAction(actionCustom)
        self.present(alert, animated: true, completion: nil)
    }
}
