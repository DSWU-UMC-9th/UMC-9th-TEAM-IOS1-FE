//
//  MainView.swift
//  FragranceLog
//
//  Created by 김미주 on 11/14/25.
//

import SwiftUI

struct MainView: View {
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
        .foregroundStyle(.black)
        .ignoresSafeArea()
    }
    
    private var TopGroup: some View {
        
        let recommended = [
            (rank: 1, name: "티어즈 프롬 더 문", image: "img_perfume1"),
            (rank: 2, name: "스프링타임 인 파크", image: "img_perfume1"),
            (rank: 3, name: "오 드 뚜왈렛 오데썽", image: "img_perfume1")
        ]
        
        return VStack(alignment: .leading, spacing: 16) {
            Text("지금 추천하는 향수")
                .font(.zen24)
            
            TabView {
                ForEach(recommended, id: \.rank) { item in
                    ZStack(alignment: .bottomLeading) {
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 205)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 2) {
                            Text("TOP \(item.rank).")
                                .font(.zen16)
                                .foregroundColor(.color1)

                            Text(item.name)
                                .font(.zen16)
                                .foregroundColor(.color1)
                        }
                        .padding(.leading, 20)
                        .padding(.bottom, 86)
                    }
                }
            }
            .frame(height: 205)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .tint(.color1)
        }
        .padding(.horizontal, 16)
        .padding(.top, 32)
    }
    
    private var ListGroup: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 7) {
                Text("향수 목록")
                    .font(.zen18)
                
                Spacer()
                
                RatingSortFilter()
            }
            .padding(.horizontal, 16)
        
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 24),
                    GridItem(.flexible(), spacing: 24)
                ],
                spacing: 16
            ) {
                ForEach(0..<10) { _ in
                    PerfumeItem(rating: 4.3, reviewCount: 6)
                }
            }
            .padding(.horizontal, 27)
        }
    }
}

#Preview {
    MainView()
}
