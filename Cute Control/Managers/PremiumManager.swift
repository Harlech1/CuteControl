//
//  PremiumManager.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 23.09.2024.
//

import SwiftUI
import RevenueCat

@MainActor
class PremiumManager: ObservableObject {
    static let shared = PremiumManager()

    @Published var isPremium: Bool = false

    init() {
        Task {
            await checkPremiumStatus()
        }
    }

    func checkPremiumStatus() async {
        do {
            let customerInfo = try await Purchases.shared.customerInfo()
            self.isPremium = customerInfo.entitlements["premium"]?.isActive == true
            print("Premium Status: \(self.isPremium)")
        } catch {
            print("Failed to fetch customer info: \(error.localizedDescription)")
            self.isPremium = false
        }
    }

    func restorePurchases() async -> Bool {
        do {
            let customerInfo = try await Purchases.shared.restorePurchases()
            self.isPremium = customerInfo.entitlements["premium"]?.isActive == true
            return self.isPremium
        } catch {
            print("Error restoring purchases: \(error)")
            self.isPremium = false
            return false
        }
    }
}
