//
//  CategoryDetailVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

class CategoryDetailVC: BaseVC, CategoryDetailVCProtocol {
    
    /// 선택한 카테고리에 대한 리뷰 리스트를 띄워주는 콜렉션 뷰
    @IBOutlet weak var categoryDetailCollectionView: UICollectionView!
    
    var actor: CategoryDetailActorDelegate?
    var category: Category?
    var isLoad: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = .default
        
        self.categoryDetailCollectionView.delegate = self
        self.categoryDetailCollectionView.dataSource = self
        
        let categoryDetailCellNib = UINib(nibName: "CategoryDetailCell", bundle: nil)
        self.categoryDetailCollectionView.register(categoryDetailCellNib, forCellWithReuseIdentifier: "CategoryDetailCell")
        self.setCategoryDetailVCUI()
        self.initTapListener()
        self.actor?.didLoadCategoryDetailList(fromVC: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let theme = UserDefaults.standard.integer(forKey: "Theme")
        switch theme {
        case 0:
            if #available(iOS 13.0, *) {
                UIApplication.shared.statusBarStyle = .darkContent
            } else {
                UIApplication.shared.statusBarStyle = .default
            }
            break
        case 1:
            UIApplication.shared.statusBarStyle = .lightContent
            break
        case 2:
            UIApplication.shared.statusBarStyle = .default
            break
        default:
            UIApplication.shared.statusBarStyle = .default
            break
        }
        if self.isLoad {
            self.actor?.didLoadCategoryDetailList(fromVC: self)
        }
        guard let title = self.category?.categoryName else { return }
        self.navigationItem.title = "\(title)"
    }
}
extension CategoryDetailVC {
    
    func setCategoryDetailVCUI() {
        let addReviewButton = UIBarButtonItem(image: UIImage(named: "addReview"), style: .plain, target: self, action: #selector(self.pressAddReviewButton(_:)))

        self.navigationItem.rightBarButtonItem = addReviewButton
        
        
    }
    
    func initTapListener() {
        let deleteLongPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressGestureForDeleteReviewPopUp(_:)))
        deleteLongPressGesture.minimumPressDuration = 0.5
        self.categoryDetailCollectionView.addGestureRecognizer(deleteLongPressGesture)
    }
    
    @objc func pressAddReviewButton(_ sender: UIBarButtonItem) {
        self.actor?.didTapAddReviewButton(fromVC: self)
    }
    
    // MARK: long press Gesture
    @objc func longPressGestureForDeleteReviewPopUp(_ gesture: UIGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = self.categoryDetailCollectionView.indexPathForItem(at: gesture.location(in: self.categoryDetailCollectionView)) else { return }
            
            guard let reviewId = self.actor?.reviewList[selectedIndexPath.item].reviewId,
                let reviewImageUrl = self.actor?.reviewList[selectedIndexPath.item].imageUrl else { return }
            self.actor?.presentDeleteReviewPopUp(fromVC: self, reviewId: reviewId, reviewImageUrl: reviewImageUrl)
            
        case .ended:
            fallthrough
        default:
            self.categoryDetailCollectionView.reloadData()
        }
    }
}


extension CategoryDetailVC: DeleteReviewDelegate {
    
    func didTapDeletePopUpDoneButton(reviewId id: Int, reviewImageUrl: String) {
        self.actor?.deleteReviewAction(fromVC: self, reviewId: id, reviewImageUrl: reviewImageUrl)
    }
}
    