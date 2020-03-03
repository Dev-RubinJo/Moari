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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setUpScrollView()
        self.navigationItem.title = "작성하기"
        self.navigationController?.navigationBar.barStyle = .default
        UIApplication.shared.statusBarStyle = .default
        
        self.reviewTitleTextView.delegate = self
        self.reviewContentTextView.delegate = self
        self.contentTextView.delegate = self
    }
    
    func setUpScrollView() {
        self.contentView.snp.makeConstraints { make in
            make.height.equalTo(1000)
        }
    }
    
    func updateScrollView(heightValue value: CGFloat) {
        self.contentView.snp.makeConstraints { make in
            make.height.equalTo(value)
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
            fallthrough
        default:
            break
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        switch textView {
        case self.reviewTitleTextView:
            self.reviewTitlePlaceholderLabel.isHidden = true
            self.reviewTitleTextView.centerVertically()
        case self.reviewContentTextView:
            self.reviewContentPlaceholderLabel.isHidden = true
            self.reviewContentTextView.centerVertically()
        case self.contentTextView:
            fallthrough
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
            fallthrough
        default:
            break
        }
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
