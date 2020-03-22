//
//  ImagePick.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/15.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class ImagePick: BaseVC {
    
    @IBOutlet weak var outsideView: UIView!
    @IBOutlet weak var imagePickPopUpView: UIView!
    @IBOutlet weak var imageByLibraryButton: UIButton!
    @IBOutlet weak var imageByCameraButton: UIButton!
    
    weak var delegate: ImagePickDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePickPopUpView.layer.cornerRadius = 3
        self.initTapListener()
    }
}
extension ImagePick {
    func initTapListener() {
        let outsideViewListener: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressOutsideView(_:)))
        self.outsideView.isUserInteractionEnabled = true
        self.outsideView.addGestureRecognizer(outsideViewListener)
        
        self.imageByLibraryButton.addTarget(self, action: #selector(self.pressImageByLibraryButton(_:)), for: .touchUpInside)
        self.imageByCameraButton.addTarget(self, action: #selector(self.pressImageByCameraButton(_:)), for: .touchUpInside)
    }
    
    @objc func pressImageByLibraryButton(_ sender: UIButton) {
        self.delegate?.didTapImageByLibraryButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressImageByCameraButton(_ sender: UIButton) {
        self.delegate?.didTapImageByCameraButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressOutsideView(_ sender: UIView) {
        self.dismiss(animated: true, completion: nil)
    }
}
