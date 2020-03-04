//
//  CurationCell.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CurationCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var reviewTitleLabel: UILabel!
    @IBOutlet weak var reviewStarRateImageView: UIImageView!
    @IBOutlet weak var reviewSimpleContentLabel: UILabel!
    @IBOutlet weak var reviewContentLabel: UITextView!
    
    @IBOutlet weak var curationCellTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
