//
//  DeleteReviewDelegate.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/16.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol DeleteReviewDelegate: class {
    
    func didTapDeletePopUpDoneButton(reviewId id: Int, reviewImageUrl: String)
}
