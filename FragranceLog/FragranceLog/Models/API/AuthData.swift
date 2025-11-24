//
//  AuthData.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation

// 회원가입
struct SignupData: Codable {
    let username: String
    let password: String
    let confirmPassword: String
}

// 로그인
struct LoginData: Codable {
    let username: String
    let password: String
}
