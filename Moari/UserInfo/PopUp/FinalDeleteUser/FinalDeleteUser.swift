//
//  FinalDeleteUser.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/21.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class FinalDeleteUser: BaseVC {
    
    @IBOutlet weak var finalDeleteUserPopUpView: UIView!
    @IBOutlet weak var finalDeleteUserPopUpTitleLabel: UILabel!
    @IBOutlet weak var finalDeleteUserDoneButton: UIButton!
    @IBOutlet weak var finalDeleteUserCancelButton: UIButton!
    
    weak var delegate: FinalDeleteUserPopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.finalDeleteUserPopUpView.layer.cornerRadius = 3
        self.initTapListener()
    }
}
extension FinalDeleteUser {
    func initTapListener() {
        self.finalDeleteUserDoneButton.addTarget(self, action: #selector(self.pressFinalDeleteUserDoneButton(_:)), for: .touchUpInside)
        self.finalDeleteUserCancelButton.addTarget(self, action: #selector(self.pressFinalDeleteUserCancelButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressFinalDeleteUserDoneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.didTapFinalDeleteUserDoneButton()
//        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func pressFinalDeleteUserCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
