//
//  AddReviewDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct ReviewDetail {
    var reviewId: Int!
    var categoryId: Int!
    var title: String!
    var simpleContent: String!
    var imageUrl: String!
    var starRate: Double!
    var reviewContent: String!
    var reviewDate: String!
}
extension ReviewDetail: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        reviewId <- map["idboard"]
        categoryId <- map["categoryType"]
        title <- map["title"]
        simpleContent <- map["review"]
        imageUrl <- map["image"]
        starRate <- map["grade"]
        reviewContent <- map["content"]
        reviewDate <- map["reviewDate"]
    }
}

struct ReviewDetailResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: [ReviewDetail]!
}
extension ReviewDetailResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}

struct WriteReviewResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var reviewId: Int!
}
extension WriteReviewResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        reviewId <- map["boardIdx"]
    }
}
