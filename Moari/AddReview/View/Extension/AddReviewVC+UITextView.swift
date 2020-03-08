//
//  AddReviewVC+UITextView.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/07.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit

extension AddReviewVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        switch textView {
        case self.reviewTitleTextView:
            self.reviewTitlePlaceholderLabel.isHidden = true
            self.reviewTitleTextView.centerVertically()
            self.updateScrollView(heightValue: self.baseHeight + self.keyboardHeight)
        case self.reviewContentTextView:
            self.reviewContentPlaceholderLabel.isHidden = true
            self.reviewContentTextView.centerVertically()
            self.updateScrollView(heightValue: self.baseHeight + self.keyboardHeight)
        case self.contentTextView:
            self.resizeContentTextView()
            self.updateScrollView(heightValue: self.baseHeight + self.keyboardHeight)
            var point = contentTextView.frame.origin
            point.y = point.y - self.keyboardHeight - 4
            point.x = point.x - 22
            self.scrollView.setContentOffset(point, animated: true)
            // 11promax = 346
            // 11 = 346
            // 11pro = 220
            // 6s+ = 265
            // 8 = 220
        // se = 261
        default:
            break
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        switch textView {
        // TODO: 제목 25자, 한줄평 100자 벨리데이션 추가
        case self.reviewTitleTextView:
            self.reviewTitlePlaceholderLabel.isHidden = true
            self.reviewTitleTextView.centerVertically()
            
        case self.reviewContentTextView:
            self.reviewContentPlaceholderLabel.isHidden = true
            self.reviewContentTextView.centerVertically()
            
        case self.contentTextView:
            self.resizeContentTextView()
            self.updateScrollView(heightValue: self.baseHeight + self.contentTextViewHeight.height + self.keyboardHeight)
            //            var point = contentTextView.frame.origin
            //            point.y = point.y - 261
            //            point.x = point.x - 22
            //
            //            if let selectedRange = self.contentTextView.selectedTextRange {
            //                let cursorPosition = self.contentTextView.offset(from: self.contentTextView.beginningOfDocument, to: selectedRange.start)
            //                print("\(cursorPosition)")
            //            }
            
        //            self.scrollView.setContentOffset(point, animated: true)
        default:
            break
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView {
        case self.reviewTitleTextView:
            if self.reviewTitleTextView.text! == "" {
                self.reviewTitlePlaceholderLabel.isHidden = false
            }
            self.updateScrollView(heightValue: self.baseHeight)
        case self.reviewContentTextView:
            if self.reviewContentTextView.text! == "" {
                self.reviewContentPlaceholderLabel.isHidden = false
            }
            self.updateScrollView(heightValue: self.baseHeight)
        case self.contentTextView:
            self.updateScrollView(heightValue: self.baseHeight)
        default:
            break
        }
    }
    
    func resizeContentTextView() {
        let fixedWidth = self.contentTextView.frame.size.width
        self.contentTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = self.contentTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = self.contentTextView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        self.contentTextView.frame = newFrame;
        self.contentTextViewHeight.height = newSize.height
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        switch textView {
        // TODO: 제목 25자, 한줄평 100자 벨리데이션 추가
        case self.reviewTitleTextView:
            guard let str = textView.text else { return true }
            let newLength = str.count + text.count - range.length
            return newLength <= 25
            
        case self.reviewContentTextView:
            guard let str = textView.text else { return true }
            let newLength = str.count + text.count - range.length
            return newLength <= 100
            
        default:
            break
        }
        return true
    }
}
