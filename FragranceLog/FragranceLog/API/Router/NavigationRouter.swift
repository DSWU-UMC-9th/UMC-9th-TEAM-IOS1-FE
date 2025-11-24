//
//  NavigationRouter.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import SwiftUI
import Combine

final class NavigationRouter<Route: Hashable>: ObservableObject {
    @Published var path = NavigationPath()
    
    // 추가
    func push(_ route: Route) {
        path.append(route)
    }
    
    // 마지막 화면 제거
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    // 초기화
    func reset() {
        path = NavigationPath()
    }
}
