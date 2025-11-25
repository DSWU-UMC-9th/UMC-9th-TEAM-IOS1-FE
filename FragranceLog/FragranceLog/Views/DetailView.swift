//
//  DetailView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct DetailView: View {
    let perfumeId: Int
    @StateObject private var vm: DetailViewModel

    init(perfumeId: Int) {
        self.perfumeId = perfumeId
        _vm = StateObject(wrappedValue: DetailViewModel(perfumeId: perfumeId))
    }

    var body: some View {
        ZStack {
            Color.color3

            VStack(spacing: 0) {
                Header()

                ScrollView {
                    TopGroup

                    Spacer().frame(height: 16)

                    InfoGroup

                    Spacer().frame(height: 32)

                    ReviewGroup
                }
                .scrollIndicators(.hidden)
            }
        }
        .foregroundStyle(.black)
        .ignoresSafeArea()
        .task {
            vm.getDetail()
        }
        .navigationBarBackButtonHidden()
    }

    private var TopGroup: some View {
        HStack(spacing: 7) {
            Text(vm.name)
                .font(.zen20)
                .lineLimit(1)

            Spacer()

            ZStack {
                HStack(spacing: 7) {
                    StarRating(size: .medium, fixRating: vm.averageRating)
                    Text(String(format: "%.1f", vm.averageRating))
                        .font(.zen16)
                        .padding(.top, 5)
                }
                .frame(width: 180, height: 37)
                .padding(.horizontal, 11)
                .background(
                    RoundedRectangle(cornerRadius: 18.5)
                        .fill(.color3)
                        .glassEffect()
                )
            }
        }
        .frame(height: 45)
        .padding(.horizontal, 16)
        .padding(.top, 17)
    }

    private var InfoGroup: some View {
        HStack(alignment: .top, spacing: 38) {
            Image(.imgPerfume1)
                .resizable()
                .scaledToFill()
                .frame(width: 155, height: 230)
                .clipShape(
                    RoundedRectangle(cornerRadius: 8)
                )

            VStack(alignment: .leading, spacing: 13) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(vm.brand)")
                        .font(.zen18)
                        .lineLimit(1)

                    Text("\(vm.price)")
                        .font(.zen12)
                }
                .padding(.top, 5)

                Text("\(vm.description)")
                    .font(.robotoLight12)
                    .lineSpacing(4.8)
            }
        }
        .padding(.horizontal, 11)
    }

    private var ReviewGroup: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("향수 리뷰 (\(vm.reviewCount))")
                .font(.zen18)
                .frame(height: 42)
                .padding(.leading, 4)

            VStack(spacing: 16) {
                ReviewButton(vm: vm)

                ForEach(vm.reviews, id: \.id) { review in
                    ReviewItem(item: review, vm: vm)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 50)
    }
}

#Preview {
    DetailView(perfumeId: 2)
}
