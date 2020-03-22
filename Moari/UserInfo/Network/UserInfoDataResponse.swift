//
//  UserInfoDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct UserInfoResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
}
extension UserInfoResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
    }
}
