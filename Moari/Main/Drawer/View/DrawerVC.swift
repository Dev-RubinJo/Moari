//
//  DrawerVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/28.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import LocalAuthentication

class DrawerVC: UIViewController {
    
    private let authContext = LAContext()
    private let moariInstaAddress = "https://www.instagram.com/moari_review/?hl=ko"
    
    @IBOutlet var drawerBackgroundView: UIView!
    @IBOutlet weak var drawerViewTitleLabel: UILabel!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var editUserView: UIView!
    @IBOutlet weak var editUserLabel: UILabel!
    
    @IBOutlet weak var themeModeView: UIView!
    @IBOutlet weak var themeModeLabel: UILabel!
    
    @IBOutlet weak var securitySettingView: UIView!
    @IBOutlet weak var securitySettingLabel: UILabel!
    @IBOutlet weak var securitySettingSwitch: UISwitch!
    
    @IBOutlet weak var instagramView: UIView!
    @IBOutlet weak var instagramLabel: UILabel!
    
    @IBOutlet weak var menuTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.getBioAuthInfo()
    }
    
    func getBioAuthInfo() {
        if self.authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            switch self.authContext.biometryType {
            case .faceID:
                self.securitySettingLabel.text = "Face ID"
            case .touchID:
                self.securitySettingLabel.text = "Touch ID"
            case .none:
                self.securitySettingView.isHidden = true
            @unknown default:
                break
            }
        }
    }
}
