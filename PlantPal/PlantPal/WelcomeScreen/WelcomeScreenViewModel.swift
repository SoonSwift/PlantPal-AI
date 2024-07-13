import SwiftUI
import KeychainSwift

class WelcomeScreenViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var apiKey = ""
    @Published var isApiKeyValid: Bool = true

    private let apiKeyService: any ApiKeyServiceInterface
    private var isLoadingKey = false

    init(apiKeyService: any ApiKeyServiceInterface) {
        self.apiKeyService = apiKeyService
    }
    
    func saveKey() {
        validateApiKey()
        if isApiKeyValid {
            apiKeyService.save(apiKey)
        }
    }
    
    private func validateApiKey() {
        isApiKeyValid = !apiKey.isEmpty && apiKey.count >= 10
    }
}
