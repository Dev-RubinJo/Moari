//
//  UsingGuideView.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/29.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class UsingGuideView: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var tutorialCollectionView: UICollectionView!
    @IBOutlet weak var startMoariButton: UIButton!
    
    var guideImageList: [UIImage?] = [
        UIImage(named: "Guide1"),
        UIImage(named: "Guide2"),
        UIImage(named: "Guide3"),
        UIImage(named: "Guide4"),
        UIImage(named: "Guide5"),
        UIImage(named: "Guide6")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ShowTutorial") {
            self.dismissButton.isHidden = true
        }
        
        // TutorialCell
        
        let tutorialCellNib = UINib(nibName: "TutorialCell", bundle: nil)
        self.tutorialCollectionView.register(tutorialCellNib, forCellWithReuseIdentifier: "TutorialCell")
        
        self.tutorialCollectionView.delegate = self
        self.tutorialCollectionView.dataSource = self
        
        self.dismissButton.addTarget(self, action: #selector(self.didTapDismissButton), for: .touchUpInside)
        self.startMoariButton.addTarget(self, action: #selector(self.didTapDismissButton), for: .touchUpInside)
        self.startMoariButton.layer.cornerRadius = 3
    }
    
    @objc func didTapDismissButton() {
        UserDefaults.standard.set(false, forKey: "ShowTutorial")
        self.dismiss(animated: true, completion: nil)
    }
}
extension UsingGuideView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.guideImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCell", for: indexPath) as? TutorialCell else {
            return UICollectionViewCell()
        }
        
        cell.tutorialImageView.image = self.guideImageList[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == 5 {
            UIView.animate(withDuration: 0.3) {
                self.startMoariButton.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
//        else {
//            self.startMoariButton.alpha = 0
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var screenSize = UIScreen.main.bounds.size
        //        screenSize.height = screenSize.height - (self.navigationController?.navigationBar.bounds.height)!
        //        var screenSize = CGSize()
        //        screenSize.height = self.curationCollectionView.bounds.height
        //        screenSize.width = self.curationCollectionView.bounds.width
        
        return screenSize
    }
}
