//
//  SortedPerfumeResponse.swift
//  FragranceLog
//
//  Created by 황민지 on 11/25/25.
//

import Foundation

struct SortedPerfumeResponse: Codable {
    let status: Int
    let code: String
    let message: String
    let data: [SortedPerfume]
}

struct SortedPerfume: Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let averageRating: Double
    let reviewCount: Int
}
