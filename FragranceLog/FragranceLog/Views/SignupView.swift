//
//  SignupView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct SignupView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
        
    var body: some View {
        ZStack {
            Color.color3
            
            VStack(spacing: 0) {
                Image(.logoLarge)
                
                Spacer().frame(height: 51)
                
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
    }
    
    private var InfoGroup: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("계정 만들기")
                .font(.zen18)
            
            Text("아이디와 비밀번호를 입력하세요")
                .font(.zen12)
        }
    }
    
    private var InputGroup: some View {
        VStack(spacing: 16) {
            InputView{
                TextField("아이디를 입력하세요", text: $username)
                    .font(.robotoLight12)
            }
            
            // TODO: 회원가입 API 연결 후 에러 뜨게 할 예정
            
            InputView{
                SecureField("비밀번호를 입력하세요", text: $password)
                    .font(.robotoLight12)
            }
            
            // TODO: 회원가입 API 연결 후 에러 뜨게 할 예정

            InputView{
                SecureField("비밀번호를 한 번 더 입력하세요", text: $rePassword)
                    .font(.robotoLight12)
            }
            
            // TODO: 회원가입 API 연결 후 에러 뜨게 할 예정

        }
        .padding(.horizontal, 24)
    }
    
    private var ButtonGroup: some View {
        VStack(alignment: .center, spacing: 24) {
            
            Button(action: {
                // TODO: 회원가입
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
                    Text("회원가입")
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
                // TODO: 로그인 화면으로 이동
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
                    Text("로그인 하러 가기")
                        .font(.zen16)
                        .foregroundColor(.color3)
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    SignupView()
}
