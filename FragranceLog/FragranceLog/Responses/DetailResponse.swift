//
//  DetailResponse.swift
//  FragranceLog
//
//  Created by 김미주 on 11/25/25.
//

import Foundation

struct DetailResponse: Codable {
    let status: Int
    let code: String
    let message: String
    let data: DetailResponseData
}

struct DetailResponseData: Codable {
    let id: Int
    let name: String
    let brand: String
    let price: String
    let description: String
    let imageUrl: String
    let reviewCount: Int
    let averageRating: Double
    let reviews: [ReviewResponseData]
}
