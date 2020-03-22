//
//  DeleteReview.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/16.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class DeleteReview: BaseVC {
    
    @IBOutlet weak var deleteReviewPopUpView: UIView!
    @IBOutlet weak var deleteReviewPopUpLabel: UILabel!
    @IBOutlet weak var deleteReviewPopUpDoneButton: UIButton!
    @IBOutlet weak var deleteReviewPopUpCancelButton: UIButton!
    
    weak var delegate: DeleteReviewDelegate?
    
    var reviewId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTapListener()
        self.deleteReviewPopUpView.layer.cornerRadius = 3
    }
}
extension DeleteReview {
    func initTapListener() {
        self.deleteReviewPopUpDoneButton.addTarget(self, action: #selector(self.pressDeleteReviewPopUpDoneButton(_:)), for: .touchUpInside)
        self.deleteReviewPopUpCancelButton.addTarget(self, action: #selector(self.pressDeleteReviewPopUpCancelButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressDeleteReviewPopUpDoneButton(_ sender: UIButton) {
        self.delegate?.didTapDeletePopUpDoneButton(reviewId: self.reviewId)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressDeleteReviewPopUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
