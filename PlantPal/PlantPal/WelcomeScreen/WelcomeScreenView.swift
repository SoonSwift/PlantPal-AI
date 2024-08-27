//
//  ContentView.swift
//  PlantPal
//
//  Created by Marcin Dytko on 07/07/2024.
//

import SwiftUI
// MARK: - VIEW

struct WelcomeScreenView: View {
    // MARK: - Properties
    
    @ObservedObject var viewModel: WelcomeScreenViewModel
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            MainStack {
                VStack {
                    Image(.plant)
                    
                    PalText(text: "PlantPal AI", fontType: .regular, size: .extraLarge)
                        .padding(.bottom, 8)
                    
                    PalText(text: "Your pocket botanist", fontType: .regular, size: .large)
                        .padding(.bottom, 4)
                    
                    PalDivider()
                    
                    PalText(text: """
                       Discover the world of plants at your
                       fingertips. Simply snap a photo, and
                       PlantPal AI instantly identifies plant species
                       """, fontType: .light, size: .medium)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    
                    PalText(text: """
                       We use OpenAI API. We do not charge any
                       fees, so we need your key to be able to
                       receive replies on your behalf
                       
                       We do not have access to your key!
                       """, fontType: .regular, size: .medium)
                    .multilineTextAlignment(.center)
                    
                    buildInputView()
                    
                    PalButton(title: "Let's go") {
                        viewModel.saveKey()
                    }
                    .padding(.top, 32)
                }
            }
        }
    }
    // MARK: - PRIVATE FUNCS
    
    private func buildInputView() -> some View {
        VStack(alignment: .leading) {
            PalText(text: "OpenAI Api key", fontType: .regular, size: .small)
            
            TextField("sk-proj-***************************", text: $viewModel.apiKey)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .textFieldStyle(.plain)
                .padding(8)
                .background(Color(.background))
                .border(viewModel.isApiKeyValid ? .black : .red, width: 1)
            
            if viewModel.isApiKeyValid == false {
                PalText(text: "Key is invalid", fontType: .regular, size: .small)
                    .foregroundColor(.red)
            }
        }
        .padding([.top, .horizontal], 8)
    }
}

#Preview {
    WelcomeScreenView(viewModel: WelcomeScreenViewModel(apiKeyService: ApiKeyService()))
}
