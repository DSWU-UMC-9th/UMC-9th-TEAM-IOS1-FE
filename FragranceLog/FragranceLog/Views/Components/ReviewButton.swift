//
//  ReviewButton.swift
//  FragranceLog
//
//  Created by 김미주 on 11/17/25.
//

import SwiftUI

struct ReviewButton: View {
    @State var writeMode: Bool = false
    @State var review: String = ""

    var body: some View {
        if writeMode {
            VStack(spacing: 13) {
                StarRating(size: .large)

                TextEditor(text: $review)
                    .font(.robotoRegular16)
                    .frame(height: 110)
                    .scrollContentBackground(.hidden)
                    .background(alignment: .topLeading) {
                        if review.isEmpty {
                            Text("리뷰를 남겨주세요!")
                                .font(.robotoRegular16)
                                .foregroundStyle(.gray)
                                .padding(8)
                        }
                    }

                HStack {
                    Spacer()

                    Text("\(review.count)/1,000")
                        .font(.robotoRegular14)
                        .foregroundStyle(.gray)
                        .padding(.trailing, 15)
                        .padding(.bottom, 15)
                        .onChange(of: review) {
                            if review.count > 1000 {
                                review = String(review.prefix(1000))
                            }
                        }
                }

                HStack {
                    Text("iddd****")

                    Spacer()

                    Button(action: {
                        // TODO: 댓글 등록
                        withAnimation {
                            writeMode.toggle()
                        }
                    }) {
                        Text("등록")
                            .font(.robotoRegular16)
                            .frame(width: 70, height: 34)
                            .glassEffect(in: .rect(cornerRadius: 8))
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18.5)
            .foregroundStyle(.color1)
            .glassEffect(.regular.tint(.color9.opacity(0.8)), in: .rect(cornerRadius: 20))
        } else {
            Button(action: {
                withAnimation {
                    writeMode.toggle()
                }
            }) {
                HStack(spacing: 10) {
                    Image(.iconPlus)
                    Text("후기 작성하기")
                        .font(.zen16)
                        .foregroundStyle(.color1)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .glassEffect(.regular.tint(.color9.opacity(0.6)))
            }
        }
    }
}

#Preview {
    ReviewButton()
}
