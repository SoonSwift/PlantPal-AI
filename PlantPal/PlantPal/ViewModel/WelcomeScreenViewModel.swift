//
//  WelcomeScreenViewModel.swift
//  PlantPal
//
//  Created by Marcin Dytko on 09/07/2024.
//

import Foundation
import KeychainSwift
import SwiftUI

class WelcomeScreenViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var apiKey = ""
    @Published var savedApiKey = ""
    @Published var isApiKeyValid: Bool = true

    private let keyChain = KeychainSwift()
    private let apiKeyKey = "apiKey"
    
    init() {
        loadApiKey()
    }
    
    func saveKey() {
        validateApiKey()
        if isApiKeyValid {
            keyChain.set(apiKey, forKey: apiKeyKey)
            loadApiKey()
            print(savedApiKey)
        }
    }
    
    func loadApiKey() {
        if let savedApiKey = keyChain.get(apiKeyKey) {
            self.savedApiKey = savedApiKey
        }
    }
    // for tests
    func deleteKey() {
        keyChain.delete(apiKeyKey)
        apiKey = ""
        savedApiKey = ""
        isApiKeyValid = true
    }
    
    
    private func validateApiKey() {
          isApiKeyValid = !apiKey.isEmpty && apiKey.count >= 10
      }
    
}
