//
//  APIErrorResponse.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation

struct APIErrorResponse: Codable {
    let isSuccess: Bool
    let status: Int
    let error: String
    let message: String
}
