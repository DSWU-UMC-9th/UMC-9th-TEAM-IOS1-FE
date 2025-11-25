//
//  RecommendResponse.swift
//  FragranceLog
//
//  Created by 황민지 on 11/25/25.
//

import Foundation

// 추천 향수 조회
struct RecommendResponse: Codable {
    let status: Int
    let code: String
    let message: String
    let data: [RecommendPerfume]
}

struct RecommendPerfume: Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let todayReviewCount: Int
}
