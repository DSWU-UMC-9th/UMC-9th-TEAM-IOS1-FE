//
//  MeResponse.swift
//  FragranceLog
//
//  Created by 김미주 on 11/26/25.
//

import Foundation

struct MeResponse: Codable {
    let status: Int
    let code: String
    let message: String
    let data: MeResponseData
}

struct MeResponseData: Codable {
    let id: Int
    let username: String
}
