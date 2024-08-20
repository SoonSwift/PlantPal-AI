//
//  PalText.swift
//  PlantPal
//
//  Created by Marcin Dytko on 20/08/2024.
//

import SwiftUI

// MARK: - PalText

struct PalText: View {
    private let text: String
    private let fontType: FontType
    private let size: CGFloat

    init(text: String, fontType: FontType, size: CGFloat) {
        self.text = text
        self.fontType = fontType
        self.size = size
    }
    
    var body: some View {
        Text(text)
            .font(.custom(fontType.fontName, size: size))
    }
}

enum FontType {
    case regular
    case bold
    case italic
    case light
    
    var fontName: String {
        switch self {
        case .regular:
            return "Merriweather-Regular"
        case .bold:
            return "Merriweather-Bold"
        case .italic:
            return "Merriweather-Italic"
        case .light:
            return "Merriweather-Light"
        }
    }
}

#Preview {
    PalText(text: "da", fontType: .bold, size: 32)
}
