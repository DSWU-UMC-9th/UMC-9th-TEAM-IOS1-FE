//
//  MainView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.color3

            VStack {
                Header()

                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
