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
    
    func didTapCheckForRegisteredEmailButton(fromVC vc: FindEmailPasswordVC)
    
    func didTapSendTemporaryPasswordButton(fromVC vc: FindEmailPasswordVC)
    
    func notRegisteredEmail(updateVC vc: FindEmailPasswordVC)
    
    func registeredEmail(updateVC vc: FindEmailPasswordVC)
    
    func sendTemporaryPassword(updateVC vc: FindEmailPasswordVC)
}

protocol FindEmailPasswordAlertActorDelegate: class {
    
    func presentInvalidEmailAlert(toVC vc: FindEmailPasswordVC)
}

protocol FindEmailPasswordDataManagerDelegate: class {
    
    var actor: (FindEmailPasswordActorDelegate & FindEmailPasswordAlertActorDelegate)? { get set }
    
    func checkEmail(fromVC vc: FindEmailPasswordVC, email: String)
    
    func sendTemporaryPassword(email: String)
}
