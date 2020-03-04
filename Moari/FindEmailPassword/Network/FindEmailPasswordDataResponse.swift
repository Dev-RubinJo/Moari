//
//  FindEmailPasswordDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/20.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct FindEmailPasswordResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
}
extension FindEmailPasswordResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
    }
}
