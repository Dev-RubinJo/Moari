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
            self.contentViewPlaceholderLabel.isHidden = true
            self.resizeContentTextView()
            self.updateScrollView(heightValue: self.baseHeight + self.contentTextViewHeight.height + self.keyboardHeight)
            
            let caret = self.contentTextView.caretRect(for: self.contentTextView.selectedTextRange!.start)
            let cursorRect: CGRect = CGRect.init(x: caret.maxX, y: caret.maxY, width: caret.width, height: self.contentView.bounds.height)
            
            self.scrollView.setContentOffset(CGPoint(x: 0.0, y: cursorRect.minY + 50), animated: true)
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
            textView.textContainer.maximumNumberOfLines = 2
        case self.reviewContentTextView:
            
            self.reviewContentPlaceholderLabel.isHidden = true
            self.reviewContentTextView.centerVertically()
            
        case self.contentTextView:
            self.resizeContentTextView()
            self.updateScrollView(heightValue: self.baseHeight + self.contentTextViewHeight.height + self.keyboardHeight)
            self.scrollToCursorPosition()
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
            self.updateScrollView(heightValue: self.baseHeight + self.contentTextViewHeight.height)
        case self.reviewContentTextView:
            if self.reviewContentTextView.text! == "" {
                self.reviewContentPlaceholderLabel.isHidden = false
            }
            self.actor?.setTextViewLineSpacing(self.reviewContentTextView, lineSpace: 5, fontSize: 19.0, color: .white, textAlignment: .center)
            self.updateScrollView(heightValue: self.baseHeight + self.contentTextViewHeight.height)
        case self.contentTextView:
            if textView.text == "" {
                self.contentViewPlaceholderLabel.isHidden = false
            }
            
            if self.baseHeight + self.contentTextView.bounds.height > self.screenHeight {
                self.updateScrollView(heightValue: self.baseHeight + self.contentTextViewHeight.height + 10)
            } else {
                self.updateScrollView(heightValue: self.screenHeight)
            }
            
            self.contentTextViewBottomConstraint.constant = 10
        default:
            break
        }
    }
    
    private func scrollToCursorPosition() {
        let caret = self.contentTextView.caretRect(for: self.contentTextView.selectedTextRange!.start)
        let cursorRect: CGRect = CGRect.init(x: caret.origin.x, y: caret.origin.y, width: caret.width, height: self.contentView.bounds.height)
        self.scrollView.scrollRectToVisible(cursorRect, animated: true)
    }

    func resizeContentTextView() {
        if self.contentTextView.text != " " && self.contentTextView.text != "" {
            self.actor?.setTextViewLineSpacing(self.contentTextView, lineSpace: 6, fontSize: 17.0, color: .systemWBColor, textAlignment: .natural)
            
            let fixedWidth = self.contentTextView.frame.size.width
            let newSize = self.contentTextView.sizeThatFits(CGSize(width: fixedWidth, height: .infinity))
            self.contentTextView.constraints.forEach { (constraint) in // ---- 3
                if constraint.firstAttribute == .height {
                    constraint.constant = newSize.height
                }
            }
            
            self.contentTextViewHeight.height = newSize.height
        } else {
            self.contentTextViewHeight.height = self.screenHeight - self.baseHeight
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        switch textView {
        case self.reviewTitleTextView:
            guard let str = textView.text else { return true }
            let newLength = str.count + text.count - range.length
            return newLength <= 25
            
        case self.reviewContentTextView:
            // MARK: 글자 수 제한하기
            guard let str = textView.text else { return true }
            let newLength = str.count + text.count - range.length
            
            // MARK: 라인 수 제한하기
            let existingLines = textView.text.components(separatedBy: CharacterSet.newlines)
            let newLines = text.components(separatedBy: CharacterSet.newlines)
            let linesAfterChange = existingLines.count + newLines.count - 1
            
            return newLength <= 100
                && linesAfterChange <= textView.textContainer.maximumNumberOfLines
            
        default:
            break
        }
        return true
    }
}
