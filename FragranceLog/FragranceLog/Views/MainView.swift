//
//  MainView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import Kingfisher
import SwiftUI

struct MainView: View {
    @EnvironmentObject var router: NavigationRouter<MainRoute>
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        ZStack {
            Color.color3

            VStack {
                Header()

                ScrollView {
                    VStack(spacing: 32) {
                        TopGroup

                        ListGroup
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .scrollIndicators(.hidden)
            }
        }
        .onAppear {
            viewModel.fetchRecommendations()
            viewModel.fetchSortedPerfumes(sort: "avgRateDesc")
        }
        .foregroundStyle(.black)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }

    private var TopGroup: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("지금 추천하는 향수")
                .font(.zen24)
                .padding(.horizontal, 16)

            if viewModel.recommendations.isEmpty {
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(height: 205)
                    .cornerRadius(8)
                    .overlay(Text("불러오는 중..."))
                    .padding(.horizontal, 16)
            } else {
                TabView {
                    ForEach(Array(viewModel.recommendations.enumerated()), id: \.element.id) { index, item in
                        ZStack(alignment: .bottomLeading) {
                            KFImage(URL(string: "https://www.tenma.store\(item.imageUrl)"))
                                .placeholder {
                                    ProgressView()
                                }
                                .resizable()
                                .scaledToFill()
                                .frame(height: 205)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(8)

                            VStack(alignment: .leading, spacing: 2) {
                                Text("TOP \(index + 1).")
                                Text(item.name)
                            }
                            .font(.robotoRegular16)
                            .foregroundColor(.color1)
                            .padding(.leading, 20)
                            .padding(.bottom, 86)
                        }
                    }
                }
                .frame(height: 205)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                .padding(.horizontal, 16)
            }
        }
        .padding(.top, 32)
    }

    private var ListGroup: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 7) {
                Text("향수 목록")
                    .font(.zen18)

                Spacer()

                RatingSortFilter { sortKey in
                    viewModel.fetchSortedPerfumes(sort: sortKey)
                }
            }
            .padding(.horizontal, 16)

            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 24),
                    GridItem(.flexible(), spacing: 24)
                ],
                spacing: 16
            ) {
                if viewModel.isSortedLoading {
                    ProgressView()
                } else {
                    ForEach(viewModel.sortedList) { perfume in
                        Button {
                            router.push(.detail(perfumeId: perfume.id))
                        } label: {
                            PerfumeItem(
                                imageUrl: perfume.imageUrl,
                                name: perfume.name,
                                rating: perfume.averageRating,
                                reviewCount: perfume.reviewCount
                            )
                        }
                    }
                }
            }
            .padding(.horizontal, 27)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(NavigationRouter<MainRoute>())
}
