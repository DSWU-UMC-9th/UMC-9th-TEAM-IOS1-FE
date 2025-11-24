//
//  LoginViewModel.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation
import Moya
import Combine

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""

    @Published var usernameError: String?
    @Published var passwordError: String?
    @Published var generalError: String?

    @Published var isLoginSuccess = false

    private let provider = APIManager.shared.createProvider(for: AuthRouter.self)

    private var loginData: LoginData {
        LoginData(username: username, password: password)
    }

    private func resetErrors() {
        usernameError = nil
        passwordError = nil
        generalError = nil
    }

    func login() {
        resetErrors()

        provider.request(.postLogin(data: loginData)) { result in
            switch result {
            case .success(let response):

                // 성공 응답 200
                if response.statusCode == 200 {
                    if let success = try? JSONDecoder().decode(LoginResponse.self, from: response.data) {
                        DispatchQueue.main.async {
                            self.isLoginSuccess = true
                        }
                    }
                    return
                }

                // 실패 응답 디코딩
                if let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: response.data) {
                    DispatchQueue.main.async {
                        self.handleLoginError(message: apiError.message, status: apiError.status)
                    }
                    return
                }

            case .failure(let error):
                if let response = error.response,
                   let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: response.data) {

                    DispatchQueue.main.async {
                        self.handleLoginError(message: apiError.message, status: apiError.status)
                    }
                    return
                }

                print("네트워크 오류:", error)
            }
        }
    }

    func handleLoginError(message: String, status: Int?) {
        switch status {
        case 404:
            usernameError = message       // 존재하지 않는 아이디
        case 401:
            passwordError = message       // 비밀번호 틀림
        default:
            generalError = message        // 기타 에러
        }
    }
}
