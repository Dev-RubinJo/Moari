//
//  AddReviewDataManager.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class AddReviewDataManager: AddReviewDataManagerDelegate {
    
    static let shared = AddReviewDataManager()
    private init() {}
    
    weak var actor: AddReviewActorDelegate?
}
