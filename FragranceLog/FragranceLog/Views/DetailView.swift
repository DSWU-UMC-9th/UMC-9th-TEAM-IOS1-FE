//
//  DetailView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct DetailView: View {
    let perfumeId: Int
    @StateObject private var vm = DetailViewModel()

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
    }

    private var TopGroup: some View {
        HStack(spacing: 7) {
            Text("향수이름 향수이름 향수이름 향수이름")
                .font(.zen20)
                .lineLimit(1)

            Spacer()

            ZStack {
                HStack(spacing: 7) { // TODO: 별점
                    StarRating(size: .medium, fixRating: 2.1)
                    Text("2.1")
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
                    Text("브랜드이름")
                        .font(.zen18)
                        .lineLimit(1)

                    Text("가격 (ML)")
                        .font(.zen12)
                }
                .padding(.top, 5)

                Text("향기로운 세제로 갓 세탁을 마친 옷감이 쌓인 빨래 바구니, 뽀송한 이불 속에 들어가는 그 느낌을 매혹적으로 담아낸 블랑쉬 오 드 퍼퓸은 산뜻하고 깨끗한 섬유와 연인들의 친밀하고도 매력적인 손길, 그리고 살결의 향기를 담아냅니다.")
                    .font(.robotoLight12)
                    .lineSpacing(4.8)
            }
        }
        .padding(.horizontal, 11)
    }

    private var ReviewGroup: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("향수 리뷰 (12)")
                .font(.zen18)
                .frame(height: 42)
                .padding(.leading, 4)

            VStack(spacing: 16) {
                ReviewButton(vm: vm, perfumeId: perfumeId)

                ReviewItem(rating: 3.5, vm: vm)

                ReviewItem(rating: 4.5, vm: vm)
            }
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 50)
    }
}

#Preview {
    DetailView(perfumeId: 2)
}
