//
//  ContentView.swift
//  PlantPal
//
//  Created by Marcin Dytko on 07/07/2024.
//

import SwiftUI
// MARK: - VIEW

struct WelcomeScreen: View {
    // MARK: - Properties
    
    @EnvironmentObject private var viewModel: WelcomeScreenViewModel
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    Image("Plant")
                    
                    Text("PlantPal AI")
                        .font(.custom("Merriweather-Regular", size: 32))
                        .padding(.bottom, 8)
                    
                    Text("Your pocket botanist")
                        .font(.custom("Merriweather-Regular", size: 18))
                        .padding(.bottom, 4)
                    
                    Divider()
                        .padding(.bottom, 8)
                    
                    Text("""
                    Discover the world of plants at your
                    fingertips. Simply snap a photo, and
                    PlantPal AI instantly identfies plant species
                    """)
                    .font(.custom("Merriweather-Light", size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                    
                    Text("""
                    We use OpenAI API. We do not charge any
                    fees, so we need your ket to be able to
                    recvie replies on your behalf
                    
                    We do not have access to your key!
                    """)
                    .font(.custom("Merriweather-Regular", size: 16))
                    .multilineTextAlignment(.center)
                    VStack(alignment: .leading) {
                        
                        Text("OpenAI Api key")
                            .padding([.top,.horizontal], 8)
                            .font(.custom("Merriweather-Regular", size: 12))
                        
                        TextField("sk-proj-***************************", text: $viewModel.apiKey)
                            .textFieldStyle(.plain)
                            .padding(8)
                            .background(Color("BackgroundColor"))
                            .border(viewModel.isApiKeyValid ? .black : .red, width: 1)
                            .padding(.horizontal, 8)
                        
                        if viewModel.isApiKeyValid == false {
                            Text("Key is invalid")
                                .padding(.horizontal, 8)
                                .foregroundColor(.red)
                                .font(.custom("Merriweather-Regular", size: 12))
                        }
                    }
                    
                    CustomButton(title: "Let's go") {
                        viewModel.saveKey()
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW

#Preview {
    WelcomeScreen()
        .environmentObject(WelcomeScreenViewModel())
}
