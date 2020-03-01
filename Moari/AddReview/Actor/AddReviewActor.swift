//
//  AddReviewActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class AddReviewActor: AddReviewActorDelegate {
    
    static let shared = AddReviewActor()
    private init() {}
    
    weak var view: AddReviewVCRouterDelegate?
    weak var dataManager: AddReviewDataManagerDelegate?
}
