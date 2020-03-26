//
//  CurationProtocol.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

protocol CurationVCProtocol: BaseVCProtocol {
    
    var actor: CurationActorDelegate? { get set }
}

protocol CurationVCRouterDelegate: class {
    
    static var makeCurationVC: CurationVC { get }
}

protocol CurationActorDelegate: class {
    
    var view: CurationVCRouterDelegate? { get set }
    
    var dataManager: CurationDataManagerDelegate? { get set }
    
    var curationList: [Curation] { get }
    
    func didLoadCuration(fromVC vc: CurationVC)
    
    func setCurationList(curation: Curation)
    
    func removeAllCurationList()
    
     func updateStarRateImageView(updateCell cell: CurationCell, value: Double)
    
    func setTextViewLineSpacing(_ textView: UITextView, lineSpace: CGFloat, fontSize: CGFloat, color: UIColor, textAlignment: NSTextAlignment)
    
     func setLabelLineSpacing(_ label: UILabel, lineSpace: CGFloat, fontSize: CGFloat, color: UIColor, textAlignment: NSTextAlignment)
}

protocol CurationDataManagerDelegate: class {
    
    var actor: CurationActorDelegate? { get set }
    
    func loadCuration(toVC vc: CurationVC)
}
