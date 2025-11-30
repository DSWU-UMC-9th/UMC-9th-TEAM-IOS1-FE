//
//  ReviewResponse.swift
//  FragranceLog
//
//  Created by 김미주 on 11/25/25.
//

import Foundation

struct ReviewResponse: Codable {
    let status: Int
    let code: String
    let message: String
    let data: ReviewResponseData
}

struct ReviewResponseData: Codable {
    let id: Int
    let rating: Int
    let content: String
    let maskedUsername: String
    let updatedDate: String
    let userId: Int?
}
