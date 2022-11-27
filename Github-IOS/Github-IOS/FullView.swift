//
//  FullView.swift
//  Github-IOS
//
//  Created by groo on 24/11/2022.
//

import SwiftUI

struct FullView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .topLeading)
    }
}

extension View {
    func fullscreen() -> some View {
        self.modifier(FullView())
    }
}

