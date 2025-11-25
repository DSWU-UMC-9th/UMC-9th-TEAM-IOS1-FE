//
//  MainTabContainer.swift
//  FragranceLog
//
//  Created by 황민지 on 11/25/25.
//

import SwiftUI

struct MainTabContainer: View {
    @StateObject private var router = NavigationRouter<MainRoute>()
    
    var body: some View {
        MainView()
            .navigationDestination(for: MainRoute.self) { route in
                switch route {
                case .main:
                    MainView()
                }
            }
            .environmentObject(router)
    }
}

#Preview {
    OnboardingTabContainer()
}
