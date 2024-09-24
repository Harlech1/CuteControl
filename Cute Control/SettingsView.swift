//
//  SettingsView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 24.09.2024.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct SettingsView: View {
    @EnvironmentObject var premiumManager: PremiumManager
    @State private var showPaywall = false
    @State var isPremium = false
    @State private var showAlert = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Subscriptions").font(.subheadline)) {
                    if premiumManager.isPremium {
                        Text("Subscription is active. Thanks for being a premium user. ♥️").foregroundStyle(.gray)
                    } else {
                        Text("Your subscription isn't actived.").foregroundStyle(.gray)
                    }

                    Button(action: {
                        if !premiumManager.isPremium {
                            showPaywall = true
                        } else {
                            showAlert = true
                        }
                    }) {
                        Label(
                            title: { Text("Go Premium")
                                    .foregroundColor(.clear)
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 248/255, green: 171/255, blue: 94/255),
                                                Color(red: 243/255, green: 105/255, blue: 97/255),
                                                Color(red: 161/255, green: 118/255, blue: 200/255),
                                                Color(red: 117/255, green: 155/255, blue: 235/255),
                                                Color(red: 101/255, green: 190/255, blue: 179/255),
                                                Color(red: 112/255, green: 219/255, blue: 150/255),
                                            ]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                        .mask(
                                            Text("Go Premium")
                                        )
                                    ) },
                            icon: { Image(systemName: "crown.fill")}
                        ).labelStyle(.colorful(.red))
                    }
                    .foregroundColor(.primary)
                    .fullScreenCover(isPresented: $showPaywall){
                        PaywallView(displayCloseButton: true)
                    }

                    Button(action: {
                        restorePurchases()
                    }) {
                        Label(
                            title: { Text("Restore Purchases") },
                            icon: { Image(systemName: "arrow.clockwise") }
                        ).labelStyle(.colorful(.teal))
                    }.foregroundColor(.primary)
                }

                Section(header: Text("Help us grow").font(.subheadline)) {
                    Button(action: {
                        openAppStoreForRating()
                    }) {
                        Label(
                            title: { Text("Rate Us") },
                            icon: { Image(systemName: "star.fill") }
                        )
                        .labelStyle(.colorful(.orange))
                    }.foregroundColor(.primary)

                    Button(action: {
                        sendEmail(to: "developerturker@gmail.com", subject: "Feedback on Cute Control", body: "Hello, I'd like to provide some feedback...")
                    }) {
                        Label(
                            title: { Text("Feedback") },
                            icon: { Image(systemName: "envelope.fill")
                            }
                        ).labelStyle(.colorful(.blue))

                    }.foregroundColor(.primary)
                }

                Section(header: Text("Documents").font(.subheadline)) {
                    NavigationLink(destination: DocumentsView(documentType: .privacyPolicy)){
                        Label(
                            title: { Text("Privacy Policy") },
                            icon: { Image(systemName: "doc.fill") }
                        ).labelStyle(.colorful(.gray))
                    }.foregroundColor(.primary)

                    NavigationLink(destination: DocumentsView(documentType: .termsOfUse)){
                        Label(
                            title: { Text("Terms of Use") },
                            icon: { Image(systemName: "doc.fill") }
                        ).labelStyle(.colorful(.gray))
                    }.foregroundColor(.primary)
                }.onAppear {
                    premiumManager.checkPremiumStatus()
                }
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("❤️"), message: Text("You are already a subscriber."), dismissButton: .default(Text("OK")))
                }
            }
        }
    }

    func restorePurchases() {
        Purchases.shared.restorePurchases { customerInfo, error in
            if customerInfo?.entitlements["Pro"]?.isActive == true {
                showAlert = true
            }
        }
    }

    func openAppStoreForRating() {
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id6708228449/?action=write-review") {
            UIApplication.shared.open(url)
        }
    }

    func sendEmail(to: String, subject: String, body: String) {
        let email = "mailto:\(to)?subject=\(subject)&body=\(body)"
        if let url = URL(string: email.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

//#Preview {
//    SettingsView()
//        .environmentObject(premiumManager)
//}
