//
//  KeychainManager.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import Foundation
import Alamofire

final class KeychainManager {
    static let shared = KeychainManager()
    private init() {}

    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "accessToken")
    }

    func loadToken() -> String? {
        UserDefaults.standard.string(forKey: "accessToken")
    }

    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
    }
    
    func saveUserId(_ id: Int) {
        UserDefaults.standard.set(id, forKey: "userId")
    }

    func loadUserId() -> Int? {
        let value = UserDefaults.standard.integer(forKey: "userId")
        return value == 0 ? nil : value
    }

    func deleteUserId() {
        UserDefaults.standard.removeObject(forKey: "userId")
    }
}
