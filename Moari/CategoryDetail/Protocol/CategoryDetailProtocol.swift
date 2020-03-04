//
//  CategoryDetailProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol CategoryDetailVCProtocol: BaseVCProtocol {
    
    var actor: CategoryDetailActorDelegate? { get set }
}

protocol CategoryDetailVCRouterDelegate: class {
    
    static var makeCategoryDetailVC: CategoryDetailVC { get }
}

protocol CategoryDetailActorDelegate: class {
    
    var view: CategoryDetailVCRouterDelegate? { get set }
    
    var dataManager: CategoryDetailDataManagerDelegate? { get set }
}

protocol CategoryDetailDataManagerDelegate: class {
    
    var actor: CategoryDetailActorDelegate? { get set }
}
