//
//  APITargetType.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation
import Moya

// baseURL 공통 처리
protocol APITargetType: TargetType {}

extension APITargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var headers: [String: String]? {
        var baseHeaders: [String: String] = [:]

        switch task {
        case .requestJSONEncodable, .requestParameters:
            baseHeaders["Content-Type"] = "application/json"
        case .uploadMultipart:
            baseHeaders["Content-Type"] = "multipart/form-data"
        default:
            break
        }

        if let token = KeychainManager.shared.loadToken() {
            baseHeaders["Authorization"] = "Bearer \(token)"
        }

        return baseHeaders.isEmpty ? nil : baseHeaders
    }

    var validationType: ValidationType { .successCodes }
}
