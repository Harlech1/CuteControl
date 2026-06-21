import SwiftUI
import RevenueCat
import RevenueCatUI
import SafariServices
import TPackage

private extension Color {
    static let paywallAccent = Color(red: 0.97, green: 0.40, blue: 0.66)
    static let paywallAccentDeep = Color(red: 0.87, green: 0.20, blue: 0.52)
}

struct CustomPaywallView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var showDismissButton = false
    @State private var progress: CGFloat = 0
    private let hardPaywall: Bool = false

    @State private var packages: [Package] = []
    @State private var selectedPackage: Package?
    @State private var isLoading = true
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var dismissOnAlertOK = false
    @State private var showingPrivacy = false
    @State private var showingTerms = false
    @State private var purchaseSucceeded = false

    @EnvironmentObject var premiumManager: TKPremiumManager
    @StateObject private var ratingManager = RatingManager.shared

    private let features: [(icon: String, text: String)] = [
        ("paintbrush.fill", "20+ aesthetic widgets for your home screen"),
        ("sparkles", "5,000+ cute icons & symbols to mix and match"),
        ("wand.and.stars", "Build your dream interface, your way"),
        ("paintpalette.fill", "Unlock every theme, color & style"),
        ("infinity", "Unlimited customization — forever"),
    ]

    var body: some View {
        Group {
            if purchaseSucceeded {
                PremiumUnlockedView(onContinue: { dismiss() })
                    .transition(.opacity.combined(with: .scale(scale: 0.97)))
            } else {
                paywallBody
            }
        }
    }

    private var paywallBody: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Make your phone\nadorable. 🎀")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(.primary)
                            .fixedSize(horizontal: false, vertical: true)

                        Text("20+ aesthetic widgets, 5,000+ cute icons — your dream interface, unlocked.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .fixedSize(horizontal: false, vertical: true)

                        HStack(spacing: 8) {
                            Image(systemName: "laurel.leading")
                                .font(.system(size: 18))
                                .foregroundStyle(.pink)
                            Text("4.8 · Loved by thousands")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                            Image(systemName: "laurel.trailing")
                                .font(.system(size: 18))
                                .foregroundStyle(.pink)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, 20)

                    // Outcome bullets
                    VStack(alignment: .leading, spacing: 14) {
                        ForEach(features, id: \.text) { feature in
                            HStack(spacing: 14) {
                                Image(systemName: feature.icon)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.white)
                                    .frame(width: 36, height: 36)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(
                                                LinearGradient(
                                                    colors: [.paywallAccent, .paywallAccentDeep],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                    )

                                Text(NSLocalizedString(feature.text, comment: ""))
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.primary)
                                    .fixedSize(horizontal: false, vertical: true)

                                Spacer(minLength: 0)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                    // Packages
                    VStack(spacing: 12) {
                        if isLoading {
                            ForEach(0..<3) { _ in
                                PurchaseButtonSkeleton()
                            }
                        } else {
                            ForEach(packages, id: \.identifier) { package in
                                PurchaseButton(package: package,
                                               isSelected: selectedPackage?.identifier == package.identifier) {
                                    selectPackage(package)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)

                    // Footer links
                    VStack(spacing: 8) {
                        HStack(spacing: 4) {
                            Button("Restore") { restorePurchases() }
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("·").foregroundColor(.secondary)
                            Button("Privacy") { showingPrivacy = true }
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("·").foregroundColor(.secondary)
                            Button("Terms") { showingTerms = true }
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Text("Subscription automatically renews unless auto-renew is turned off at least 24 hours before the end of the current period.")
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    }
                    .padding(.bottom, 120)
                }
            }

            // Dismiss button (progress circle for first 3 seconds)
            if !hardPaywall {
                Group {
                    if !showDismissButton {
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(style: StrokeStyle(lineWidth: 1.5, lineCap: .butt))
                            .foregroundColor(.secondary)
                            .frame(width: 24, height: 24)
                            .rotationEffect(.degrees(-90))
                    } else {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.secondary)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .frame(width: 44, height: 44)
                .padding(.top, 8)
                .padding(.trailing, 12)
                .onAppear {
                    withAnimation(.linear(duration: 3)) {
                        progress = 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        showDismissButton = true
                    }
                }
            }
        }
        .background(Color(.systemBackground))
        .overlay(alignment: .bottom) {
            VStack(spacing: 6) {
                Button(action: purchase) {
                    HStack {
                        Text(ctaText)
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 26, style: .continuous)
                            .fill(
                                selectedPackage != nil
                                ? AnyShapeStyle(
                                    LinearGradient(
                                        colors: [.paywallAccent, .paywallAccentDeep],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                : AnyShapeStyle(Color.gray)
                            )
                    )
                }
                .disabled(selectedPackage == nil || isLoading)

                HStack(spacing: 5) {
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.green)
                    trustFooter
                }
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
            .background(
                LinearGradient(
                    colors: [Color(.systemBackground).opacity(0), Color(.systemBackground)],
                    startPoint: .top,
                    endPoint: .center
                )
            )
        }
        .onAppear {
            loadPackages()
        }
        .sheet(isPresented: $showingPrivacy) {
            SafariView(url: URL(string: "https://turkerkizilcik.com/control/privacy-policy")!)
        }
        .sheet(isPresented: $showingTerms) {
            SafariView(url: URL(string: "https://turkerkizilcik.com/control/terms-of-use")!)
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                if dismissOnAlertOK { dismiss() }
            }
        } message: {
            Text(alertMessage)
        }
    }

    // MARK: - Actions

    private var ctaText: String {
        guard let package = selectedPackage else { return String(localized: "Continue") }
        if Self.freeTrialDays(for: package) != nil {
            return String(localized: "Start Free Trial 🎀")
        }
        return String(localized: "Unlock Cute Control 🎀")
    }

    private var trustFooter: Text {
        if let package = selectedPackage, Self.freeTrialDays(for: package) != nil {
            return Text("No payment due now.").fontWeight(.semibold).foregroundColor(.primary) + Text(" Cancel anytime.")
        }
        return Text("Cancel anytime. Secured by App Store.")
    }

    /// Free-trial length in days when the package's intro offer is a free trial.
    /// Returns nil if there's no intro offer or it isn't a free trial.
    static func freeTrialDays(for package: Package) -> Int? {
        guard let intro = package.storeProduct.introductoryDiscount,
              intro.paymentMode == .freeTrial else { return nil }
        let period = intro.subscriptionPeriod
        switch period.unit {
        case .day: return period.value
        case .week: return period.value * 7
        case .month: return period.value * 30
        case .year: return period.value * 365
        }
    }

    private func purchase() {
        guard let package = selectedPackage else { return }

        Task {
            do {
                let result = try await Purchases.shared.purchase(package: package)
                if result.userCancelled {
                    return
                } else if result.customerInfo.entitlements.all["premium"]?.isActive == true {
                    premiumManager.isPremium = true
                    await ratingManager.requestReview()
                    withAnimation(.easeOut(duration: 0.4)) {
                        purchaseSucceeded = true
                    }
                }
            } catch {
                print("Purchase failed: \(error)")
            }
        }
    }

    private func restorePurchases() {
        Task {
            do {
                let info = try await Purchases.shared.restorePurchases()
                if info.entitlements.all["premium"]?.isActive == true {
                    alertTitle = String(localized: "Success")
                    alertMessage = String(localized: "Your purchases have been restored!")
                    dismissOnAlertOK = true
                    premiumManager.isPremium = true
                } else {
                    alertTitle = String(localized: "No Purchases Found")
                    alertMessage = String(localized: "No previous purchases were found to restore.")
                    dismissOnAlertOK = false
                }
                showingAlert = true
            } catch {
                alertTitle = String(localized: "Restore Failed")
                alertMessage = String(localized: "Failed to restore purchases. Please try again.")
                dismissOnAlertOK = false
                showingAlert = true
            }
        }
    }

    private func selectPackage(_ package: Package) {
        selectedPackage = package
    }

    // MARK: - Load Packages

    private func loadPackages() {
        isLoading = true
        Task {
            do {
                let offerings = try await Purchases.shared.offerings()
                if let offering = offerings.offering(identifier: "premium") ?? offerings.current {
                    await MainActor.run {
                        self.packages = offering.availablePackages
                            .filter { $0.storeProduct.subscriptionPeriod != nil }
                            .sorted { Self.sortPriority(for: $0) < Self.sortPriority(for: $1) }

                        if let yearly = self.packages.first(where: { $0.storeProduct.subscriptionPeriod?.unit == .year }) {
                            self.selectedPackage = yearly
                        } else if let weekly = self.packages.first(where: { $0.storeProduct.subscriptionPeriod?.unit == .week }) {
                            self.selectedPackage = weekly
                        } else {
                            self.selectedPackage = self.packages.first
                        }

                        self.isLoading = false
                    }
                }
            } catch {
                print("Error loading packages: \(error)")
                await MainActor.run { self.isLoading = false }
            }
        }
    }

    private static func sortPriority(for package: Package) -> Int {
        switch package.storeProduct.subscriptionPeriod?.unit {
        case .year: return 0
        case .week: return 1
        case .month: return 2
        default: return 3
        }
    }
}

// MARK: - Purchase Button

struct PurchaseButton: View {
    let package: Package
    let isSelected: Bool
    let action: () -> Void

    private var isYearly: Bool {
        package.storeProduct.subscriptionPeriod?.unit == .year
    }

    private var isWeekly: Bool {
        package.storeProduct.subscriptionPeriod?.unit == .week
    }

    private var trialDays: Int? {
        CustomPaywallView.freeTrialDays(for: package)
    }

    private var yearlySubtitle: String {
        guard let days = trialDays else {
            return String(localized: "Best value — save the most")
        }
        let price = package.storeProduct.localizedPriceString
        return days == 1
            ? String(localized: "1 day free, then \(price)/year")
            : String(localized: "\(days) days free, then \(price)/year")
    }

    private var weeklySubtitle: String? {
        guard isWeekly, let days = trialDays else { return nil }
        let price = package.storeProduct.localizedPriceString
        return days == 1
            ? String(localized: "1 day free, then \(price)/week")
            : String(localized: "\(days) days free, then \(price)/week")
    }

    /// Approximate weekly cost of the yearly plan, formatted in the store's currency.
    /// Used as an at-a-glance comparison only — the actual billing cadence is yearly.
    private var weeklyEquivalent: String? {
        guard isYearly,
              let formatter = package.storeProduct.priceFormatter else { return nil }
        let yearly = (package.storeProduct.price as NSDecimalNumber).doubleValue
        let perWeek = yearly / 52.0
        return formatter.string(from: NSNumber(value: perWeek))
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .white : .secondary)
                    .font(.title3)

                VStack(alignment: .leading, spacing: 2) {
                    Text(packageTitle)
                        .font(.headline)
                        .foregroundColor(isSelected ? .white : .primary)

                    if isYearly {
                        Text(yearlySubtitle)
                            .font(.caption)
                            .foregroundColor(isSelected ? Color.white.opacity(0.85) : .secondary)
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)
                    } else if let subtitle = weeklySubtitle {
                        Text(subtitle)
                            .font(.caption)
                            .foregroundColor(isSelected ? Color.white.opacity(0.85) : .secondary)
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)
                    }
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 1) {
                    Text(packagePrice)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(isSelected ? .white : .primary)

                    if isYearly, let perWeek = weeklyEquivalent {
                        Text("\(perWeek)/week")
                            .font(.system(size: 11))
                            .foregroundColor(isSelected ? Color.white.opacity(0.7) : .secondary)
                    }
                }
            }
            .frame(height: 64)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(isSelected ? Color(red: 0.87, green: 0.20, blue: 0.52) : Color(.secondarySystemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(isSelected ? Color.white.opacity(0.5) : Color(.systemGray4), lineWidth: isSelected ? 2 : 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }

    private var packageTitle: String {
        switch package.storeProduct.subscriptionPeriod?.unit {
        case .week: return String(localized: "Weekly")
        case .year: return String(localized: "Yearly")
        case .month: return String(localized: "Monthly")
        default: return String(localized: "Premium")
        }
    }

    private var packagePrice: String {
        let price = package.storeProduct.localizedPriceString
        switch package.storeProduct.subscriptionPeriod?.unit {
        case .week: return String(localized: "\(price)/week")
        case .month: return String(localized: "\(price)/month")
        case .year: return String(localized: "\(price)/year")
        default: return price
        }
    }
}

struct PurchaseButtonSkeleton: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 24, height: 24)
            Text("Package Name")
                .font(.headline)
                .foregroundColor(.primary)
            Spacer()
            Text("$0.00/wk")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(height: 64)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
        .redacted(reason: .placeholder)
    }
}

// MARK: - Premium Unlocked

struct PremiumUnlockedView: View {
    let onContinue: () -> Void
    @State private var appeared = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 84))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.paywallAccent, .paywallAccentDeep],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .scaleEffect(appeared ? 1 : 0.6)
                .opacity(appeared ? 1 : 0)

            VStack(spacing: 8) {
                Text("You're all set! 🎀")
                    .font(.system(size: 28, weight: .bold))
                Text("Every cute widget, icon & theme is now unlocked. Go make your phone adorable.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 32)

            Spacer()

            Button(action: onContinue) {
                Text("Start Customizing")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 26, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [.paywallAccent, .paywallAccentDeep],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .onAppear {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                appeared = true
            }
        }
    }
}

// MARK: - Safari View

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

#Preview {
    CustomPaywallView()
}
