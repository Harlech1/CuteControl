//
//  ContentView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import SwiftUI
import RevenueCatUI
import WidgetKit
import TPackage

struct ControlCenterView: View {
    @StateObject private var viewModel = WidgetConfigViewModel()
    @EnvironmentObject var premiumManager: TKPremiumManager
    @State private var showPaywall = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    sectionView(title: "Preset", range: 1...5)
                    sectionView(title: "Custom", range: 6...15)
                    sectionView(title: "Extra", range: 16...20)
                }
                .padding()
            }
            .navigationTitle("Control Center")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                Task {
                    await premiumManager.checkPremiumStatus()
                }
            }
            .fullScreenCover(isPresented: $showPaywall) {
                CustomPaywallView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.pink)
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadAllConfigs()
        }
    }

    private func sectionView(title: String, range: ClosedRange<Int>) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(.pink.opacity(0.15))
                .foregroundStyle(.pink)
                .cornerRadius(16)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 20) {
                ForEach(range, id: \.self) { index in
                    NavigationLink(destination: ChangeView(viewModel: viewModel, controlIndex: index)) {
                        VStack {
                            WidgetPreviewView(symbolName: viewModel.widgetConfigs[index]?.1 ?? "app.dashed",
                                               color: viewModel.widgetConfigs[index]?.0 ?? .red,
                                               size: 50, fillColor: Color.gray.opacity(0.15))
                            Text(viewModel.labelFor(index: index, in: title))
                                .font(.system(size: 10))
                                .lineLimit(1)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    ControlCenterView()
//}
