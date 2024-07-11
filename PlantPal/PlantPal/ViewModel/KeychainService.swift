//
//  KeychainService.swift
//  PlantPal
//
//  Created by Marcin Dytko on 10/07/2024.
//

import Foundation
import KeychainSwift

class KeychainService {
    private let keychain = KeychainSwift()
    private let apiKeyKey = "apiKey"
    
    func saveApiKey(_ apiKey: String) {
        keychain.set(apiKey, forKey: apiKeyKey)
    }
    
    func loadApiKey() -> String? {
        return keychain.get(apiKeyKey)
    }
    
    func deleteApiKey() {
        keychain.delete(apiKeyKey)
    }
}
