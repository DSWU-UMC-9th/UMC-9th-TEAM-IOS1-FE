//
//  MypageViewModel.swift
//  FragranceLog
//
//  Created by 김미주 on 11/26/25.
//

import Combine
import Foundation
import Moya

class MypageViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var reviews: [ReviewResponseData] = []

    private let provider = APIManager.shared.createProvider(for: MyRouter.self)

    func getMe() {
        provider.request(.getMe) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(MeResponse.self, from: response.data)
                    let data = decodedData.data

                    DispatchQueue.main.async {
                        self.id = data.username
                    }
                } catch {
                    print("getMe 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("getMe API 오류: \(error)")
            }
        }
    }

    func getReviews(order: String) {
        provider.request(.getReview(order: order)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode(MyReviewResponse.self, from: response.data)

                    DispatchQueue.main.async {
                        self.reviews = decodedData.data
                    }
                } catch {
                    print("getReviews 디코더 오류: \(error)")
                }
            case .failure(let error):
                print("getReviews API 오류: \(error)")
            }
        }
    }
}
