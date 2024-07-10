//
//  MainStack.swift
//  PlantPal
//
//  Created by Marcin Dytko on 10/07/2024.
//

import SwiftUI

struct MainStack<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            content
        }
    }
}

#Preview {
    MainStack {
        VStack {
            Text("Hello, World!")
        }
    }
}
