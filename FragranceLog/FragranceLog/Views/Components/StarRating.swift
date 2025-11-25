//
//  StarRating.swift
//  FragranceLog
//
//  Created by 김미주 on 11/15/25.
//

import SwiftUI

enum StarSize {
    case small, medium, large

    var fill: ImageResource {
        switch self {
        case .small:
            return .imgFillS
        case .medium:
            return .imgFillM
        case .large:
            return .imgFillL
        }
    }

    var empty: ImageResource {
        switch self {
        case .small:
            return .imgEmptyS
        case .medium:
            return .imgEmptyM
        case .large:
            return .imgEmptyL
        }
    }

    var spacing: CGFloat {
        switch self {
        case .small:
            return -8
        case .medium:
            return -7
        case .large:
            return 1
        }
    }
}

struct StarRating: View {
    var size: StarSize
    var fixRating: Double = 0

    @State var rating: Int = 0

    var body: some View {
        HStack(spacing: size.spacing) {
            if size == .large {
                ForEach(0..<5, id: \.self) { index in
                    Button(action: {
                        rating = index + 1
                    }) {
                        Image(index < rating ? size.fill : size.empty)
                            .frame(width: 38, height: 40)
                            .glassEffect()
                    }
                    .buttonStyle(.plain)
                }
            } else {
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
}

#Preview {
    StarRating(size: .large)
}
