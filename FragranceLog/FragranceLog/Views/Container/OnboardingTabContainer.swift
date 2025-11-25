//
//  OnboardingTabContainer.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import SwiftUI

struct OnboardingTabContainer: View {
    @StateObject private var router = NavigationRouter<OnboardingRoute>()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            Group {
                if router.path.isEmpty {
                    LoginView()
                        .environmentObject(router)
                }
            }
            .navigationDestination(for: OnboardingRoute.self) { route in
                switch route {
                case .login:
                    LoginView().environmentObject(router)
                case .signup:
                    SignupView().environmentObject(router)
                case .main:
                    MainTabContainer()
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    OnboardingTabContainer()
}
