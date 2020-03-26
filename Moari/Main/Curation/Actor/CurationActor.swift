//
//  CurationActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/27.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CurationActor: CurationActorDelegate {
    
    weak var view: CurationVCRouterDelegate?
    var dataManager: CurationDataManagerDelegate?
    
    private var _curationList: [Curation] = []
    
    var curationList: [Curation] {
        get {
            self._curationList
        }
    }
    
    func didLoadCuration(fromVC vc: CurationVC) {
        self.dataManager?.loadCuration(toVC: vc)
    }
    
    func setCurationList(curation: Curation) {
        self._curationList.append(curation)
    }
    
    func removeAllCurationList() {
        self._curationList.removeAll()
    }
    
    func updateStarRateImageView(updateCell cell: CurationCell, value: Double) {
        switch value {
        case 0.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate0")
        case 0.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate1")
        case 1.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate2")
        case 1.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate3")
        case 2.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate4")
        case 2.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate5")
        case 3.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate6")
        case 3.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate7")
        case 4.0:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate8")
        case 4.5:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate9")
        default:
            cell.reviewStarRateImageView.image = UIImage(named: "starRate10")
        }
    }
    
    func setTextViewLineSpacing(_ textView: UITextView, lineSpace: CGFloat, fontSize: CGFloat, color: UIColor, textAlignment: NSTextAlignment) {
        let attrString = NSMutableAttributedString(string: textView.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        attrString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: fontSize)!, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(.foregroundColor, value: color, range: NSMakeRange(0, attrString.length))
        textView.attributedText = attrString
        textView.textAlignment = textAlignment
    }
    
    func setLabelLineSpacing(_ label: UILabel, lineSpace: CGFloat, fontSize: CGFloat, color: UIColor, textAlignment: NSTextAlignment) {
        let attrString = NSMutableAttributedString(string: label.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        attrString.addAttribute(.font, value: UIFont(name: "AppleSDGothicNeo-UltraLight", size: fontSize)!, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(.foregroundColor, value: color, range: NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        label.textAlignment = textAlignment
    }
}
