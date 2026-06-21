import SwiftUI
import StoreKit
import UIKit

@MainActor
final class RatingManager: ObservableObject {
    static let shared = RatingManager()
    
    @AppStorage("hasShownRating") private var hasShownRating = false
    @AppStorage("generationCount") private var generationCount = 0
    
    func incrementGenerationCount() {
        generationCount += 1
    }
    
    func showRatingIfNeeded() {
        guard !hasShownRating else { return }
        
        Task {
            try? await Task.sleep(nanoseconds: 1_500_000_000)
            if generationCount == 1 {
                await requestReview()
                hasShownRating = true
            }
        }
    }
    
    func requestReview() async {
        guard let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else { return }
        AppStore.requestReview(in: scene)
    }
}
