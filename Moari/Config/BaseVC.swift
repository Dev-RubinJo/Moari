//
//  BaseVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import SnapKit

class BaseVC: UIViewController {
    
//    private let authContext = LAContext()
    
    lazy var toastView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .white
        }
        view.layer.cornerRadius = 3
        view.alpha = 0
        return view
    }()
    
    lazy var toastLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AppleSDGothicNeo-Light", size: 17)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    var isDarkModeValue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initBaseVC()
        UITextField.appearance().tintColor = .cursorColor
        UITextView.appearance().tintColor = .cursorColor
//        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initBaseVC()
        
        // Toast View, Label 추가
        self.view.addSubview(self.toastView)
        self.toastView.snp.makeConstraints { make in
            make.width.equalTo(240)
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-80)
            make.height.equalTo(100)
            make.center.equalToSuperview()
        }
        self.toastView.addSubview(self.toastLabel)
        self.toastLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.center.equalToSuperview()
        }
//        self.setBaseColorModeUI()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.initBaseVC()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        switch self.isIphone {
        case .iPhone:
            return [.portrait]
        case .iPad:
            return [.portrait, .landscape]
//        @unknown case _:
//            return [.portrait]
        }
    }
    
    func initBaseVC() {
        self.hideKeyboardWhenTappedAround()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.topItem?.title = ""
        let navigationTitleFont = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: navigationTitleFont!]
        
        let imageBack = UIImage(named: "backArrow")
        self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: imageBack, style: .plain, target: self, action: nil)
    }
        
    func appearIndicator() {
        self.indicator.show()
    }
    
    func disappearIndicator() {
        self.indicator.dismiss()
    }
    
    func showToast(text: String) {
        self.toastLabel.text = text
        self.toastView.alpha = 1.0
        UIView.animate(withDuration: 2.5) {
            self.toastView.alpha = 0
        }
    }
    
    func delay(_ delay:Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
}


// Theme Change Example

/*
 if #available(iOS 13.0, *) {
     (self.view.window?.windowScene?.delegate as! SceneDelegate).setDarkTheme()
 }
 
 
 
 let toastView: UIView = {
     let view = UIView()
     view.backgroundColor = UIColor(hex: ColorPalette.blackMain, alpha: 1.0)
     view.layer.cornerRadius = 4
     view.alpha = 0
     return view
 }()
 
 let toastLabel: UILabel = {
     let label = UILabel()
     label.textColor = .white
     label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
     label.textAlignment = .center
     label.numberOfLines = 3
     return label
 }()
 
 override func viewDidLoad() {
     super.viewDidLoad()
     // 영역 밖 클릭시 키보드 숨기기
     self.hideKeyboardWhenTappedAround()
     
     // Toast View, Label 추가
     self.view.addSubview(self.toastView)
     self.toastView.snp.makeConstraints { make in
         make.left.right.equalToSuperview().inset(24)
         make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-80)
         make.height.equalTo(40)
     }
     self.toastView.addSubview(self.toastLabel)
     self.toastLabel.snp.makeConstraints { make in
         make.left.right.equalToSuperview()
         make.centerY.equalToSuperview()
     }
 }
 
 func showIndicator() {
     CustomIndicatorView.shared.show()
 }
 
 func dismissIndicator() {
     CustomIndicatorView.shared.dismiss()
 }
 
 func showToast(text: String) {
     self.toastLabel.text = text
     self.toastView.alpha = 1.0
     UIView.animate(withDuration: 3.5) {
         self.toastView.alpha = 0
     }
 }
 */
