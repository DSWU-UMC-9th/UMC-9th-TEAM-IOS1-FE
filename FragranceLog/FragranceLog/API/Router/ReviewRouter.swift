//
//  ReviewRouter.swift
//  FragranceLog
//
//  Created by 김미주 on 11/25/25.
//

import Alamofire
import Moya

enum ReviewRouter {
    case postReview(perfumeId: Int, userId: Int, data: ReviewData)
    case patchReview(perfumeId: Int, reviewId: Int, userId: Int, data: ReviewData)
    case getDetail(perfumeId: Int)
}

extension ReviewRouter: APITargetType {
    var path: String {
        switch self {
        case .postReview(let perfumeId, _, _):
            return "/perfumes/\(perfumeId)/reviews"
        case .patchReview(let perfumeId, let reviewId, _, _):
            return "/perfumes/\(perfumeId)/reviews/\(reviewId)"
        case .getDetail(let perfumeId):
            return "/perfumes/\(perfumeId)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .postReview:
            return .post
        case .patchReview:
            return .patch
        case .getDetail:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .postReview(_, let userId, let data), .patchReview(_, _, let userId, let data):
            let params: [String: Any] = [
                "score": data.score,
                "content": data.content,
            ]

            return .requestCompositeParameters(
                bodyParameters: params,
                bodyEncoding: JSONEncoding.default,
                urlParameters: ["userId": userId]
            )
        case .getDetail:
            return .requestPlain
        }
    }
}
