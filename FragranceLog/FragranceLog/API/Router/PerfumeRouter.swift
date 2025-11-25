//
//  PerfumeRouter.swift
//  FragranceLog
//
//  Created by 황민지 on 11/25/25.
//

import Foundation
import Moya
import Alamofire

enum PerfumeRouter {
    case getRecommendations // 추천 향수 조회
}

extension PerfumeRouter: APITargetType {

    var path: String {
        switch self {
        case .getRecommendations:
            return "/perfumes/recommendations"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getRecommendations:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getRecommendations:
            return .requestPlain
        }
    }
}
