//
//  ScanView.swift
//  PlantPal
//
//  Created by Marcin Dytko on 09/07/2024.
//

import SwiftUI

struct MainScreenView: View {
//    var viewModel: WelcomeScreenViewModel
    
    var body: some View {
        MainStack {
            VStack {
                Text("\(viewModel.apiKey)")
                Button("Delete") {
//                    viewModel.deleteKey()
                }
            }
            .onAppear {
//                viewModel.loadApiKey()
            }
        }
    }
}

#Preview {
    MainScreenView()
}
