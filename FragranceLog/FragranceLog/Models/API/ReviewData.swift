//
//  ReviewData.swift
//  FragranceLog
//
//  Created by 김미주 on 11/25/25.
//

import Foundation

struct ReviewData: Codable, Hashable {
    let id = UUID()
    let score: Int
    let content: String
}
