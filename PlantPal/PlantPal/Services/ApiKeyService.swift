//
//  KeychainService.swift
//  PlantPal
//
//  Created by Marcin Dytko on 10/07/2024.
//

import Foundation
import KeychainSwift

protocol ApiKeyServiceInterface: ObservableObject {
    var apiKeySet: Bool { get }
    
    func save(_ value: String)
    func get() -> String?
    func delete()
}

final class ApiKeyService: ApiKeyServiceInterface {
    private let keychain = KeychainSwift()
    private let apiKey = "apiKey"
    
    @Published var apiKeySet = false
    
    init() {
        apiKeySet = get() != nil
    }
    
    func save(_ value: String) {
        keychain.set(value, forKey: apiKey)
        apiKeySet = true
    }
    
    func get() -> String? {
        keychain.get(apiKey)
    }
    
    func delete() {
        keychain.delete(apiKey)
        apiKeySet = false
    }
}
