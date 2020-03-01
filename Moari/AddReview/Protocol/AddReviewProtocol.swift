//
//  AddReviewProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol AddReviewVCProtocol: BaseVCProtocol {
    
    var actor: AddReviewActorDelegate? { get set }
}

protocol AddReviewVCRouterDelegate: class {
    
    static var makeAddReviewVC: AddReviewVC { get }
}

protocol AddReviewActorDelegate: class {
    
    var view: AddReviewVCRouterDelegate? { get set }
    
    var dataManager: AddReviewDataManagerDelegate? { get set }
}

protocol AddReviewDataManagerDelegate: class {
    var actor: AddReviewActorDelegate? { get set }
}
