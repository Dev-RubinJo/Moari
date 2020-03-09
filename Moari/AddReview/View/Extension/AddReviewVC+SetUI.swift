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
        
        let appendReviewButton = UIBarButtonItem(image: UIImage(named: "appendReview"), style: .plain, target: self, action: #selector(self.pressAppendReviewButton(_:)))
        let closeReviewButton = UIBarButtonItem(image: UIImage(named: "closeButton"), style: .plain, target: self, action: #selector(self.pressCloseReviewButton(_:)))
        
        self.navigationItem.rightBarButtonItem = appendReviewButton
        
        self.shareReviewButton.setImage(UIImage(named: "shareIc"), for: .normal)
        self.editReviewButton.setImage(UIImage(named: "editReview"), for: .normal)
        self.deleteReviewButton.setImage(UIImage(named: "deleteReview"), for: .normal)
        
        
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
                
                // TODO: 다국어 지원하기
                self.selectDateTextField.text = "날짜"
                self.selectDateTextField.textColor = .defaultPink
                self.navigationItem.leftBarButtonItem = closeReviewButton
            } else {
                self.reviewTitleBorderImageView.isHidden = true
                self.starRateBorderImageView.isHidden = true
                self.reviewContentBorderImageView.isHidden = true
                self.shareReviewButton.isHidden = false
                self.editReviewButton.isHidden = false
                self.deleteReviewButton.isHidden = true
                self.editImageButton.isHidden = true
                
                self.selectDateTextField.textColor = .signInBottomLabels
            }
        }
    }
    
    @objc func pressAppendReviewButton(_ sender: UIBarButtonItem) {
        // TODO: 리뷰 작성완료 기능 넣기
        print(1)
    }
    
    @objc func pressCloseReviewButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - set ScrollView
    func setUpScrollView() {
        // TODO: 기종별로 최적화 된 사이즈 지정하기
        self.resizeContentTextView()
//        print(self.baseHeight + self.contentTextViewHeight.height)
        self.contentView.snp.makeConstraints { make in
            make.height.equalTo(self.baseHeight + self.contentTextViewHeight.height)
        }
    }
    
    func updateScrollView(heightValue value: CGFloat) {
        //        self.contentTextViewHeight = self.contentTextView.sizeThatFits(CGSize(width: contentTextView.frame.size.width, height: CGFloat(CGFloat.greatestFiniteMagnitude)))
        self.contentView.snp.updateConstraints { make in
            make.height.equalTo(value + self.contentTextViewHeight.height)
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
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
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
    }
    
    @objc func pressEditImageButton(_ sender: UIButton) {
        
    }
    
    @objc func pressStarRateImageView(_ sender: UIImageView) {
        print(self.starRateValue)
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
        
    }
    
    @objc func pressEditReviewButton(_ sender: UIButton) {
        
    }
    
    @objc func pressShareReviewButton(_ sender: UIButton) {
        
    }
    
    @objc func pressDeleteReviewButton(_ sender: UIButton) {
        
    }
}
extension AddReviewVC: StarRatePopUpDelegate {
    func didTapDoneButton(_ value: Double) {
        self.starRateValue = value
        self.actor?.updateStarRateImageView(updateVC: self, value: value)
    }
}

// 이미지 피커 컨트롤러 필요(크롭기능 적용)
// 카테고리 선택 피커 필요
