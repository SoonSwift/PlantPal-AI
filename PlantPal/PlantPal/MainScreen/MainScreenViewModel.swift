//
//  MainScreenViewModel.swift
//  PlantPal
//
//  Created by Marcin Dytko on 13/07/2024.
//

import Foundation
import SwiftUI

class MainScreenViewModel: ObservableObject {
    struct PalntItem: Identifiable {
        let image = "Plant"
        let id = UUID()
        let name: String
        let familyName: String
    }
    
    struct DisplayInfo {
        let list: [PalntItem]
    }
    
    enum State {
        case loading
        case empty
        case loaded(DisplayInfo)
    }
    
    private let apiKeyService: any ApiKeyServiceInterface
    
    @Published var state: State = .loaded(DisplayInfo(list: [PalntItem(name: "dwadwa", 
                                                                       familyName: "wawawa"), 
                                                             PalntItem(name: "wdada2121",
                                                                       familyName: "dwadwa2")]))
    
    init(apiKeyService: any ApiKeyServiceInterface) {
        self.apiKeyService = apiKeyService
    }
    
    func deleteKey() {
        apiKeyService.delete()
    }
}
