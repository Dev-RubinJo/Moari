//
//  SearchVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/14.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import Kingfisher

class SearchVC: BaseVC, SearchVCProtocol {
    
    @IBOutlet weak var dismissSearchVCButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var clearTextFieldButton: UIButton!
    @IBOutlet weak var reviewResultCollectionView: UICollectionView!
    
    var actor: SearchActorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTapListener()
        self.searchTextField.delegate = self
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let categoryDetailCellNib = UINib(nibName: "CategoryDetailCell", bundle: nil)
        self.reviewResultCollectionView.register(categoryDetailCellNib, forCellWithReuseIdentifier: "CategoryDetailCell")
        
        self.reviewResultCollectionView.delegate = self
        self.reviewResultCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        let theme = UserDefaults.standard.integer(forKey: "Theme")
        switch theme {
        case 0:
            UIApplication.shared.statusBarStyle = .default
        case 1:
            UIApplication.shared.statusBarStyle = .lightContent
        case 2:
            UIApplication.shared.statusBarStyle = .default
        default:
            UIApplication.shared.statusBarStyle = .default
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension SearchVC {
    func initTapListener() {
        self.dismissSearchVCButton.addTarget(self, action: #selector(self.dismissSearchVC), for: .touchUpInside)
        self.clearTextFieldButton.addTarget(self, action: #selector(self.pressClearTextFieldButton(_:)), for: .touchUpInside)
    }
    
    @objc func dismissSearchVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pressClearTextFieldButton(_ sender: UIButton) {
        self.searchTextField.text = ""
    }
}
extension SearchVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            self.actor?.searchReviewList(fromVC: self, keyWord: self.searchTextField.text!)
            print("*")
        }
        
        return true
    }
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.actor?.reviewList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryDetailCell", for: indexPath) as? CategoryDetailCell else {
            return UICollectionViewCell()
        }
        
        if let review = self.actor?.reviewList[indexPath.item] {
            let url = URL(string: "\(review.imageUrl ?? "")")
            cell.backgroundImageView.kf.setImage(with: url)
            cell.reviewTitleLabel.text = review.title
            self.actor?.updateStarRateImageView(updateCell: cell, value: review.starRate)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let id = self.actor?.reviewList[indexPath.item].reviewCategory, let reviewId = self.actor?.reviewList[indexPath.item].reviewId {
            self.actor?.didTapReviewCell(reviewCategory: id, reviewId: reviewId)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if self.actor?.reviewList.count == indexPath.item + 1 {
            self.actor?.searchReviewListMore(fromVC: self, keyWord: self.searchTextField.text!, itemCount: indexPath.item + 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.isIphone {
        case .iPhone:
            switch UIScreen.main.nativeBounds.height {
            case 1136: // se
                //272
                // cell size is 90.6
                return CGSize(width: 160, height: 160)
            case 1334, 2436: // 6, 7, 8 X, 11pro
                // 327
                // cell size is 109
                return CGSize(width: 187.5, height: 187.5)
            default:
                // 366 // 6+7+8+ xr 11 11promax
                // cell size is 122
                return CGSize(width: 207, height: 207)
            }
        case .iPad:
            // TODO: 아이패드 레이아웃 넣기
            break
        }
        return CGSize()
    }
}
