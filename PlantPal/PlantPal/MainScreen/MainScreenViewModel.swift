//
//  MainScreenViewModel.swift
//  PlantPal
//
//  Created by Marcin Dytko on 13/07/2024.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    private let apiKeyService: any ApiKeyServiceInterface
    
    init(apiKeyService: any ApiKeyServiceInterface) {
        self.apiKeyService = apiKeyService
    }
    
    func deleteKey() {
        apiKeyService.delete()
    }
}
