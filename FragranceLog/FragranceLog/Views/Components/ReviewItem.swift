//
//  ReviewItem.swift
//  FragranceLog
//
//  Created by 김미주 on 11/17/25.
//

import SwiftUI

struct ReviewItem: View {
    var isOwn: Bool = false
    var item: ReviewResponseData
    @ObservedObject var vm: DetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                StarRating(size: .medium, fixRating: Double(item.rating))
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

            Text("\(item.content)")
                .font(.zen16)
                .padding(.vertical, 10)

            HStack {
                Text("\(item.maskedUsername)")
                    .font(.zen16)
                Spacer()
                Text("\(item.updatedDate)")
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
