//
//  InputView.swift
//  FragranceLog
//
//  Created by 황민지 on 11/23/25.
//

import SwiftUI

struct InputView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding(.vertical, 11.5)
            .padding(.horizontal, 16)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.color8), lineWidth: 1)
            )
    }
}
