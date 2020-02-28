//
//  CategoryProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol CategoryVCProtocol: BaseVCProtocol {
    
    var actor: CategoryActorDelegate? { get set }
}

protocol CategoryVCRouterDelegate: class {
    
    static var makeCategoryVC: CategoryVC { get }
}

protocol CategoryActorDelegate: class {
    
    var view: CategoryVCRouterDelegate? { get set }
    
    var dataManager: CategoryDataManagerDelegate? { get set }
}

protocol CategoryDataManagerDelegate: class {
    
    var actor: CategoryActorDelegate? { get set }
}
