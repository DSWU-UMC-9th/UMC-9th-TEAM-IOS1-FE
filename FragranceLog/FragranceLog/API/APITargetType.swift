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
        switch task {
        case .requestJSONEncodable, .requestParameters:
            return ["Content-Type": "application/json"]
        case .uploadMultipart:
            return ["Content-Type": "multipart/form-data"]
        default:
            return nil
        }
    }
    
    var validationType: ValidationType { .successCodes }
}
