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
            
            switch viewModel.state {
            case .loading:
                EmptyView()
            case .empty:
                
                VStack {
                    PalText(text: "Recent scans", fontType: .regular, size: .extraLarge)
                    
                    Spacer()
                    Image(.emptyBox)
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 24)
                    
                    PalText(text: "You don't have any scnas yet",
                            fontType: .regular, size: .medium)
                    .padding(.bottom, 8)
                    
                    PalButton(title: "Scan") {
                        
                    }
                    Spacer()
                    Spacer()
                    
                    Button("Delete") {
                        viewModel.deleteKey()
                    }
                }
                
            case .loaded(let displayInfo):
                VStack {
                    ScrollView {
                        PalText(text: "Recent scans", 
                                fontType: .regular, size: .extraLarge)
                            .padding(.top)
                        
                        VStack(alignment: .leading) {
                            ForEach(displayInfo.list, id: \.id) { plant in
                                HStack {
                                    Image(plant.image)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                    
                                    VStack(alignment: .leading) {
                                        PalText(text: plant.name,
                                                fontType: .bold, size: .large)
                                        .padding(.bottom, 2)
                                        
                                        PalText(text: plant.familyName,
                                                fontType: .regular, size: .small)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                PalDivider(color: .mainView)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                    Spacer()
                    PalButton(title: "Scan") {
                    }
                    .padding(.bottom, 20)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

#Preview {
    MainScreenView(viewModel: MainScreenViewModel(apiKeyService: ApiKeyService()))
}
