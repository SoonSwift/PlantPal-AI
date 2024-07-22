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
    @ObservedObject var apiKeyService = ApiKeyService()

    var body: some Scene {
        WindowGroup {
            if apiKeyService.apiKeySet {
                MainScreenView(viewModel: MainScreenViewModel(apiKeyService: apiKeyService))
            } else {
                WelcomeScreenView(
                    viewModel: WelcomeScreenViewModel(apiKeyService: apiKeyService)
                )
            }
        }
    }
}
