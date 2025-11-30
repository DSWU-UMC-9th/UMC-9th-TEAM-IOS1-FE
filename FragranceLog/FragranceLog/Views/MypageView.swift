//
//  MypageView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct MypageView: View {
    @StateObject private var vm = MypageViewModel()

    var body: some View {
        ZStack {
            Color.color3

            VStack {
                Header()

                Text(vm.id)
                    .font(.zen24)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 16)

                HStack {
                    Text("내가 작성한 리뷰 (\(vm.reviews.count))")
                        .font(.zen24)
                    Spacer()

                    RatingSortFilter(sortType: .new) { sortKey in
                        vm.getReviews(order: sortKey)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(vm.reviews, id: \.id) { item in
                            MyReviewItem(item: item, vm: vm)
                        }
                    }
                    .padding(.bottom, 30)
                }
                .padding(.horizontal, 12)
                .scrollIndicators(.hidden)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .task {
            vm.getMe()
            vm.getReviews(order: "new")
        }
    }
}

#Preview {
    MypageView()
}
