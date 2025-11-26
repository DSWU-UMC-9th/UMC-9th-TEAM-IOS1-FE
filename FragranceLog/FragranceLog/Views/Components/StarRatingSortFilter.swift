//
//  StarRatingDropdown.swift
//  FragranceLog
//
//  Created by 황민지 on 11/24/25.
//

import SwiftUI

enum SortType {
    case star, new

    var first: String {
        switch self {
        case .star: "평점 높은 순"
        case .new: "최신 순"
        }
    }

    var firstEng: String {
        switch self {
        case .star: "avgRateAsc"
        case .new: "old"
        }
    }

    var second: String {
        switch self {
        case .star: "평점 낮은 순"
        case .new: "오래된 순"
        }
    }

    var secondEng: String {
        switch self {
        case .star: "avgRateDesc"
        case .new: "new"
        }
    }
}

struct RatingSortFilter: View {
    let sortType: SortType
    let onSelect: (String) -> Void

    @State private var isExpanded = false
    @State private var selectedKey: String

    init(
        sortType: SortType,
        initialUseFirst: Bool = true,
        onSelect: @escaping (String) -> Void
    ) {
        self.sortType = sortType
        self.onSelect = onSelect

        _selectedKey = State(initialValue: initialUseFirst ? sortType.firstEng : sortType.secondEng)
    }

    private var selectedText: String {
        selectedKey == sortType.firstEng ? sortType.first : sortType.second
    }

    private var otherText: String {
        selectedKey == sortType.firstEng ? sortType.second : sortType.first
    }

    private var otherKey: String {
        selectedKey == sortType.firstEng ? sortType.secondEng : sortType.firstEng
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                if isExpanded {
                    Button {
                        selectedKey = otherKey
                        onSelect(otherKey)

                        withAnimation(.easeOut(duration: 0.25)) {
                            isExpanded = false
                        }
                    } label: {
                        HStack {
                            Text(otherText)
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
                    Text(selectedText)
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
    RatingSortFilter(sortType: .new) { sortKey in
        print("선택된 정렬키: \(sortKey)")
    }
}
