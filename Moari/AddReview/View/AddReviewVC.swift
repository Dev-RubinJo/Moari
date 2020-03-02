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
    
    weak var actor: AddReviewActorDelegate?
    
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
        self.setUpScrollView()
        self.simpleCommentTextView.delegate = self
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
