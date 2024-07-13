import SwiftUI
import KeychainSwift

class WelcomeScreenViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var apiKey = ""
    @Published var isApiKeyValid: Bool = true

    private let keychainService: ApiKeyService
    private var isLoadingKey = false

    init(keychainService: ApiKeyService) {
        self.keychainService = keychainService
    }
    
    func saveKey() {
        validateApiKey()
        if isApiKeyValid {
            keychainService.save(apiKey)
            loadApiKey()
        }
    }
    
    @discardableResult
    func loadApiKey() -> Bool {
        guard !isLoadingKey else {
            print("loadApiKey skipped because isLoadingKey is true")
            return false
        }
        
        isLoadingKey = true
        defer { isLoadingKey = false }
        
        if let savedApiKey = keychainService.get() {
            DispatchQueue.main.async {
                if self.apiKey != savedApiKey {
                    self.apiKey = savedApiKey
                    print("apiKey loaded and set to: \(savedApiKey)")
                }
            }
            return true
        }
        return false
    }
    
    // MARK: - TEST FUNC
    func deleteKey() {
        keychainService.delete()
        DispatchQueue.main.async {
            self.apiKey = ""
            self.isApiKeyValid = true
        }
    }
    
    private func validateApiKey() {
        isApiKeyValid = !apiKey.isEmpty && apiKey.count >= 10
    }
}
