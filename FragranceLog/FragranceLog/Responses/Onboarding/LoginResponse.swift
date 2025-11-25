//
//  SignupResponse.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let code: String
    let message: String
    let data: LoginResult
}

struct LoginResult: Codable {
    let id: Int
    let token: String?
    let username: String?
    let password: String?
}
