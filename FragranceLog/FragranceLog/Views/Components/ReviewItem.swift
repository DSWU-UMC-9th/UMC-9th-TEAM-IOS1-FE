//
//  ReviewItem.swift
//  FragranceLog
//
//  Created by 김미주 on 11/17/25.
//

import SwiftUI

struct ReviewItem: View {
    var rating: Int
    var isOwn: Bool = false
    @StateObject var vm: DetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                StarRating(size: .medium, fixRating: Double(rating))
                Spacer()
                if isOwn {
                    Button(action: {
                        vm.writeMode.toggle()
                    }) {
                        Text("수정하기")
                            .foregroundStyle(.color1)
                            .font(.robotoRegular16)
                            .frame(width: 70, height: 34)
                            .glassEffect(in: .rect(cornerRadius: 8))
                    }
                }
            }
            .frame(height: 37)

            Text("리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성 리뷰 작성")
                .font(.zen16)
                .padding(.vertical, 10)

            HStack {
                Text("iddd****")
                    .font(.zen16)
                Spacer()
                Text("2025. 01. 01")
                    .font(.zen16)
            }
            .padding(.vertical, 10)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .glassEffect(
            .regular.tint(isOwn ? .color9.opacity(0.4) : .clear),
            in: .rect(cornerRadius: 30)
        )
    }
}

// #Preview {
//    ReviewItem(rating: 3.5)
// }
