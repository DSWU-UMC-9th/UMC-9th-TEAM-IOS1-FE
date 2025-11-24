//
//  AuthRouter.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation
import Moya
import Alamofire

enum AuthRouter {
    case postSignup(data: SignupData) // 회원가입
    case postLogin(data: LoginData) // 로그인
}

extension AuthRouter: APITargetType {

    var path: String {
        switch self {
        case .postSignup:
            return "/register"
        case .postLogin:
            return "/login"
        }
    }

    var method: Moya.Method {
        switch self {
        case .postSignup, .postLogin:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .postSignup(let signupData):
            return .requestJSONEncodable(signupData)
        case .postLogin(let data):
            return .requestJSONEncodable(data)
        }
    }
}
