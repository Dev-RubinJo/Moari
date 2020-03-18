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
    var categoryId: Int!
}
extension Category: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        categoryName <- map["categoryName"]
        categoryId <- map["idcategory"]
    }
}
struct UserInfo {
    var name: String!
    var reviewCount: Int!
}
extension UserInfo: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        reviewCount <- map["cnt"]
    }
}

struct CategoryListResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var userInfo: UserInfo!
    var result: [Category]!
}
extension CategoryListResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        userInfo <- map["userInfo"]
        result <- map["result"]
    }
}

struct CategoryDefaultResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
}
extension CategoryDefaultResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
    }
}
