//
//  SplashDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/11.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct SplashDataResponse {
    var isSuccess: Bool!
    var code: Int!
    var name: String!
    var id: String!
    var message: String!
}
extension SplashDataResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        name <- map["name"]
        id <- map["id"]
        message <- map["message"]
    }
    
    
}
