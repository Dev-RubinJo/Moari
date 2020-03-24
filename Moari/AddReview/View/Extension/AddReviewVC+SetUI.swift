//
//  AddReviewVC+SetUI.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/07.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

// AddReviewVC SetUI extension
extension AddReviewVC {
    func setAddReviewVCUI() {
        self.navigationController?.navigationBar.barTintColor = .systemWBColor
        // TODO: 작성하기 다국어 지원으로 변경하기
        self.navigationItem.title = "작성하기"
        
        self.appendReviewButton = UIBarButtonItem(image: UIImage(named: "appendReview"), style: .plain, target: self, action: #selector(self.pressAppendReviewButton(_:)))
        self.closeReviewButton = UIBarButtonItem(image: UIImage(named: "closeButtonDefault"), style: .plain, target: self, action: #selector(self.pressCloseReviewButton(_:)))
        
        if let category = self.categoryId, let review = self.reviewId {
            self.actor?.didLoadReview(updateVC: self, categoryId: category, reviewId: review)
            
        }
        
        self.shareReviewButton.setImage(UIImage(named: "shareIc"), for: .normal)
        self.editReviewButton.setImage(UIImage(named: "editReview"), for: .normal)
        self.deleteReviewButton.setImage(UIImage(named: "deleteReview"), for: .normal)
        
        self.backgroundImageView.image = UIImage(named: "defaultImage")
        
        
        self.datePicker = UIDatePicker()
        self.datePicker.datePickerMode = .date
        
        self.showDatePicker()
        
        if let isAdd = self.isAdd {
            if isAdd {
                self.reviewTitleBorderImageView.isHidden = false
                self.starRateBorderImageView.isHidden = false
                self.reviewContentBorderImageView.isHidden = false
                self.shareReviewButton.isHidden = true
                self.editReviewButton.isHidden = true
                self.deleteReviewButton.isHidden = true
                self.editImageButton.isHidden = false
                self.selectDateTextField.isUserInteractionEnabled = true
                self.contentViewPlaceholderLabel.isHidden = false
                
                // TODO: 다국어 지원하기
                self.selectDateTextField.text = "날짜"
                self.selectDateTextField.textColor = .defaultPink
                self.navigationItem.leftBarButtonItem = self.closeReviewButton
                self.navigationItem.rightBarButtonItem = self.appendReviewButton
                self.setUpScrollView()
            } else {
                self.navigationItem.title = ""
                
                self.reviewTitleBorderImageView.isHidden = true
                self.reviewTitlePlaceholderLabel.isHidden = true
                self.starRateBorderImageView.isHidden = true
                self.starRateView.isUserInteractionEnabled = false
                self.reviewContentBorderImageView.isHidden = true
                self.reviewContentPlaceholderLabel.isHidden = true
                self.shareReviewButton.isHidden = false
                self.editReviewButton.isHidden = false
                self.deleteReviewButton.isHidden = true
                self.editImageButton.isHidden = true
                self.selectDateTextField.isUserInteractionEnabled = false
                self.reviewTitleTextView.isEditable = false
                self.reviewContentTextView.isEditable = false
                self.contentTextView.isEditable = false
                self.contentViewPlaceholderLabel.isHidden = true
                
                
                self.selectDateTextField.textColor = .signInBottomLabels
                
            }
        }
    }
    
    @objc func pressAppendReviewButton(_ sender: UIBarButtonItem) {
        // TODO: 리뷰 작성완료 기능 넣기
        if self.isEdit {
            if let id = self.review?.reviewId {
                self.actor?.editReview(fromVC: self, reviewId: id)
            }
        } else {
            if let categoryId = self.categoryId {
                self.starRateView.isUserInteractionEnabled = false
                self.actor?.addReview(fromVC: self, categoryId: categoryId)
            }
        }
    }
    
    @objc func pressCloseReviewButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - set ScrollView
    func setUpScrollView() {
        // TODO: 기종별로 최적화 된 사이즈 지정하기
        self.resizeContentTextView()
        self.contentView.snp.makeConstraints { make in
            make.height.equalTo(self.baseHeight + self.contentTextViewHeight.height)
        }
    }
    
    func updateScrollView(heightValue value: CGFloat) {
        self.contentView.snp.updateConstraints { make in
            make.height.equalTo(value)
        }
    }
    
    
    
    // MARK: - set Picker
    func showDatePicker(){
        //Formate Date
        self.datePicker.datePickerMode = .date
        self.selectDateTextField.tintColor = .clear
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelDatePicker));
        toolbar.tintColor = .systemWBColor
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        self.selectDateTextField.inputAccessoryView = toolbar
        self.selectDateTextField.inputView = self.datePicker
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        self.selectDateTextField.text = formatter.string(from: self.datePicker.date)
        self.selectDateTextField.endEditing(true)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}
// TapListener
extension AddReviewVC {
    func initTapListener() {
        self.editImageButton.addTarget(self, action: #selector(self.pressEditImageButton(_:)), for: .touchUpInside)
        
        let starRateImageViewListener: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.pressStarRateImageView(_:)))
        self.starRateImageView.isUserInteractionEnabled = true
        self.starRateImageView.addGestureRecognizer(starRateImageViewListener)
        
        self.selectCategoryButton.addTarget(self, action: #selector(self.pressSelectCategoryButton(_:)), for: .touchUpInside)
        self.editReviewButton.addTarget(self, action: #selector(self.pressEditReviewButton(_:)), for: .touchUpInside)
        self.shareReviewButton.addTarget(self, action: #selector(self.pressShareReviewButton(_:)), for: .touchUpInside)
        self.deleteReviewButton.addTarget(self, action: #selector(self.pressDeleteReviewButton(_:)), for: .touchUpInside)
    }
    
    // 이미지 피커 컨트롤러 필요(크롭기능 적용)
    @objc func pressEditImageButton(_ sender: UIButton) {
        let imagePickPopUpStoryboard = UIStoryboard(name: "ImagePick", bundle: nil)
        guard let imagePickPopUpView = imagePickPopUpStoryboard.instantiateViewController(withIdentifier: "ImagePick") as? ImagePick else { return }
        imagePickPopUpView.modalPresentationStyle = .custom
        imagePickPopUpView.modalTransitionStyle = .crossDissolve
        imagePickPopUpView.delegate = self
        
        self.present(imagePickPopUpView, animated: true, completion: nil)
    }
    
    @objc func pressStarRateImageView(_ sender: UIImageView) {
        // TODO: 여기서 띄워주는 행위 엑터로 옯기기
        let starRatePopUpStoryboard = UIStoryboard(name: "StarRate", bundle: nil)
        guard let starRatePopUpView = starRatePopUpStoryboard.instantiateViewController(withIdentifier: "StarRate") as? StarRate else { return }
        starRatePopUpView.delegate = self
        starRatePopUpView.modalPresentationStyle = .custom
        starRatePopUpView.modalTransitionStyle = .crossDissolve
        starRatePopUpView.value = self.starRateValue
        self.present(starRatePopUpView, animated: true, completion: nil)
    }
    
    @objc func pressSelectCategoryButton(_ sender: UIButton) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        guard let categoryList = self.actor?.categoryList else { return }
        for category in categoryList {
            let action = UIAlertAction(title: "\(category.categoryName)", style: .default) { _ in
                self.categoryId = category.categoryId
                DispatchQueue.main.async {
                    self.selectCategoryButton.setTitle("\(category.categoryName)", for: .normal)
                }
            }
            optionMenu.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
        })
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @objc func pressEditReviewButton(_ sender: UIButton) {
        self.isEdit = true
        self.navigationItem.rightBarButtonItem = self.appendReviewButton
        
        self.reviewTitleBorderImageView.isHidden = false
        self.reviewTitlePlaceholderLabel.isHidden = true
        self.starRateBorderImageView.isHidden = false
        self.starRateView.isUserInteractionEnabled = true
        self.reviewContentBorderImageView.isHidden = false
        self.reviewContentPlaceholderLabel.isHidden = true
        self.shareReviewButton.isHidden = true
        self.editReviewButton.isHidden = true
        self.deleteReviewButton.isHidden = false
        self.editImageButton.isHidden = false
        self.reviewTitleTextView.isEditable = true
        self.reviewContentTextView.isEditable = true
        self.contentTextView.isEditable = true
    }
    
    @objc func pressShareReviewButton(_ sender: UIButton) {
        let image = UIView.makeImage(with: self.shareImageBaseView)
        let shareViewController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(shareViewController, animated: true, completion: nil)
    }
    
    @objc func pressDeleteReviewButton(_ sender: UIButton) {
        let deleteAction: UIAlertAction = UIAlertAction(title: "삭제", style: .default) { _ in
            guard let id = self.reviewId else { return }
            self.actor?.deleteReview(fromVC: self, reviewId: id)
        }
        self.presentAlertWithAction(title: "삭제하기", message: "정말로 리뷰를 삭제하실껀가요?", deleteAction)
    }
}

extension AddReviewVC: StarRatePopUpDelegate {
    func didTapDoneButton(_ value: Double) {
        self.starRateValue = value
        self.actor?.updateStarRateImageView(updateVC: self, value: value)
    }
}

// Camera, Library
extension AddReviewVC: ImagePickDelegate {
    func openLibrary(){
        self.picker.sourceType = .photoLibrary
        self.picker.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(self.picker, animated: false, completion: nil)
        }
    }
    
    func openCamera(){
        self.picker.sourceType = .camera
        self.picker.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(self.picker, animated: false, completion: nil)
        }
    }
    
    func didTapImageByLibraryButton() {
        self.openLibrary()
    }
    
    func didTapImageByCameraButton() {
        self.openCamera()
    }
}

import Mantis
extension AddReviewVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        picker.dismiss(animated: true, completion: nil)
        
        let cropImageController = Mantis.cropViewController(image: image)
        cropImageController.modalPresentationStyle = .fullScreen
        cropImageController.delegate = self
        self.present(cropImageController, animated: true, completion: nil)
    }
    
    func cropViewControllerDidCrop(_ cropViewController: CropViewController, cropped: UIImage, transformation: Transformation) {
        self.backgroundImageView.image = cropped
    }
}
