//
//  PlantPalApp.swift
//  PlantPal
//
//  Created by Marcin Dytko on 07/07/2024.
//

import SwiftUI

@main
struct PlantPalApp: App {
    // MARK: - PROPERTIES
    
    let apiKeyService: ApiKeyServiceInterface = ApiKeyService()

    var body: some Scene {
        WindowGroup {
            // Poczytaj o tym jak obserwować wartość klucza
            if apiKeyService.get() != nil {
                MainScreenView()
            } else {
                WelcomeScreenView(viewModel: WelcomeScreenViewModel(keychainService: apiKeyService))
            }
        }
    }
}
