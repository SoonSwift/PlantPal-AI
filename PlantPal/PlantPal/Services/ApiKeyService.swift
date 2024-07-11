//
//  KeychainService.swift
//  PlantPal
//
//  Created by Marcin Dytko on 10/07/2024.
//

import Foundation
import KeychainSwift

protocol ApiKeyServiceInterface {
    func save(_ value: String)
    func get() -> String?
    func delete()
}

final class ApiKeyService: ApiKeyServiceInterface {
    private let keychain = KeychainSwift()
    private let apiKey = "apiKey"
    
    func save(_ value: String) {
        keychain.set(value, forKey: apiKey)
    }
    
    func get() -> String? {
        keychain.get(apiKey)
    }
    
    func delete() {
        keychain.delete(apiKey)
    }
}
