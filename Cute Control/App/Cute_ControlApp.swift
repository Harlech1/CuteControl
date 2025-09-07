//
//  Cute_ControlApp.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import SwiftUI
import RevenueCat
import TPackage

@main
struct Cute_ControlApp: App {
    @StateObject var premiumManager = TKPremiumManager.shared

    init() {
        TPackage.configure(withAPIKey: "appl_YqjmYEYGLLJppbNWCEGwdhQBDji", entitlementIdentifier: "premium")
    }

    var body: some Scene {
        WindowGroup {
            ControlCenterView()
                .environmentObject(premiumManager)
        }
    }
}
