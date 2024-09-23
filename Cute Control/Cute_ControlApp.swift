//
//  Cute_ControlApp.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

@main
struct Cute_ControlApp: App {
    @StateObject var premiumManager = PremiumManager.shared

    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: "appl_YqjmYEYGLLJppbNWCEGwdhQBDji")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(premiumManager)
                .presentPaywallIfNeeded(requiredEntitlementIdentifier: "premium", presentationMode: .fullScreen)
        }
    }
}
