//
//  ReviewModel.swift
//  Moari
//
//  Created by YooBin Jo on 2020/03/04.
//  Copyright © 2020 YooBin Jo. All rights reserved.
//

struct Review {
    
    var reviewId: Int!
    var reviewCategory: Int!
    var title: String!
    var imageUrl: String!
    var starRate: Float!
    
    init(reviewId: Int, reviewCategory: Int, title: String, imageUrl: String, starRate: Float) {
        self.reviewId = reviewId
        self.reviewCategory = reviewCategory
        self.title = title
        self.imageUrl = imageUrl
        self.starRate = starRate
    }
}
