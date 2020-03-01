//
//  TestVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/29.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class TestVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
        self.navigationController?.navigationBar.topItem?.title = ""
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    static var makeTest: TestVC {
        get {
            let vc = TestVC()
            return vc
        }
    }
}
