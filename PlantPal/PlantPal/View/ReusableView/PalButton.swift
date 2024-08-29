//
//  CoustomButton.swift
//  PlantPal
//
//  Created by Marcin Dytko on 09/07/2024.
//

import SwiftUI

struct PalButton: View {
    // MARK: - PROPERTIES

    private let title: String
    private let action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    // MARK: - BODY

    var body: some View {
        Button(action: {
            self.action()
        }
        ){
            Text(title)
                .font(.custom("Merriweather-Regular", size: 18))
                .padding(.all, 15)
                .padding(.horizontal, 30)
                .foregroundColor(Color(.plant))
                .border(Color(.plant), width: 3)
        }
    }
}
// MARK: - PREVIEW

#Preview {
    PalButton(title: "Let's go!", action: {})
}
