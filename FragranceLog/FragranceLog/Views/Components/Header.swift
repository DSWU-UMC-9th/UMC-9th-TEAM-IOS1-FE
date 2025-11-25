//
//  Header.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var router: NavigationRouter<MainRoute>

    var body: some View {
        // TODO: 네비게이션으로 변경
        HStack {
            Button(action: {
                router.push(.main)
            }) {
                Image(.logoSmall)
            }

            Spacer()

            Button(action: {
                router.push(.mypage)
            }) {
                Image(.iconMypage)
            }
        }
        .padding(.top, 80)
        .padding(.horizontal, 24)
    }
}

#Preview {
    Header()
}
