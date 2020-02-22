//
//  FindEmailPasswordProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

protocol FindEmailPasswordVCProtocol: BaseVCProtocol {
    
    var actor: FindEmailPasswordActorDelegate? { get set }
}

protocol FindEmailPasswordVCRouterDelegate: class {
    
    static var makeFindEmailPasswordVC: FindEmailPasswordVC { get }
}

protocol FindEmailPasswordActorDelegate: class {
    
    var view: FindEmailPasswordVCRouterDelegate? { get set }
    
    var dataManager: FindEmailPasswordDataManagerDelegate? { get set }
}

protocol FindEmailPasswordDataManagerDelegate: class {
    
    var actor: (FindEmailPasswordActorDelegate)? { get set }
}
