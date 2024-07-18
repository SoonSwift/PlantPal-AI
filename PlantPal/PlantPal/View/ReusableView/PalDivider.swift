//
//  PalDivider.swift
//  PlantPal
//
//  Created by Marcin Dytko on 18/07/2024.
//

import SwiftUI

struct PalDivider: View {
    var body: some View {
        Rectangle()
             .fill(Color(.divider))
             .frame(height: 1) // Ustawiamy tylko wysokość
             .padding(.bottom, 8)
    }
}

#Preview {
    PalDivider()
}
