//
//  APIManager.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation
import Moya
import Alamofire

// 전체 호출 관리 클래스
class APIManager: @unchecked Sendable {
    static let shared = APIManager()
    
    private let loggerPlugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))

    private init() {}
    
    /// 실제 API 요청용 MoyaProvider
    public func createProvider<T: TargetType>(for targetType: T.Type) -> MoyaProvider<T> {
        return MoyaProvider<T>(
            plugins: [loggerPlugin]
        )
    }
    
    /// 테스트용 MoyaProvider
    public func testProvider<T: TargetType>(for targetType: T.Type) -> MoyaProvider<T> {
        return MoyaProvider<T>(
            stubClosure: MoyaProvider.immediatelyStub,
            plugins: [loggerPlugin]
        )
    }
}
