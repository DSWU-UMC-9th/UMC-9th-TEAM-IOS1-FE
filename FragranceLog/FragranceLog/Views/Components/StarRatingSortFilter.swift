//
//  StarRatingDropdown.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import SwiftUI

struct RatingSortFilter: View {
    @State private var isExpanded = false
    @State private var selected = "평점 높은 순"
    
    let onSelect: (String) -> Void

    private let mapping = [
        "평점 높은 순": "avgRateDesc",
        "평점 낮은 순": "avgRateAsc"
    ]

    var body: some View {

        let otherOption = (selected == "평점 높은 순") ? "평점 낮은 순" : "평점 높은 순"

        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                if isExpanded {
                    Button {
                        selected = otherOption

                        if let sortKey = mapping[selected] {
                            onSelect(sortKey)
                        }
                        withAnimation(.easeOut(duration: 0.25)) {
                            isExpanded = false
                        }
                    } label: {
                        HStack {
                            Text(otherOption)
                                .font(.robotoRegular12)
                                .foregroundColor(.color4)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        .frame(height: 25)
                        .background(glassBackground)
                    }
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .frame(width: 92)
            .offset(y: 25)

            Button {
                withAnimation(.easeOut(duration: 0.25)) {
                    isExpanded.toggle()
                }
            } label: {
                HStack(spacing: 4) {
                    Text(selected)
                        .font(.robotoRegular12)
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .resizable()
                        .frame(width: 6, height: 3)
                }
                .foregroundColor(.color4)
                .frame(width: 92, height: 25)
                .background(glassBackground)
            }
            .zIndex(1)
        }
        .frame(width: 92)
    }

    private var glassBackground: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)

            RoundedRectangle(cornerRadius: 6)
                .fill(Color(.color9).opacity(0.25))
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .padding(2)
        }
    }
}

#Preview {
    RatingSortFilter { sortKey in
        print("선택된 정렬키: \(sortKey)")
    }
}
