//
//  ScanView.swift
//  PlantPal
//
//  Created by Marcin Dytko on 09/07/2024.
//

import SwiftUI

struct ScanView: View {
    @EnvironmentObject var viewModel: WelcomeScreenViewModel
    
    var body: some View {
        VStack {
            Text("\(viewModel.savedApiKey)")
            Button("Delete") {
                viewModel.deleteKey()
            }
        }
        .onAppear {
            viewModel.loadApiKey()
        }
        
    }
}

#Preview {
    ScanView()
}
