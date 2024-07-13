//
//  ScanView.swift
//  PlantPal
//
//  Created by Marcin Dytko on 09/07/2024.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var viewModel: MainScreenViewModel
    
    var body: some View {
        MainStack {
            VStack {
                Text("MainScreen")
                Button("Delete") {
                    viewModel.deleteKey()
                }
            }
        }
    }
}
