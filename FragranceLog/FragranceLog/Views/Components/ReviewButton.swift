//
//  ReviewButton.swift
//  FragranceLog
//
//  Created by 김미주 on 11/17/25.
//

import SwiftUI

struct ReviewButton: View {
    @ObservedObject var vm: DetailViewModel

    var body: some View {
        if vm.writeMode {
            writeFormView
        } else if vm.isCompleted {
            completedReviewView
        } else {
            writeStartButton
        }
    }

    // MARK: - 작성/수정 폼 뷰

    private var writeFormView: some View {
        VStack(spacing: 13) {
            HStack(spacing: 1) {
                ForEach(0 ..< 5, id: \.self) { index in
                    Button(action: {
                        vm.score = index + 1
                    }) {
                        Image(index < vm.score ? .imgFillL : .imgEmptyL)
                            .frame(width: 38, height: 40)
                            .glassEffect()
                    }
                    .buttonStyle(.plain)
                }
            }

            TextEditor(text: $vm.content)
                .font(.robotoRegular16)
                .frame(height: 110)
                .scrollContentBackground(.hidden)
                .background(alignment: .topLeading) {
                    if vm.content.isEmpty {
                        Text("리뷰를 남겨주세요!")
                            .font(.robotoRegular16)
                            .foregroundStyle(.gray)
                            .padding(8)
                    }
                }

            HStack {
                Spacer()

                Text("\(vm.content.count)/1,000")
                    .font(.robotoRegular14)
                    .foregroundStyle(.gray)
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
                    .onChange(of: vm.content) {
                        if vm.content.count > 1000 {
                            vm.content = String(vm.content.prefix(1000))
                        }
                    }
            }

            HStack {
                Text(vm.currentMaskedUsername)

                Spacer()

                Button(action: {
                    if vm.isCompleted, let myId = vm.myReviewId {
                        vm.patchReview(reviewId: myId)
                    } else {
                        vm.postReview()
                    }

                    withAnimation {
                        vm.writeMode = false
                        vm.isCompleted = true
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
    }

    // MARK: - 내 리뷰 카드 뷰

    private var completedReviewView: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                StarRating(size: .medium, fixRating: Double(vm.score))
                Spacer()
                Button(action: {
                    withAnimation {
                        vm.writeMode = true
                    }
                }) {
                    Text("수정하기")
                        .foregroundStyle(.color1)
                        .font(.robotoRegular16)
                        .frame(width: 70, height: 34)
                        .glassEffect(in: .rect(cornerRadius: 8))
                }
            }
            .frame(height: 37)

            Text(vm.content)
                .font(.zen16)
                .padding(.vertical, 10)

            HStack {
                Text(vm.currentMaskedUsername)
                    .font(.zen16)
                Spacer()
                Text(vm.myReview?.updatedDate ?? "—")
                    .font(.zen16)
            }
            .padding(.vertical, 10)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .glassEffect(
            .regular.tint(.color9.opacity(0.4)),
            in: .rect(cornerRadius: 30)
        )
    }

    // MARK: - 후기 작성하기 버튼

    private var writeStartButton: some View {
        Button(action: {
            withAnimation {
                vm.writeMode = true
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
