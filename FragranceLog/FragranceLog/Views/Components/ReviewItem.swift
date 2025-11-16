//
//  ReviewItem.swift
//  FragranceLog
//
//  Created by 김미주 on 11/17/25.
//

import SwiftUI

struct ReviewItem: View {
    var rating: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            StarRating(size: .medium, fixRating: rating)

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
        .glassEffect(in: .rect(cornerRadius: 30))
    }
}

#Preview {
    ReviewItem(rating: 3.5)
}
