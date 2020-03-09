//
//  DrawerVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import SnapKit
import LocalAuthentication

class DrawerVC: UIViewController {
    
    private let authContext = LAContext()
    private let moariInstaAddress = "https://www.instagram.com/moari_review/?hl=ko"
    
    @IBOutlet var drawerBackgroundView: UIView!
    @IBOutlet weak var drawerViewTitleLabel: UILabel!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var editUserInfoView: UIView!
    @IBOutlet weak var editUserLabel: UILabel!
    
    @IBOutlet weak var themeModeView: UIView!
    @IBOutlet weak var themeModeLabel: UILabel!
    
    @IBOutlet weak var securitySettingView: UIView!
    @IBOutlet weak var securitySettingLabel: UILabel!
    @IBOutlet weak var securitySettingSwitch: UISwitch!
    
    @IBOutlet weak var instagramView: UIView!
    @IBOutlet weak var instagramLabel: UILabel!
    
    @IBOutlet weak var menuTopConstraint: NSLayoutConstraint!
    
    var testName = "루빈"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        self.setDrawerVCUI()
        self.initTapListener()
        
        if #available(iOS 13.0, *) {
            
        } else {
            self.themeModeView.isHidden = true
            self.securitySettingView.snp.makeConstraints { make in
                make.top.equalTo(self.editUserInfoView.snp.bottom).offset(0)
            }
        }
        
        // drawerController 닫는 함수
//        self.drawerController?.closeSide()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.securitySettingSwitch.isOn = UserDefaults.standard.bool(forKey: "AppLockConfig") ?? false
    }
    
    
}

// Set DrawerVC UI Extension
extension DrawerVC {
    func setDrawerVCUI() {
        self.getBioAuthInfo()
        if self.deviceLocale == "ko" {
            let attributedString = NSMutableAttributedString(string: "\(testName)님의\n모아 놓은 리뷰", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 22.0)!,
              .kern: 0.0
            ])
            attributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-Thin", size: 22.0)!, range: NSRange(location: 0, length: testName.count))
            
            self.drawerViewTitleLabel.attributedText = attributedString
        } else if self.deviceLocale == "en" {
            let attributedString = NSMutableAttributedString(string: "\(testName)님의\n모아 놓은 리뷰", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 22.0)!,
              .kern: 0.0
            ])
            attributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 22.0)!, range: NSRange(location: 0, length: testName.count))
            
            self.drawerViewTitleLabel.attributedText = attributedString
        }
    }
    
    func getBioAuthInfo() {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136, 1334, 1920:
                self.securitySettingLabel.text = "Face ID"
            case 2436, 1792, 2688:
                //                print("iPhone XR, XS MAX")
                self.securitySettingLabel.text = "Touch ID"
            default:
                self.securitySettingView.isHidden = true
            }
        }
    }
    
    func initTapListener() {
        let didTapSearchView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressSearchView(_:)))
        self.searchView.isUserInteractionEnabled = true
        self.searchView.addGestureRecognizer(didTapSearchView)
        
        let didTapEditUserInfoView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressEditUserInfoView(_:)))
        self.editUserInfoView.isUserInteractionEnabled = true
        self.editUserInfoView.addGestureRecognizer(didTapEditUserInfoView)
        
        let didTapThemeModeView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressThemeModeView(_:)))
        self.themeModeView.isUserInteractionEnabled = true
        self.themeModeView.addGestureRecognizer(didTapThemeModeView)
        
        self.securitySettingSwitch.addTarget(self, action: #selector(self.setAppLock(_:)), for: .valueChanged)
    }
    
    @objc func pressSearchView(_ sender: UIView) {
        print("search")
        self.drawerController?.closeSide()
    }
    
    @objc func pressEditUserInfoView(_ sender: UIView) {
        print("editUser")
        self.drawerController?.closeSide()
    }
    
    @objc func pressThemeModeView(_ sender: UIView) {
        print("ThemeMode")
        self.drawerController?.closeSide()
    }
    
    @objc func setAppLock(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "AppLockConfig")
        if sender.isOn {
            // TODO: 스위치를 킬때마다 새로 설정할 것인지
            
        } else {
            
        }
    }
}
