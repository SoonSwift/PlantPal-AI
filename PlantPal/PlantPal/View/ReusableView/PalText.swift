//
//  PalText.swift
//  PlantPal
//
//  Created by Marcin Dytko on 20/08/2024.
//

import SwiftUI

// MARK: - PalText

struct PalText: View {
    
    enum FontType: String {
        case regular = "Merriweather-Regular"
        case bold = "Merriweather-Bold"
        case italic = "Merriweather-Italic"
        case light = "Merriweather-Light"
    }

    enum FontSize: CGFloat {
        case small = 12
        case medium = 16
        case large = 18
        case extraLarge = 32
    }
    
    var text: String
    var fontType: FontType
    var size: FontSize
    
    init(text: String, fontType: FontType, size: FontSize) {
        self.text = text
        self.fontType = fontType
        self.size = size
    }

    var body: some View {
        Text(text)
            .font(.custom(fontType.rawValue, size: size.rawValue))
    }
}

#Preview {
    PalText(text: "da", fontType: .bold, size: .extraLarge)
}
