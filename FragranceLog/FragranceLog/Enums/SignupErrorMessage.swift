//
//  SignupErrorMessage.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation

enum SignupErrorMessage: String {
    case invalidUsernameFormat = "아이디는 영어 또는 영어+숫자를 조합하여 4~12자로 입력하세요"
    case invalidPasswordFormat = "비밀번호는 영어와 숫자를 조합하여 6~15자로 입력하세요"
    case passwordNotMatch = "비밀번호와 비밀번호 확인이 일치하지 않습니다."
    case duplicatedUsername = "이미 사용 중인 아이디입니다."
    
    init?(serverMessage: String) {
        self.init(rawValue: serverMessage)
    }
}
