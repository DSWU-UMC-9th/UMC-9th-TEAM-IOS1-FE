//
//  StarRating.swift
//  FragranceLog
//
//  Created by 김미주 on 11/15/25.
//

import SwiftUI

enum StarSize {
    case small, medium

    var fill: ImageResource {
        switch self {
        case .small:
            return .imgFillS
        case .medium:
            return .imgFillM
        }
    }

    var empty: ImageResource {
        switch self {
        case .small:
            return .imgEmptyS
        case .medium:
            return .imgEmptyM
        }
    }

    var spacing: CGFloat {
        switch self {
        case .small:
            return -8
        case .medium:
            return -7
        }
    }
}

struct StarRating: View {
    var size: StarSize
    var fixRating: Double = 0

    @State var rating: Int = 0

    var body: some View {
        HStack(spacing: size.spacing) {
            let filledCount = max(0, min(5, Int(floor(fixRating))))
            let emptyCount = max(0, 5 - filledCount)

            ForEach(0..<filledCount, id: \.self) { _ in
                Image(size.fill)
            }
            ForEach(0..<emptyCount, id: \.self) { _ in
                Image(size.empty)
            }
        }
    }
}

#Preview {
    StarRating(size: .medium)
}
