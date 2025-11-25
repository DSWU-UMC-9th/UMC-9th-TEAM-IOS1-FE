//
//  PerfumeItem.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import SwiftUI

struct PerfumeItem: View {
    var rating: Double
    var reviewCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(.imgPerfume1)
                .resizable()
                .frame(width: 148, height: 148)
                .cornerRadius(8)
            
            HStack(spacing: 4) {
                StarRating(size: .small, fixRating: rating)
                
                Text("\(String(format: "%.1f", rating)) (\(reviewCount))")
                    .font(.zen12)
            }
            .frame(height: 25)
                
            Text("향수 이름")
                .font(.robotoRegular14)
        }
        .foregroundColor(.color1)
    }
}

#Preview {
    PerfumeItem(rating: 3.5, reviewCount: 6)
}
