//
//  SignOut.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class SignOut: BaseVC {
    
    @IBOutlet weak var signOutPopUpView: UIView!
    @IBOutlet weak var signOutPopUpTitleLabel: UILabel!
    @IBOutlet weak var signOutDoneButton: UIButton!
    @IBOutlet weak var signOutCancelButton: UIButton!
    
    weak var delegate: SignOutPopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signOutPopUpView.layer.cornerRadius = 3
        self.initTapListener()
    }
}
extension SignOut {
    func initTapListener() {
        self.signOutDoneButton.addTarget(self, action: #selector(self.pressSignOutDoneButton(_:)), for: .touchUpInside)
        self.signOutCancelButton.addTarget(self, action: #selector(self.pressSignOutCancelButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressSignOutDoneButton(_ sender: UIButton) {
        self.delegate?.didTapSignOutDoneButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressSignOutCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
