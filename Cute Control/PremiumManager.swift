//
//  PremiumManager.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 23.09.2024.
//

import SwiftUI
import RevenueCat

class PremiumManager: ObservableObject {
    static let shared = PremiumManager()

    @Published var isPremium: Bool = false

    init() {
        checkPremiumStatus()
    }

    func checkPremiumStatus() {
        Purchases.shared.getCustomerInfo { (customerInfo, error) in
            if let customerInfo = customerInfo {
                DispatchQueue.main.async {
                    self.isPremium = customerInfo.entitlements["Pro"]?.isActive == true
                    print("Premium Status: \(self.isPremium)")
                }
            } else {
                DispatchQueue.main.async {
                    self.isPremium = false
                }
            }
        }
    }
}
