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
    @Published var writeMode: Bool = false
    @Published var isCompleted: Bool = false

    @Published var name: String = ""
    @Published var brand: String = ""
    @Published var price: String = ""
    @Published var description: String = ""
    @Published var imageUrl: String = ""
    @Published var reviewCount: Int = 0
    @Published var averageRating: Double = 0
    @Published var reviews: [ReviewData] = []

    private let perfumeId: Int
    private let userId: Int = KeychainManager.shared.loadUserId() ?? -1
    private let provider = APIManager.shared.createProvider(for: ReviewRouter.self)

    init(perfumeId: Int) {
        self.perfumeId = perfumeId
    }

    private var reviewData: ReviewData {
        ReviewData(score: score, content: content)
    }

    func postReview() {
        provider.request(.postReview(perfumeId: perfumeId, userId: userId, data: reviewData)) { result in
            switch result {
            case .success(let response):
                do {
                    _ = try JSONDecoder().decode(ReviewResponse.self, from: response.data)
                    self.isCompleted = true
                } catch {
                    print("postReview 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("postReview API 오류: \(error)")
            }
        }
    }

    func patchReview(reviewId: Int) {
        provider.request(.patchReview(perfumeId: perfumeId, reviewId: reviewId, userId: userId, data: reviewData)) { result in
            switch result {
            case .success(let response):
                do {
                    _ = try JSONDecoder().decode(ReviewResponse.self, from: response.data)
                } catch {
                    print("patchReview 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("patchReview API 오류: \(error)")
            }
        }
    }

    func getDetail() {
        provider.request(.getDetail(perfumeId: perfumeId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(DetailResponse.self, from: response.data)
                    let data = decodedData.data

                    DispatchQueue.main.async {
                        self.name = data.name
                        self.brand = data.brand
                        self.price = data.price
                        self.description = data.description
                        self.imageUrl = data.imageUrl
                        self.reviewCount = data.reviewCount
                        self.averageRating = data.averageRating
                        self.reviews = data.reviews
                    }
                } catch {
                    print("getDetail 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("getDetail API 오류: \(error)")
            }
        }
    }
}
