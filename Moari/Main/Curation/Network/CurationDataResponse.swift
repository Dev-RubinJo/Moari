//
//  CurationDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/21.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct Curation {
    var reviewId: Int!
    var categoryId: Int!
    var userNo: Int!
    var title: String!
    var simpleContent: String!
    var imageUrl: String!
    var starRate: Double!
    var reviewContent: String!
}
extension Curation: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        reviewId <- map["idboard"]
        categoryId <- map["categoryType"]
        userNo <- map["userIdx"]
        title <- map["title"]
        simpleContent <- map["content"]
        imageUrl <- map["image"]
        starRate <- map["grade"]
        reviewContent <- map["review"]
    }
}

struct CurationResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: [Curation]!
}
extension CurationResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}
