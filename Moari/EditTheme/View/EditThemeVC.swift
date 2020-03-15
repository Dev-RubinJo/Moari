//
//  EditThemeVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class EditThemeVC: BaseVC, EditThemeVCProtocol {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var editThemeVCTitleLabel: UILabel!
    
    @IBOutlet weak var usingDeviceConfigLabel: UILabel!
    @IBOutlet weak var usingDeviceConfigSwitch: UISwitch!
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBOutlet weak var lightModeLabel: UILabel!
    @IBOutlet weak var lightModeSwitch: UISwitch!
    
    weak var actor: EditThemeActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setEditThemeVCUI()
        self.initTapListener()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
}
// Set UI
extension EditThemeVC {
    func setEditThemeVCUI() {
        let theme = UserDefaults.standard.integer(forKey: "Theme")
        switch theme {
        case 0:
            self.usingDeviceConfigSwitch.isOn = false
            self.darkModeSwitch.isOn = false
            self.lightModeSwitch.isOn = true
            break
        case 1:
            self.usingDeviceConfigSwitch.isOn = false
            self.darkModeSwitch.isOn = true
            self.lightModeSwitch.isOn = false
            break
        case 2:
            self.usingDeviceConfigSwitch.isOn = true
            self.darkModeSwitch.isOn = false
            self.lightModeSwitch.isOn = false
            break
        default:
            self.usingDeviceConfigSwitch.isOn = true
            self.darkModeSwitch.isOn = false
            self.lightModeSwitch.isOn = false
            break
        }
    }
    
    func initTapListener() {
        self.dismissButton.addTarget(self, action: #selector(self.pressDismissButton(_:)), for: .touchUpInside)
        self.usingDeviceConfigSwitch.addTarget(self, action: #selector(self.setSystemThemeSwitch(_:)), for: .touchUpInside)
        self.darkModeSwitch.addTarget(self, action: #selector(self.setDarkThemeSwitch(_:)), for: .touchUpInside)
        self.lightModeSwitch.addTarget(self, action: #selector(self.setLightThemeSwitch(_:)), for: .touchUpInside)
    }
    
    @objc func pressDismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func setSystemThemeSwitch(_ sender: UISwitch) {
        UserDefaults.standard.set(2, forKey: "Theme")
        if self.darkModeSwitch.isOn || self.lightModeSwitch.isOn {
            self.darkModeSwitch.isOn = false
            self.lightModeSwitch.isOn = false
        }
        if #available(iOS 13.0, *) {
            (self.view.window?.windowScene?.delegate as! SceneDelegate).setSystemTheme()
        }
        
    }
    @objc func setLightThemeSwitch(_ sender: UISwitch) {
        UserDefaults.standard.set(0, forKey: "Theme")
        if self.darkModeSwitch.isOn || self.usingDeviceConfigSwitch.isOn {
            self.darkModeSwitch.isOn = false
            self.usingDeviceConfigSwitch.isOn = false
        }
        if #available(iOS 13.0, *) {
            (self.view.window?.windowScene?.delegate as! SceneDelegate).setLightTheme()
        }
    }
    @objc func setDarkThemeSwitch(_ sender: UISwitch) {
        UserDefaults.standard.set(1, forKey: "Theme")
        if self.usingDeviceConfigSwitch.isOn || self.lightModeSwitch.isOn {
            self.usingDeviceConfigSwitch.isOn = false
            self.lightModeSwitch.isOn = false
        }
        if #available(iOS 13.0, *) {
            (self.view.window?.windowScene?.delegate as! SceneDelegate).setDarkTheme()
        }
    }
}
