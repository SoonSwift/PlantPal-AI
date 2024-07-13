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
    @StateObject var viewModel: WelcomeScreenViewModel = 
    WelcomeScreenViewModel(keychainService: ApiKeyService())

    var body: some Scene {
        WindowGroup {
            // Poczytaj o tym jak obserwować wartość klucza
            if viewModel.loadApiKey() {
                MainScreenView()
            } else {
                WelcomeScreenView(viewModel: viewModel)
                    .onAppear {
                        viewModel.loadApiKey()
                    }
            }
        }
    }
}
