//
//  DrawerVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import SnapKit
import SafariServices

class DrawerVC: UIViewController {
    
    private let moariInstaAddress = "https://www.instagram.com/moari_review/?hl=ko"
    
    @IBOutlet var drawerBackgroundView: UIView!
    @IBOutlet weak var drawerViewTitleLabel: UILabel!
    
    @IBOutlet weak var menuViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var editUserInfoView: UIView!
    @IBOutlet weak var editUserLabel: UILabel!
    
    @IBOutlet weak var themeModeView: UIView!
    @IBOutlet weak var themeModeLabel: UILabel!
    
    @IBOutlet weak var usingGuideView: UIView!
    @IBOutlet weak var usingGuideLabel: UILabel!
    
    @IBOutlet weak var securitySettingView: UIView!
    @IBOutlet weak var securitySettingLabel: UILabel!
    @IBOutlet weak var securitySettingSwitch: UISwitch!
    
    @IBOutlet weak var instagramView: UIView!
    @IBOutlet weak var instagramLabel: UILabel!
    
    @IBOutlet weak var menuTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.initTapListener()
        if #available(iOS 13.0, *) {
        } else {
            self.themeModeView.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.securitySettingSwitch.isOn = UserDefaults.standard.bool(forKey: "AppLockConfig")
        self.setDrawerVCUI()
    }
    
    
}

// Set DrawerVC UI Extension
extension DrawerVC {
    func setDrawerVCUI() {
        self.getBioAuthInfo()
        guard let userName = UserDefaults.standard.string(forKey: "NickName") else { return }
        if self.deviceLocale == "ko" {
            let attributedString = NSMutableAttributedString(string: "\(userName)님의\n모아 놓은 리뷰", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 22.0)!,
              .kern: 0.0
            ])
            attributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 22.0)!, range: NSRange(location: 0, length: userName.count))
            
            self.drawerViewTitleLabel.attributedText = attributedString
        } else if self.deviceLocale == "en" {
            let attributedString = NSMutableAttributedString(string: "\(userName)님의\n모아 놓은 리뷰", attributes: [
              .font: UIFont(name: "AppleSDGothicNeo-Thin", size: 22.0)!,
              .kern: 0.0
            ])
            attributedString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: 22.0)!, range: NSRange(location: 0, length: userName.count))
            
            self.drawerViewTitleLabel.attributedText = attributedString
        }
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                self.menuTopConstraint.constant = 50
            case 1334:
                self.menuTopConstraint.constant = 60
            case 1920:
                break
            case 2436, 1792, 2688:
                //                print("iPhone XR, XS MAX")
                fallthrough
            default:
                self.securitySettingView.isHidden = true
            }
        }
    }
    
    func getBioAuthInfo() {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136, 1334, 1920:
                self.securitySettingLabel.text = "Touch ID"
            case 2436, 1792, 2688:
                //                print("iPhone XR, XS MAX")
                self.securitySettingLabel.text = "Face ID"
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
        
        let didTapUsingGuideView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressUsingGuideView(_:)))
        self.usingGuideView.isUserInteractionEnabled = true
        self.usingGuideView.addGestureRecognizer(didTapUsingGuideView)
        
        let didTapThemeModeView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressThemeModeView(_:)))
        self.themeModeView.isUserInteractionEnabled = true
        self.themeModeView.addGestureRecognizer(didTapThemeModeView)
        
        self.securitySettingSwitch.addTarget(self, action: #selector(self.setAppLock(_:)), for: .valueChanged)
        
        let instagramLabelListener: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressMoariInstagramLabel(_:)))
        self.instagramLabel.isUserInteractionEnabled = true
        self.instagramLabel.addGestureRecognizer(instagramLabelListener)
    }
    
    @objc func pressSearchView(_ sender: UIView) {
        let searchRootVC = SearchVC.makeSearchVC
        let searchVC = UINavigationController.init(rootViewController: searchRootVC)
        searchVC.modalPresentationStyle = .fullScreen
        self.present(searchVC, animated: true, completion: nil)
        self.drawerController?.closeSide()
    }
    
    @objc func pressEditUserInfoView(_ sender: UIView) {
        let userInfoVC = UserInfoVC.makeUserInfoVC
        userInfoVC.modalPresentationStyle = .fullScreen
        self.present(userInfoVC, animated: true, completion: nil)
        self.drawerController?.closeSide()
    }
    
    @objc func pressUsingGuideView(_ sender: UIView) {
        let usingGuideView = UsingGuideView()
        usingGuideView.modalPresentationStyle = .fullScreen
        self.present(usingGuideView, animated: true, completion: nil)
        
        self.drawerController?.closeSide()
    }
    
    @objc func pressThemeModeView(_ sender: UIView) {
        let editThemeVC = EditThemeVC.makeEditThemeVC
        editThemeVC.modalPresentationStyle = .fullScreen
        
        self.present(editThemeVC, animated: true, completion: nil)
        self.drawerController?.closeSide()
    }
    
    @objc func setAppLock(_ sender: UISwitch) {
       
        if sender.isOn {
            // TODO: 스위치를 킬때마다 새로 설정할 것인지
            let appLockVC = AppLockVC()
            appLockVC.modalPresentationStyle = .fullScreen
            self.present(appLockVC, animated: true, completion: nil)
        } else {
            UserDefaults.standard.set(false, forKey: "AppLockConfig")
            UserDefaults.standard.set(false, forKey: "NeedAppPassword")
        }
    }
    
    @objc func pressMoariInstagramLabel(_ sender: UILabel) {
        let urlString = "https://www.instagram.com/moari_review/?hl=ko"
        guard let moariUrl = URL(string: urlString) else { return }
        let moariWebVC = SFSafariViewController(url: moariUrl)
        self.present(moariWebVC, animated: true, completion: nil)
        self.drawerController?.closeSide()
    }
}
