//
//  CoustomButton.swift
//  PlantPal
//
//  Created by Marcin Dytko on 09/07/2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(title)
                .font(.custom("Merriweather-Regular", size: 18))
                .padding(.all, 15)
                .padding(.horizontal, 30)
                .foregroundColor(Color("PlantColor"))
                .border(Color("PlantColor"), width: 3)
        }
    }
}

#Preview {
    CustomButton(title: "Let's go!", action: {})
}
