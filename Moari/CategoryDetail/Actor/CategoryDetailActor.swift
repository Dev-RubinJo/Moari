//
//  CategoryDetailActor.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

class CategoryDetailActor: CategoryDetailActorDelegate {
    
    static let shared = CategoryDetailActor()
    private init() {}
    
    weak var view: CategoryDetailVCRouterDelegate?
    weak var dataManager: CategoryDetailDataManagerDelegate?
    
    var reviewList: [Review] = []
    
    // TODO: 첫 리뷰리스트 가져오기
    // TODO: 20개가 넘으면 또 가져오도록 하기
    // TODO: 리뷰 삭제넣기
    // TODO: 리뷰 삭제 팝업 띄우기
    // TODO: 리뷰 추가하기 화면 넘어가도록 하기
    // 위아래 기능 구분하면서 하기
    // TODO: 리뷰 상세보기 화면 넘어가도록 하기
}
