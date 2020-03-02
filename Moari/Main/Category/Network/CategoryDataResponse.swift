//
//  CategoryDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/01.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct Category {
    var categoryName: String!
}
extension Category: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        categoryName <- map["categoryName"]
    }
    
    
}

struct CategoryListResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: [Category]!
}
extension CategoryListResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
}
