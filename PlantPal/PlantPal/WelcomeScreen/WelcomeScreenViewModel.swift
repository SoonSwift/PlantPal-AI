import SwiftUI
import KeychainSwift

class WelcomeScreenViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var apiKey = ""
    @Published var isApiKeyValid: Bool = true

    private let keychainService: ApiKeyServiceInterface
    
    init(keychainService: ApiKeyService) {
        self.keychainService = keychainService
        loadApiKey()
    }
    
    func saveKey() {
        validateApiKey()
        if isApiKeyValid {
            keychainService.saveApiKey(apiKey)
            isKeyValidAndSaved = true
        }
    }
    
    func loadApiKey() {
        if let savedApiKey = keychainService.loadApiKey() {
            self.apiKey = savedApiKey
        }
    }
    // MARK: - TEST FUNC
    func deleteKey() {
        keychainService.deleteApiKey()
        apiKey = ""
        isApiKeyValid = true
        isKeyValidAndSaved = false
    }
    
    private func validateApiKey() {
        isApiKeyValid = !apiKey.isEmpty && apiKey.count >= 10
    }
}
