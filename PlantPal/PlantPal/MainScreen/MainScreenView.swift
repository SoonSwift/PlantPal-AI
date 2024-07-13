//
//  ScanView.swift
//  PlantPal
//
//  Created by Marcin Dytko on 09/07/2024.
//

import SwiftUI

struct MainScreenView: View {
    // THIS MODEL IS FOR TEST IT WILL BE REMOVED IN NEXT TASK
//    @ObservedObject var viewModel: WelcomeScreenViewModel
    
    var body: some View {
        MainStack {
            VStack {
                
                
                Text("R")
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
