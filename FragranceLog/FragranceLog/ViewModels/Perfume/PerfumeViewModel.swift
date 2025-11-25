//
//  PerfumeViewModel.swift
//  FragranceLog
//
//  Created by 황민지 on 11/25/25.
//

import Foundation
import Moya
import Combine

class PerfumeViewModel: ObservableObject {
    @Published var recommendations: [RecommendPerfume] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let provider = APIManager.shared.createProvider(for: PerfumeRouter.self)

    func fetchRecommendations() {
        isLoading = true
        provider.request(.getRecommendations) { result in
            DispatchQueue.main.async {
                self.isLoading = false
            }

            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(RecommendResponse.self, from: response.data)
                    DispatchQueue.main.async {
                        self.recommendations = decoded.data
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "디코딩 실패"
                        print("디코딩 에러:", error)
                    }
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
