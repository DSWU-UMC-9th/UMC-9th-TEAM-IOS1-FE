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
    case getSortedPerfumes(sort: String)  // 필터링된 향수 목록 조회
}

extension PerfumeRouter: APITargetType {

    var path: String {
        switch self {
        case .getRecommendations:
            return "/perfumes/recommendations"
        case .getSortedPerfumes:
            return "/perfumes/sorted"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getRecommendations, .getSortedPerfumes:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getRecommendations:
            return .requestPlain
        case .getSortedPerfumes(let sort):
            return .requestParameters(
                parameters: ["sort": sort],
                encoding: URLEncoding.queryString
            )
        }
    }
}
