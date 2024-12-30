//
//  Cute_ControlApp.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import SwiftUI
import RevenueCat

@main
struct Cute_ControlApp: App {
    @StateObject private var premiumManager = PremiumManager.shared

    init() {
        configureRevenueCat()
    }

    var body: some Scene {
        WindowGroup {
            ControlCenterView()
                .environmentObject(premiumManager)
        }
    }

    private func configureRevenueCat() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_YqjmYEYGLLJppbNWCEGwdhQBDji")
    }
}
