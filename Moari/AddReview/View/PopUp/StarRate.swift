//
//  StarRate.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/08.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class StarRate: BaseVC {
    
    @IBOutlet weak var outsideView: UIView!
    @IBOutlet weak var starRatePopUpView: UIView!
    @IBOutlet weak var starRatePopUpTitleLabel: UILabel!
    @IBOutlet weak var starRateCosmosView: CosmosView!
    
    @IBOutlet weak var starRateCancelButton: UIButton!
    @IBOutlet weak var starRateDoneButton: UIButton!
    
    weak var delegate: StarRatePopUpDelegate?
    
    var value: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: starRatePopUpTitleLabel에 다국어 지원, 및 버튼들에 다국어 지원
        // TODO: 각 탭 제스쳐 넣기
        self.starRatePopUpView.layer.cornerRadius = 3
        self.initTapListener()
        self.starRateCosmosView.rating = self.value
        self.starRateCosmosView.settings.fillMode = .half
        self.starRateCosmosView.didTouchCosmos = { rate in
            self.value = rate
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self.value)
        self.starRateCosmosView.rating = self.value
//        self.starRateCosmosView.
    }
    
    
    func initTapListener() {
        let outsideViewListener: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressOutsideView(_:)))
        self.outsideView.isUserInteractionEnabled = true
        self.outsideView.addGestureRecognizer(outsideViewListener)
        
        self.starRateCancelButton.addTarget(self, action: #selector(self.pressCancelButton(_:)), for: .touchUpInside)
        self.starRateDoneButton.addTarget(self, action: #selector(self.pressDoneButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressOutsideView(_ sender: UIView) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressDoneButton(_ sender: UIButton) {
        self.delegate?.didTapDoneButton(self.value)
        self.dismiss(animated: true, completion: nil)
    }
}
