//
//  PalDivider.swift
//  PlantPal
//
//  Created by Marcin Dytko on 18/07/2024.
//

import SwiftUI

struct PalDivider: View {
    
    enum divaiderColor: String {
        case mainView = "DividerColor"
        case welcomeScreen = "DividerMainScreen"
    }
    
    var color: divaiderColor
    
    var body: some View {
        Rectangle()
            .fill(Color(color.rawValue))
             .frame(height: 1) // Ustawiamy tylko wysokość
             .padding(.bottom, 8)
    }
}

#Preview {
    PalDivider(color: .mainView)
}
