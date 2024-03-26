//
//  KeyChainToken.swift
//  LorbyAuth
//
//  Created by anjella on 18/3/24.
//

import Foundation
import Security

func getTokenFromKeychain() -> String? {
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "authToken",
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecReturnData as String: true
    ]

    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)

    guard status == errSecSuccess,
        let tokenData = item as? Data,
        let token = String(data: tokenData, encoding: .utf8) else {
            print("Ошибка получения токена из Keychain: \(status)")
            return nil
    }

    print("Токен успешно получен из Keychain: \(token)")
    return token
}


