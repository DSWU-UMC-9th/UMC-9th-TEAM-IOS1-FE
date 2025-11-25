//
//  LoginView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var router: NavigationRouter<OnboardingRoute>
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.color3
            
            VStack(spacing: 0) {
                Image(.logoLarge)
                
                Spacer().frame(height: 79)
                
                InfoGroup
                
                Spacer().frame(height: 24)
                
                InputGroup
                
                Spacer().frame(height: 16)
                
                ButtonGroup
                
                Spacer()
                
            }
            .padding(.top, 115)
        }
        .foregroundStyle(.black)
        .ignoresSafeArea()
        .onChange(of: viewModel.isLoginSuccess) { success in
            print("userId:", KeychainManager.shared.loadUserId() ?? -1)
            if success {
                // TODO: 메인 페이지 이동
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private var InfoGroup: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("로그인 하기")
                .font(.zen18)
            
            Text("아이디와 비밀번호를 입력하세요")
                .font(.zen12)
        }
    }
    
    private var InputGroup: some View {
        VStack(spacing: 16) {
            InputView{
                TextField("아이디를 입력하세요", text: $viewModel.username)
                    .font(.robotoLight12)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
            }
            InputView{
                SecureField("비밀번호를 입력하세요", text: $viewModel.password)
                    .font(.robotoLight12)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
            }
            
            // 아이디 입력 관련 에러
            if let error = viewModel.usernameError {
                Text(error)
                    .font(.robotoRegular14)
                    .foregroundColor(.color5)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
            
            // 비밀번호 관련 에러
            if let error = viewModel.passwordError {
                Text(error)
                    .font(.robotoRegular14)
                    .foregroundColor(.color5)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 24)
    }
    
    private var ButtonGroup: some View {
        VStack(alignment: .center, spacing: 24) {
            
            Button(action: {
                viewModel.login()
            }) {
                ZStack {
                    // Glass 네모
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThinMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.color3.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: .color1.opacity(0.15), radius: 7, y: 1)
                        .frame(height: 40)

                    // 텍스트 뒤의 그라데이션 배경 네모
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(.color2),
                                    Color(.color6),
                                    Color(.color9)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .opacity(0.6)
                        .allowsHitTesting(false)
                        .frame(height: 40)

                    // 텍스트
                    Text("로그인")
                        .font(.zen16)
                        .foregroundColor(.color1)
                }
            }

            
            HStack(spacing: 8) {
                Rectangle()
                    .fill(.color8)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                
                Text("또는")
                    .font(.robotoRegular14)
                    .foregroundStyle(.color7)
                
                Rectangle()
                    .fill(.color8)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
            }
            
            Button(action: {
                router.push(.signup)
            }) {
                ZStack {
                    // Glass 네모
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.ultraThinMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.color3.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: .color1.opacity(0.15), radius: 7, y: 1)
                        .frame(height: 40)

                    // 텍스트 뒤의 그라데이션 배경 네모
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(.color8),
                                    Color(.color5),
                                    Color(.color8)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .opacity(0.6)
                        .allowsHitTesting(false)
                        .frame(height: 40)

                    // 텍스트
                    Text("회원가입 하러 가기")
                        .font(.zen16)
                        .foregroundColor(.color3)
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    LoginView()
        .environmentObject(NavigationRouter<OnboardingRoute>())
}
