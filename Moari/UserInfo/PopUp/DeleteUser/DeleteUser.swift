//
//  DeleteUser.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class DeleteUser: BaseVC {
    
    @IBOutlet weak var deleteUserPopUpView: UIView!
    @IBOutlet weak var deleteUserPopUpTitleLabel: UILabel!
    @IBOutlet weak var deleteUserDoneButton: UIButton!
    @IBOutlet weak var deleteUserCancelButton: UIButton!
    
    weak var delegate: DeleteUserPopUpDelegate?
    weak var userInfoActor: UserInfoPopUpActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.deleteUserPopUpView.layer.cornerRadius = 3
        self.initTapListener()
    }
}
extension DeleteUser {
    func initTapListener() {
        self.deleteUserDoneButton.addTarget(self, action: #selector(self.pressDeleteUserDoneButton(_:)), for: .touchUpInside)
        self.deleteUserCancelButton.addTarget(self, action: #selector(self.pressDeleteUserCancelButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressDeleteUserDoneButton(_ sender: UIButton) {
        let userInfoVC = self.delegate?.getUserInfoVC()
        self.dismiss(animated: true, completion: nil)
        self.userInfoActor?.presentFinalDeleteUserPopUp(fromVC: userInfoVC!)
    }
    
    @objc func pressDeleteUserCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
