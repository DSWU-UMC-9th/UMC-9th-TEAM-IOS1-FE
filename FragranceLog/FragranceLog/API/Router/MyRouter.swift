//
//  MyRouter.swift
//  FragranceLog
//
//  Created by 김미주 on 11/26/25.
//

import Alamofire
import Moya

enum MyRouter {
    case getMe
    case getReview(order: String)
}

extension MyRouter: APITargetType {
    var path: String {
        switch self {
        case .getMe:
            "/me"
        case .getReview:
            "/my/reviews"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getMe, .getReview:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getMe:
            return .requestPlain
        case .getReview(let order):
            return .requestParameters(parameters: ["order": order], encoding: URLEncoding.queryString)
        }
    }
}
