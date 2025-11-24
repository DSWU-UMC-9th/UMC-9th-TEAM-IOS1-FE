//
//  SignupViewModel.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation
import Moya
import Combine

class SignupViewModel: ObservableObject {

    // 입력값
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    // 에러 메시지
    @Published var usernameError: String?
    @Published var passwordError: String?
    @Published var confirmPasswordError: String?

    // 성공 여부
    @Published var isSignupSuccess: Bool = false

    private let provider = APIManager.shared.createProvider(for: AuthRouter.self)
    
    private var signupData: SignupData {
        SignupData(
            username: username,
            password: password,
            confirmPassword: confirmPassword
        )
    }
    
    private func resetErrors() {
        usernameError = nil
        passwordError = nil
        confirmPasswordError = nil
    }

    func signup() {
        resetErrors() // 에러 초기화
        
        provider.request(.postSignup(data: signupData)) { result in
            switch result {
            case .success(let response):

                // 성공 응답 (201)
                if response.statusCode == 201 {
                    if let success = try? JSONDecoder().decode(SignupResponse.self, from: response.data) {
                        DispatchQueue.main.async {
                            self.isSignupSuccess = true
                        }
                    }
                    return
                }

                // 실패 응답도 여기서 처리
                if let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: response.data) {
                    DispatchQueue.main.async {
                        self.handleSignupError(message: apiError.message)
                    }
                } else {
                    print("디코딩 안 됨:", String(data: response.data, encoding: .utf8) ?? "")
                }

            case .failure(let error):

                if let response = error.response {
                    if let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: response.data) {
                        DispatchQueue.main.async {
                            self.handleSignupError(message: apiError.message)
                        }
                        return
                    }
                }

                print("네트워크 오류:", error)
            }
        }
    }



    func handleSignupError(message: String) {
        if message.contains("아이디") {
            self.usernameError = message
        } else if message.contains("비밀번호 확인") {
            self.confirmPasswordError = message
        } else if message.contains("비밀번호") {
            self.passwordError = message
        }
    }
}
