//
//  MyReviewResponse.swift
//  FragranceLog
//
//  Created by 김미주 on 11/26/25.
//

import Foundation

struct MyReviewResponse: Codable {
    let status: Int
    let code: String
    let message: String
    let data: [ReviewResponseData]
}
