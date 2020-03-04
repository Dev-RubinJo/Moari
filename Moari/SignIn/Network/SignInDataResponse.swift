//
//  SignInDataResponse.swift
//  Moari
//
//  Created by YooBin Jo on 2020/02/18.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

import ObjectMapper

struct SignInResponse {
    // TODO: 리스폰스 데이터들 선언하기
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var name: String!
    var jwt: String!
}
extension SignInResponse: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        name <- map["name"]
        jwt <- map["jwt"]
    }
    
    
}
