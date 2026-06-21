//
//  OnboardingView.swift
//  Cute Control
//
//  3–4 page onboarding shown once on first launch, before the paywall.
//  Each page shows an app screenshot framed in an iPhone 17 Pro bezel.
//

import SwiftUI

/// Root view: shows onboarding on first launch, then the main app
/// (which presents the paywall itself when the user isn't premium).
struct RootView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if hasSeenOnboarding {
            ControlCenterView()
        } else {
            OnboardingView(onFinish: { hasSeenOnboarding = true })
        }
    }
}

// MARK: - Onboarding

struct OnboardingView: View {
    let onFinish: () -> Void

    @State private var page = 0

    // Edit copy here. `imageName` is an asset in Assets.xcassets.
    private let pages: [OnboardingPage] = [
        OnboardingPage(imageName: "Sim0",
                       title: "Your Control Center, but cute 🎀",
                       subtitle: "Adorable widgets that match your vibe — colors, icons, and kaomoji."),
        OnboardingPage(imageName: "Sim2",
                       title: "Open your Control Center",
                       subtitle: "Long-press, then tap Customize to start adding controls."),
        OnboardingPage(imageName: "Sim1",
                       title: "Add your Cute Controls",
                       subtitle: "Tap + and pick from your 20 Cute Control widgets."),
        OnboardingPage(imageName: "Sim3",
                       title: "Make every one yours",
                       subtitle: "Choose a color, an icon, or a cute kaomoji for each control.")
    ]

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $page) {
                ForEach(pages.indices, id: \.self) { index in
                    OnboardingPageView(page: pages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: page)

            // Page indicator
            HStack(spacing: 8) {
                ForEach(pages.indices, id: \.self) { index in
                    Capsule()
                        .fill(index == page ? Color.pink : Color.pink.opacity(0.25))
                        .frame(width: index == page ? 22 : 8, height: 8)
                        .animation(.spring(response: 0.3), value: page)
                }
            }
            .padding(.vertical, 16)

            Button(action: advance) {
                Text(page == pages.count - 1 ? "Get Started 🎀" : "Next")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.pink))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .background(
            LinearGradient(
                colors: [Color.pink.opacity(0.10), Color.pink.opacity(0.02)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }

    private func advance() {
        if page < pages.count - 1 {
            withAnimation { page += 1 }
        } else {
            onFinish()
        }
    }
}

struct OnboardingPage {
    let imageName: String
    let title: String
    let subtitle: String
}

private struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 24) {
                Spacer(minLength: 16)

                PhoneMockup(screenshot: page.imageName, height: geo.size.height * 0.60)

                VStack(spacing: 10) {
                    Text(page.title)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 24)

                    Text(page.subtitle)
                        .font(.system(size: 16, design: .rounded))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 32)
                }

                Spacer(minLength: 8)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

/// Composites an app screenshot into the iPhone 17 Pro bezel PNG. The bezel's
/// transparent screen opening is ~89.3% wide / 95% tall of the frame, centered.
struct PhoneMockup: View {
    let screenshot: String
    let height: CGFloat

    private let bezelAspect: CGFloat = 1350.0 / 2760.0   // width / height
    private let screenWidthRatio: CGFloat = 0.8933
    private let screenHeightRatio: CGFloat = 0.95

    private var width: CGFloat { height * bezelAspect }

    var body: some View {
        ZStack {
            Image(screenshot)
                .resizable()
                .scaledToFill()
                .frame(width: width * screenWidthRatio, height: height * screenHeightRatio)
                .clipShape(RoundedRectangle(cornerRadius: width * 0.095, style: .continuous))

            Image("Iphone17Pro")
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    OnboardingView(onFinish: {})
}
