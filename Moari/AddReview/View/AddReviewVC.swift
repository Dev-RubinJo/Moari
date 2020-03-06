//
//  AddReviewVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import SnapKit

class AddReviewVC: BaseVC, AddReviewVCProtocol, UITextViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    /// 공유를 하게되면 베이스가 되는 뷰
    @IBOutlet weak var shareImageBaseView: UIView!
    /// 배경이미지 투명도 조절하는 뷰 isAdd에 따라서 바뀜
    @IBOutlet weak var blurView: UIView!
    /// 리뷰 배경 이미지
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var editImageButton: UIButton!
    
    @IBOutlet weak var reviewTitleView: UIView!
    @IBOutlet weak var reviewTitleBorderImageView: UIImageView!
    // 화면별로 글씨 사이즈 조정하기
    @IBOutlet weak var reviewTitleTextView: UITextView!
    // TODO: 리뷰 작성때는 띄우고 수정할때는 띄우지 말기, isAdd로 구분
    @IBOutlet weak var reviewTitlePlaceholderLabel: UILabel!
    
    @IBOutlet weak var starRateView: UIView!
    @IBOutlet weak var starRateBorderImageView: UIImageView!
    @IBOutlet weak var starRateButton: UIButton!
    
    @IBOutlet weak var reviewContentView: UIView!
    @IBOutlet weak var reviewContentBorderImageView: UIImageView!
    // 화면별로 글씨 사이즈 조정하기
    @IBOutlet weak var reviewContentTextView: UITextView!
    // TODO: 리뷰 작성때는 띄우고 수정할때는 띄우지 말기, isAdd로 구분
    @IBOutlet weak var reviewContentPlaceholderLabel: UILabel!
    
    @IBOutlet weak var selectCategoryButton: UIButton!
    @IBOutlet weak var selectDateButton: UIButton!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    weak var actor: AddReviewActorDelegate?
    var isAdd: Bool?
    var isReviewExist: Bool?
    var baseHeight: CGFloat = 0
    var contentTextViewHeight: CGSize = CGSize(width: 0, height: 0)
    
    lazy var keyboardHeight: CGFloat = {
        switch UIScreen.main.nativeBounds.height {
        case 1136, 1920: // se1
            return 265
        case 1334, 2436:
            //                print("iPhone 6/6S/7/8")
            return 225
        case 1792, 2688:
            //                print("iPhone XR, XS MAX")
            return 350
        default:
            return 300
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.baseHeight = self.shareImageBaseView.bounds.height + 127
        
        self.setUpScrollView()
        self.navigationItem.title = "작성하기"
        self.navigationController?.navigationBar.barStyle = .default
        UIApplication.shared.statusBarStyle = .default
        
        self.reviewTitleTextView.delegate = self
        self.reviewContentTextView.delegate = self
        self.contentTextView.delegate = self
    }
    
    func setUpScrollView() {
        // TODO: 기종별로 최적화 된 사이즈 지정하기
        self.resizeContentTextView()
        print(self.contentTextViewHeight.height)
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        switch textView {
        case self.reviewTitleTextView:
            self.reviewTitlePlaceholderLabel.isHidden = true
            self.reviewTitleTextView.centerVertically()
            
        case self.reviewContentTextView:
            self.reviewContentPlaceholderLabel.isHidden = true
            self.reviewContentTextView.centerVertically()
            
        case self.contentTextView:
            self.resizeContentTextView()
            self.updateScrollView(heightValue: self.baseHeight + 265)
            var point = contentTextView.frame.origin
            point.y = point.y - 261
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
        case self.reviewContentTextView:
            if self.reviewContentTextView.text! == "" {
                self.reviewContentPlaceholderLabel.isHidden = false
            }
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












//        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
/*
 lazy var baseView: UIView = {
 let view = UIView()
 view.translatesAutoresizingMaskIntoConstraints = false
 view.backgroundColor = .black
 view.alpha = 0.4
 
 return view
 }()
 
 lazy var titleTextField: UITextField = {
 let title = UITextField()
 title.font = UIFont(name: "AppleSDGothicNeo-Light", size: 26)
 // TODO: 플레이스 홀더 다국어 지원으로 변경하기
 title.placeholder = "제목"
 title.background = UIImage(named: "mainBackgroundImage")
 title.textAlignment = .center
 return title
 }()
 
 lazy var starRateImageView: UIImageView = {
 let imageView = UIImageView()
 
 return imageView
 }()
 
 lazy var starRateBorderView: UIView = {
 let view = UIView()
 
 return view
 }()
 
 lazy var simpleCommentTextView: UITextView = {
 let textView = UITextView()
 textView.textAlignment = .center
 textView.backgroundColor = .white
 textView.isScrollEnabled = false
 
 return textView
 }()
 
 lazy var scrollView: UIScrollView = {
 let view = UIScrollView()
 view.translatesAutoresizingMaskIntoConstraints = false
 view.contentSize.height = 1000
 view.backgroundColor = .white
 return view
 }()
 
 override func viewDidLoad() {
 super.viewDidLoad()
 //        self.setUpScrollView()
 //        self.simpleCommentTextView.delegate = self
 }
 
 func setUpScrollView() {
 self.view.addSubview(self.scrollView)
 self.scrollView.snp.makeConstraints { make in
 make.top.bottom.left.right.equalToSuperview()
 }
 self.scrollView.addSubview(self.baseView)
 self.baseView.snp.makeConstraints { make in
 make.top.equalToSuperview()
 make.width.equalToSuperview()
 make.height.equalTo(self.scrollView.snp.width)
 }
 self.baseView.addSubview(self.titleTextField)
 self.titleTextField.snp.makeConstraints { make in
 make.top.equalToSuperview().offset(95)
 make.centerX.equalToSuperview()
 make.height.equalToSuperview().offset(60)
 make.left.equalToSuperview().offset(22)
 make.right.equalToSuperview().offset(-22)
 }
 
 self.baseView.addSubview(self.simpleCommentTextView)
 self.simpleCommentTextView.snp.makeConstraints { make in
 make.top.equalTo(self.titleTextField.snp.bottom).offset(40)
 make.left.equalToSuperview().offset(22)
 make.right.equalToSuperview().offset(-22)
 make.centerX.equalToSuperview()
 make.bottom.equalToSuperview().offset(-35)
 }
 }
 
 func updateScrollView(heightValue value: CGFloat) {
 self.scrollView.contentSize.height = value
 }
 
 func textViewDidChange(_ textView: UITextView) {
 self.simpleCommentTextView.centerVertically()
 }
 }
 //        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
 //        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
 //        self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
 //        self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
 
 */
