//
//  AddReviewVC.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import UIKit
import SnapKit
import Photos

class AddReviewVC: BaseVC, AddReviewVCProtocol {
    
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
    @IBOutlet weak var reviewTitleViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var reviewTitleViewHeightConstraint: NSLayoutConstraint!
    // 화면별로 글씨 사이즈 조정하기
    @IBOutlet weak var reviewTitleTextView: UITextView!
    // TODO: 리뷰 작성때는 띄우고 수정할때는 띄우지 말기, isAdd로 구분
    @IBOutlet weak var reviewTitlePlaceholderLabel: UILabel!
    
    @IBOutlet weak var starRateView: UIView!
    @IBOutlet weak var starRateBorderImageView: UIImageView!
    @IBOutlet weak var starRateImageView: UIImageView!
    
    
    @IBOutlet weak var reviewContentView: UIView!
    @IBOutlet weak var reviewContentBorderImageView: UIImageView!
    // 화면별로 글씨 사이즈 조정하기
    @IBOutlet weak var reviewContentTextView: UITextView!
    // TODO: 리뷰 작성때는 띄우고 수정할때는 띄우지 말기, isAdd로 구분
    @IBOutlet weak var reviewContentPlaceholderLabel: UILabel!
    
    @IBOutlet weak var selectCategoryButton: UIButton!
    @IBOutlet weak var selectDateButton: UIButton!
    @IBOutlet weak var selectDateTextField: UITextField!
    
    @IBOutlet weak var editReviewButton: UIButton!
    @IBOutlet weak var shareReviewButton: UIButton!
    @IBOutlet weak var deleteReviewButton: UIButton!
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var contentTextViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewPlaceholderLabel: UILabel!
    
    var actor: AddReviewActorDelegate?
    weak var categoryDetailVC: CategoryDetailVC?
    
    let picker: UIImagePickerController = UIImagePickerController()
    /// 선택한 이미지를 저장하는 변수
    var image: UIImage? = UIImage(named: "defaultImage")
    var imageUrl: String = ""
    var imageChangeFlag: Bool = false
    
    var appendReviewButton = UIBarButtonItem()
    var closeReviewButton = UIBarButtonItem()
    
    var isEdit: Bool = false
    var isAdd: Bool?
    var newReview: Bool = false
    
    var review: ReviewDetail?
    
    var reviewId: Int?
    var categoryId: Int?
//    var isReviewExist: Bool?
    var starRateValue: Double = 0
    var baseHeight: CGFloat = 0
    var contentTextViewHeight: CGSize = CGSize(width: 0, height: 0)
    
    var datePicker: UIDatePicker!
    
    lazy var screenHeight: CGFloat = {
        switch UIScreen.main.nativeBounds.height {
        case 1136: // se1
            return 568
        case 1334:
            //                print("iPhone 6/6S/7/8")
            return 667
        case 1920:
            return 736
        case 2436:
            return 812
        case 1792:
            //                print("iPhone XR, XS MAX")
            return 896
        case 2688:
            return 896
        default:
            return 896
        }
    }()
    
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
    
    lazy var fontSize: CGFloat = {
        switch UIScreen.main.nativeBounds.height {
        case 1136: // se1
            return 15.0
        case 1334:
            //                print("iPhone 6/6S/7/8")
            return 17.0
        case 1920:
            return 19.0
        case 2436:
            return 17.0
        case 1792, 2688:
            //                print("iPhone XR, XS MAX")
            return 19.0
        default:
            return 19.0
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.baseHeight = self.shareImageBaseView.bounds.height + 127
        
        self.reviewTitleTextView.delegate = self
        self.reviewContentTextView.delegate = self
        self.contentTextView.delegate = self
        self.selectDateTextField.delegate = self
        
        self.picker.delegate = self
        
        self.setAddReviewVCUI()
        self.initTapListener()
        
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                //권한 획득시 실행될 명령
            } else {
                self.presentAlert(title: "카메라 권한을 허가해주세요", message: "원활한 이용을 위해 카메라 권한을 허가해주세요!")
            }
        }
        //앨범 권한 묻기
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in
                if status != .authorized { // 권한 허가가 아니라면
                    self.presentAlert(title: "앨범 권한을 허가해주세요", message: "원활한 이용을 위해 앨범 권한을 허가해주세요!")
                }
            })
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.setForegroundNotification), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.reviewTitleTextView.centerVertically()
        self.reviewContentTextView.centerVertically()
        
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
//        print(self.actor?.categoryList)
        if self.isAdd ?? false {
            self.navigationItem.title = "작성하기"
        }
    }
    
    // 일부 앱 생명주기와 관련이 되어있다. 앱 밖으로 나가는 것과 연관이 되어있다
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    @objc func setForegroundNotification() {
        if self.isAdd ?? false {
            self.navigationItem.title = "작성하기"
        }
        if self.contentTextView.text != "" {
            self.contentViewPlaceholderLabel.isHidden = true
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
