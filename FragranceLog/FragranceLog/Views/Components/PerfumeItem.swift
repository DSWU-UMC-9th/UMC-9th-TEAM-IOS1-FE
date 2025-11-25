//
//  PerfumeItem.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import SwiftUI
import Kingfisher

struct PerfumeItem: View {
    let imageUrl: String
    let name: String
    let rating: Double
    let reviewCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            KFImage(URL(string: "https://www.tenma.store\(imageUrl)"))
                .placeholder {
                    Color.gray.opacity(0.2)
                }
                .resizable()
                .scaledToFill()
                .frame(width: 148, height: 148)
                .cornerRadius(8)

            HStack(spacing: 4) {
                StarRating(size: .small, fixRating: rating)

                Text("\(String(format: "%.1f", rating)) (\(reviewCount))")
                    .font(.zen12)
            }
            .frame(height: 25)

            Text(name)
                .font(.robotoRegular14)
                .lineLimit(1)
        }
        .foregroundColor(.color1)
    }
}

#Preview {
    PerfumeItem(
        imageUrl: "/images/티어즈_프롬_더_문.jpg",
        name: "티어즈 프롬 더 문",
        rating: 4.6,
        reviewCount: 5
    )
}
