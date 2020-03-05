//
//  CategoryDetailDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct ReviewResult {
    var reviewId: Int!
    var reviewCategory: Int!
    var title: String!
    var imageUrl: String!
    var starRate: Float!
}
extension ReviewResult: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        reviewId <- map["idboard"]
        reviewCategory <- map["categoryType"]
        title <- map["title"]
        imageUrl <- map["image"]
        starRate <- map["grade"]
    }
}
