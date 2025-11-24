//
//  SignupResponse.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation

struct SignupResponse: Codable {
    let isSuccess: Bool
    let code: String?
    let message: String
    let data: SignupResult?
}

struct SignupResult: Codable {
    let username: String
    let password: String?
    let confirmPassword: String?
}
