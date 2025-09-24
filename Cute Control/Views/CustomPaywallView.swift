import SwiftUI
import RevenueCat
import RevenueCatUI
import SafariServices
import TPackage

struct SparkleEffect: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var opacity: Double = 1.0
    var scale: CGFloat = 1.0
}

struct CustomPaywallView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var showDismissButton = false
    @State private var progress: CGFloat = 0
    @State private var rotation: Double = 0
    @State private var waveTime: Double = 0
    @State private var sparkles: [SparkleEffect] = []
    @State private var lastX: CGFloat = 0
    @State private var isMovingRight: Bool = true
    @State private var speedMultiplier: Double = 1.0
    @State private var sparkleBoost: Int = 0
    private let hardPaywall: Bool = true
    @State private var isWeeklySelected = true
    @State private var packages: [Package] = []
    @State private var selectedPackage: Package?
    @State private var showingPrivacy = false
    @State private var showingTerms = false
    @State private var yearlyStrikethroughPrice: String = ""
    @State private var isTrialEligible: Bool = false
    
    #if DEBUG
    private let forceShowTrial = true
    #else
    private let forceShowTrial = false
    #endif
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isLoading = true
    @EnvironmentObject var premiumManager: TKPremiumManager
    @StateObject private var ratingManager = RatingManager.shared

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                VStack(spacing: 16) {
                    Spacer()
                        .frame(height: 75)

                    VStack(spacing: 8) {
                        Text("Setup the Cutest Control!!\n૮꒰ ˶• ༝ •˶꒱ა 🩷")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 12) {
                            Image(systemName: "paintbrush.fill")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.pink)
                            Text("20+ aesthetic widgets")
                                .font(.system(size: 18))
                        }

                        HStack(spacing: 12) {
                            Image(systemName: "sparkles")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.pink)
                            Text("5,000+ cute icons & symbols")
                                .font(.system(size: 18))
                        }

                        HStack(spacing: 12) {
                            Image(systemName: "wand.and.stars")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.pink)
                            Text("Build your dream interface")
                                .font(.system(size: 18))
                        }
                    }
                    .font(.headline)
                }
                .padding(.vertical, 16)
                .padding(.horizontal)

                Spacer()

                if isTrialEligible {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(isWeeklySelected ? "Free Trial Enabled" : "Free Trial Disabled")
                                    .font(.headline)
                                
                                Text("Not sure? Try it risk-free")
                                    .font(.caption)
                                    .foregroundColor(.pink)
                            }

                            Spacer()

                            Toggle("", isOn: $isWeeklySelected)
                                .labelsHidden()
                                .onChange(of: isWeeklySelected) { newValue in
                                    selectAppropriatePackage()
                                }
                                .tint(.pink)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }

                VStack(spacing: 16) {
                    if isLoading {
                        ForEach(0..<3) { _ in
                            PurchaseButtonSkeleton()
                        }
                    } else {
                        ForEach(packages, id: \.identifier) { package in
                            PurchaseButton(package: package,
                                          isSelected: selectedPackage?.identifier == package.identifier,
                                          yearlyStrikethroughPrice: yearlyStrikethroughPrice,
                                          isTrialEligible: isTrialEligible) {
                                selectPackage(package)
                            }
                        }
                    }
                }
                .padding(.horizontal)

                Button(action: {
                    if let package = selectedPackage {
                        Task {
                            do {
                                let result = try await Purchases.shared.purchase(package: package)
                                if result.customerInfo.entitlements.all["premium"]?.isActive == true {
                                    premiumManager.isPremium = true
                                    await ratingManager.requestReview()
                                    dismiss()
                                } else {
                                    print("didnt do anything??")
                                }
                            } catch {
                                print("Purchase failed: \(error)")
                            }
                        }
                    }
                }) {
                    HStack {
                        Text("Try Free for 3 Days 🎀")
                        Image(systemName: "chevron.right")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedPackage != nil ? Color.pink : Color.gray)
                    .cornerRadius(12)
                }
                .disabled(selectedPackage == nil || isLoading)
                .padding(.horizontal)
                .redacted(reason: isLoading ? .placeholder : [])

                HStack(spacing: 4) {
                    Button("Restore") {
                        Task {
                            do {
                                let customerInfo = try await Purchases.shared.restorePurchases()
                                print("Purchases restored: \(customerInfo)")
                                if customerInfo.entitlements.all["premium"]?.isActive == true {
                                    alertTitle = "Success"
                                    alertMessage = "Your purchases have been restored!"
                                    showingAlert = true
                                    premiumManager.isPremium = true
                                } else {
                                    alertTitle = "No Purchases Found"
                                    alertMessage = "No previous purchases were found to restore."
                                    showingAlert = true
                                }
                            } catch {
                                print("Restore failed: \(error)")
                                alertTitle = "Restore Failed"
                                alertMessage = "Failed to restore purchases. Please try again."
                                showingAlert = true
                            }
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)

                    Text("•")
                        .foregroundColor(.secondary)

                    Button("Privacy") {
                        showingPrivacy = true
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)

                    Text("•")
                        .foregroundColor(.secondary)

                    Button("Terms") {
                        showingTerms = true
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
            
            // Kuromi flying on top of everything
            ZStack {
                // Hearts behind kuromi
                ForEach(sparkles) { sparkle in
                    Image(systemName: "heart.fill")
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.pink, .pink.opacity(0.6)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .font(.system(size: 18))
                        .scaleEffect(sparkle.scale)
                        .opacity(sparkle.opacity)
                        .offset(x: sparkle.x, y: sparkle.y)
                }
                
                // Kuromi
                Image("kuromi3")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
                    .frame(width: 110, height: 110)
                    .scaleEffect(x: isMovingRight ? 1 : -1, y: 1)
                    .offset(x: sin(waveTime) * 150, y: cos(waveTime * 0.7) * 200)
                    .onTapGesture {
                        // Haptic feedback
                        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                        impactFeedback.impactOccurred()
                        
                        // Speed boost
                        speedMultiplier = 3.0
                        sparkleBoost = 5
                        
                        // Reset after 2 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            speedMultiplier = 1.0
                            sparkleBoost = 0
                        }
                    }
                    .onAppear {
                        // Start moving after 0.5 seconds delay
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            startSinWaveMovement()
                            createSparkles()
                        }
                    }
            }

            if !hardPaywall {
                VStack {
                    HStack {
                        Spacer()
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
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding()
                    }
                    Spacer()
                }
                .onAppear {
                    withAnimation(.linear(duration: 3)) {
                        progress = 1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeIn) {
                            showDismissButton = true
                        }
                    }
                }
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.pink.opacity(0.1),
                    Color.pink.opacity(0.05)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .onAppear {
            loadPackages()
        }
        .sheet(isPresented: $showingPrivacy) { // fix here
            SafariView(url: URL(string: "https://turkerkizilcik.com/control/privacy-policy")!)
        }
        .sheet(isPresented: $showingTerms) {
            SafariView(url: URL(string: "https://turkerkizilcik.com/control/terms-of-use")!)
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                // Only dismiss if restore was successful
                if alertTitle == "Success" {
                    dismiss()
                }
            }
        } message: {
            Text(alertMessage)
        }
    }

    private func loadPackages() {
        isLoading = true
        Task {
            do {
                let offerings = try await Purchases.shared.offerings()
                if let offering = offerings.offering(identifier: "premium") {
                    // Check trial eligibility for all packages
                    let eligibility = try await Purchases.shared.checkTrialOrIntroDiscountEligibility(
                        productIdentifiers: offering.availablePackages.map { $0.storeProduct.productIdentifier }
                    )
                    
                    DispatchQueue.main.async {
                        // Debug logging
                        print("DEBUG: All available packages:")
                        offering.availablePackages.forEach { package in
                            if let period = package.storeProduct.subscriptionPeriod {
                                print("DEBUG: Found package - ID: \(package.identifier)")
                                print("DEBUG: Period Unit: \(period.unit)")
                                print("DEBUG: Price: \(package.storeProduct.price)")
                                print("---")
                            }
                        }
                        
                        // Filter out monthly packages and sort (yearly first, then weekly)
                        self.packages = offering.availablePackages
                            .filter { $0.storeProduct.subscriptionPeriod?.unit != .month }
                            .sorted { first, second in
                                let firstPriority = first.storeProduct.subscriptionPeriod?.unit == .year ? 0 : 1
                                let secondPriority = second.storeProduct.subscriptionPeriod?.unit == .year ? 0 : 1
                                return firstPriority < secondPriority
                            }
                        
                        print("DEBUG: Total packages count (after filtering): \(self.packages.count)")
                        
                        // Check eligibility for weekly package
                        if let weeklyPackage = self.packages.first(where: { $0.storeProduct.subscriptionPeriod?.unit == .week }) {
                            print(eligibility[weeklyPackage.storeProduct.productIdentifier]?.status.description)
                            let actualEligibility = eligibility[weeklyPackage.storeProduct.productIdentifier]?.status == .eligible
                            self.isTrialEligible = self.forceShowTrial || actualEligibility
                            print("Is trial eligible: \(self.isTrialEligible) (forced: \(self.forceShowTrial))")
                            
                            // Calculate yearly strikethrough price
                            let weeklyPrice = NSDecimalNumber(decimal: weeklyPackage.storeProduct.price).doubleValue
                            let calculatedYearlyPrice = weeklyPrice * 52.0
                            let currencySymbol = weeklyPackage.storeProduct.localizedPriceString.first ?? "$"
                            self.yearlyStrikethroughPrice = "\(currencySymbol)\(String(format: "%.2f", calculatedYearlyPrice))"
                        }
                        
                        // Select weekly by default
                        self.selectedPackage = self.packages.first { package in
                            package.storeProduct.subscriptionPeriod?.unit == .week
                        }
                        self.isWeeklySelected = true
                        self.isLoading = false
                    }
                }
            } catch {
                print("Error loading packages: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }

    private func selectPackage(_ package: Package) {
        selectedPackage = package
        isWeeklySelected = package.storeProduct.subscriptionPeriod?.unit == .week
    }

    private func selectAppropriatePackage() {
        if isWeeklySelected {
            selectedPackage = packages.first { package in
                package.storeProduct.subscriptionPeriod?.unit == .week
            }
        } else {
            // Keep the currently selected package if it's not weekly
            if let currentPackage = selectedPackage,
               currentPackage.storeProduct.subscriptionPeriod?.unit != .week {
                // Keep the current selection
            } else {
                // Default to yearly since we removed monthly
                selectedPackage = packages.first { package in
                    package.storeProduct.subscriptionPeriod?.unit == .year
                }
            }
        }
    }
    
    private func startSinWaveMovement() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            waveTime += 0.02 * speedMultiplier
            
            // Calculate current and previous X positions
            let currentX = sin(waveTime) * 150
            
            // Determine direction and flip image accordingly
            if currentX > lastX {
                isMovingRight = true
            } else if currentX < lastX {
                isMovingRight = false
            }
            
            lastX = currentX
        }
    }
    
    private func createSparkles() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            // Add sparkle exactly where kuromi is
            let currentX = sin(waveTime) * 150
            let currentY = cos(waveTime * 0.7) * 200
            
            // Create more sparkles when boosted
            let sparkleCount = 1 + sparkleBoost
            for _ in 0..<sparkleCount {
                let newSparkle = SparkleEffect(
                    x: currentX + CGFloat.random(in: -15...15),
                    y: currentY + CGFloat.random(in: -15...15)
                )
                sparkles.append(newSparkle)
            }
            
            // Animate fade out for the new sparkles
            let newSparkles = sparkles.suffix(sparkleCount)
            for sparkle in newSparkles {
                withAnimation(.easeOut(duration: 2.0)) {
                    if let index = sparkles.firstIndex(where: { $0.id == sparkle.id }) {
                        sparkles[index].opacity = 0
                        sparkles[index].scale = 0.2
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    sparkles.removeAll { $0.id == sparkle.id }
                }
            }
            
            // Keep trail length reasonable
            if sparkles.count > 10 {
                sparkles.removeFirst()
            }
        }
    }
}

struct PurchaseButton: View {
    let package: Package
    let isSelected: Bool
    let yearlyStrikethroughPrice: String
    let isTrialEligible: Bool
    let action: () -> Void
    
    private var savingsPercentage: Int? {
        guard package.storeProduct.subscriptionPeriod?.unit == .year else { 
            return nil 
        }
        
        let yearlyPrice = NSDecimalNumber(decimal: package.storeProduct.price).doubleValue
        
        // Remove any currency symbols and whitespace
        let cleanedPrice = yearlyStrikethroughPrice.replacingOccurrences(of: "[^0-9.]", with: "", options: .regularExpression)
        let calculatedYearlyPrice = Double(cleanedPrice) ?? 0
        
        if calculatedYearlyPrice > 0 {
            let savings = Int(((calculatedYearlyPrice - yearlyPrice) / calculatedYearlyPrice) * 100)
            return savings
        }
        return nil
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: action) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(package.storeProduct.subscriptionPeriod?.unit == .week && isTrialEligible ? "3-Day Free Trial" : 
                             package.storeProduct.subscriptionPeriod?.unit == .week ? "Weekly Plan" :
                             package.storeProduct.subscriptionPeriod?.unit == .year ? "Yearly Plan" : "Premium Access")
                            .font(.headline)
                            .foregroundColor(.primary)

                        if package.storeProduct.subscriptionPeriod?.unit == .week {
                            Text(isTrialEligible ? 
                                 "then \(package.storeProduct.localizedPriceString)/week" : 
                                 "\(package.storeProduct.localizedPriceString)/week")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        } else {
                            (Text(yearlyStrikethroughPrice).strikethrough() + Text(" \(package.storeProduct.localizedPriceString)/year"))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }

                    Spacer()
                    
                    if let savings = savingsPercentage {
                        Text("SAVE \(savings)%")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.pink)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.pink.opacity(0.15))
                            .cornerRadius(8)
                            .padding(.trailing, 8)
                    } else if package.storeProduct.subscriptionPeriod?.unit == .month {
                        Text("POPULAR ✨")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.pink)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color.pink.opacity(0.15))
                            .cornerRadius(8)
                            .padding(.trailing, 8)
                    }

                    Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(isSelected ? .pink : .secondary)
                        .font(.title3)
                        .padding(.leading, 8)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color(.systemBackground))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color.pink : Color(.systemGray5), lineWidth: isSelected ? 5 : 5)
                )
                .cornerRadius(12)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct PurchaseButtonSkeleton: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Package Name")
                    .font(.headline)
                    .foregroundColor(.primary)

                Text("Price information")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Circle()
                .frame(width: 24, height: 24)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray5), lineWidth: 5)
        )
        .redacted(reason: .placeholder)
    }
}

private extension SubscriptionPeriod {
    var periodTitle: String {
        switch (unit, value) {
        case (.week, 1): return "3-Day Trial"
        case (.month, 1): return "Monthly Plan"
        case (.year, 1): return "Yearly Plan"
        default: return "\(value) \(unit)"
        }
    }
}

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
        .environment(\.locale, Locale(identifier: "de"))
}
