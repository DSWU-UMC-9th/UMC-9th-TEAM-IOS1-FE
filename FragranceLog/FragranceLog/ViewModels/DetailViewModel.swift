//
//  DetailViewModel.swift
//  FragranceLog
//
//  Created by 김미주 on 11/25/25.
//

import Combine
import Foundation
import Moya

class DetailViewModel: ObservableObject {
    @Published var score: Int = 0
    @Published var content: String = ""

    private let userId: Int = 3 // TODO: 데이터가져오기
    private let provider = APIManager.shared.createProvider(for: ReviewRouter.self)

    private var reviewData: ReviewData {
        ReviewData(score: score, content: content)
    }

    func postReview(perfumeId: Int) {
        provider.request(.postReview(perfumeId: perfumeId, userId: userId, data: reviewData)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try? JSONDecoder().decode(ReviewResponse.self, from: response.data)
                } catch {
                    print("postReview 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("postReview API 오류: \(error)")
            }
        }
    }

    func patchReview(perfumeId: Int, reviewId: Int) {
        provider.request(.patchReview(perfumeId: perfumeId, reviewId: reviewId, userId: userId, data: reviewData)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try? JSONDecoder().decode(ReviewResponse.self, from: response.data)
                } catch {
                    print("patchReview 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("patchReview API 오류: \(error)")
            }
        }
    }
}
