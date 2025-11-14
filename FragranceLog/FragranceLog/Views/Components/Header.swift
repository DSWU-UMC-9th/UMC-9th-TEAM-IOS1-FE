//
//  Header.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct Header: View {
    var body: some View {
        // TODO: 네비게이션으로 변경
        HStack {
            Image(.logoSmall)

            Spacer()

            Image(.iconMypage)
        }
        .padding(.top, 80)
        .padding(.horizontal, 24)
    }
}

#Preview {
    Header()
}
