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
        VStack(alignment: .leading, spacing: 16) {
            Text("지금 추천하는 향수")
                .font(.zen24)
            
            ZStack(alignment: .bottomLeading) {
                Image("img_perfume1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 205)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(8)

                VStack(alignment: .leading) {
                    Text("TOP 1.")
                        .font(.zen16)
                        .foregroundColor(.color1)
                    Text("향수 이름")
                        .font(.zen16)
                        .foregroundColor(.color1)
                }
                .padding(.leading, 20)
                .padding(.bottom, 86)
            }
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
