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
    
    func setUpScrollView() {
        // TODO: 기종별로 최적화 된 사이즈 지정하기
        self.resizeContentTextView()
//        print(self.contentTextViewHeight.height)
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
        self.updateScrollView(heightValue: self.baseHeight + self.keyboardHeight)
        
    }
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        self.selectDateTextField.text = formatter.string(from: self.datePicker.date)
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
        
        self.selectDateTextField.addTarget(self, action: #selector(self.pressSelectDateTextField(_:)), for: .touchUpInside)
    }
    
    @objc func pressEditImageButton(_ sender: UIButton) {
        
    }
    
    @objc func pressSelectCategoryButton(_ sender: UIButton) {
        
    }
    
    @objc func pressSelectDateTextField(_ sender: UITextField) {
        sender.text = ""
        sender.textColor = .signInBottomLabels
    }
    
    @objc func pressEditReviewButton(_ sender: UIButton) {
        
    }
    
    @objc func pressShareReviewButton(_ sender: UIButton) {
        
    }
    
    @objc func pressDeleteReviewButton(_ sender: UIButton) {
        
    }
}
// 이미지 피커 컨트롤러 필요(크롭기능 적용)
// 카테고리 선택 피커 필요

