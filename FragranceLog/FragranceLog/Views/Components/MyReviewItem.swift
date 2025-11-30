//
//  MyReviewItem.swift
//  FragranceLog
//
//  Created by 김미주 on 11/26/25.
//

import SwiftUI

struct MyReviewItem: View {
    var item: ReviewResponseData
    @ObservedObject var vm: MypageViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                StarRating(size: .medium, fixRating: Double(item.rating))
                Spacer()

                Button(action: {
                    // TODO: action
                }) {
                    Text("수정하기")
                        .foregroundStyle(.color1)
                        .font(.robotoRegular16)
                        .frame(width: 70, height: 34)
                        .glassEffect(in: .rect(cornerRadius: 8))
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
            .regular.tint(.clear),
            in: .rect(cornerRadius: 30)
        )
    }
}

//
// #Preview {
//    MyReviewItem()
// }
