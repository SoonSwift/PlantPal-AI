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
    @StateObject private var viewModel = WelcomeScreenViewModel()

    var body: some Scene {
        WindowGroup {
            if viewModel.savedApiKey.isEmpty == false {
                ScanView()
                    .environmentObject(viewModel)
                
            } else {
                WelcomeScreen()
                    .environmentObject(viewModel)
            }
        }
    }
}
