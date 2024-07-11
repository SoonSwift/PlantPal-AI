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
    @StateObject private var viewModel = WelcomeScreenViewModel(keychainService: KeychainService())

    var body: some Scene {
        WindowGroup {
            if viewModel.isKeyValidAndSaved {
                MainScreenView()
                    .environmentObject(viewModel)
            } else {
                WelcomeScreenView()
                    .environmentObject(viewModel)
            }
        }
    }
}
