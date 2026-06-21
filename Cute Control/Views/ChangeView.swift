//
//  ChangeView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 22.09.2024.
//

import SwiftUI
import WidgetKit

struct ChangeView: View {
    @ObservedObject var viewModel: WidgetConfigViewModel
    let controlIndex: Int

    @State private var selectedColor: Color = .red
    @State private var selectedSymbol: String = "1.circle.fill"
    @State private var controlDescription: String = ""
    @State private var descriptionSaveTask: Task<Void, Never>?

    let categories = CategoryType.allCases
    let quickColors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple, .pink, .cyan, .mint, .teal, .brown]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Color")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(.pink.opacity(0.15))
                        .foregroundStyle(.pink)
                        .cornerRadius(16)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ColorPicker("", selection: $selectedColor) // save config'i çağırır
                                .labelsHidden()

                            ForEach(quickColors, id: \.self) { color in
                                Button(action: {
                                    selectedColor = color // save config'i çağırır
                                }) {
                                    Circle()
                                        .fill(color)
                                        .frame(width: 25, height: 25)
                                        .overlay(
                                            Circle()
                                                .stroke(selectedColor == color ? Color.blue : Color.clear, lineWidth: 2)
                                        )
                                }
                            }
                        }
                    }
                }

                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(.pink.opacity(0.15))
                        .foregroundStyle(.pink)
                        .cornerRadius(16)
                    TextField("Enter description", text: $controlDescription) // save config'i çağırır
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .padding(.bottom, 5)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                }

                ForEach(CategoryType.allCases, id: \.self) { category in
                    DisclosureGroup(
                        content: {
                            VStack(alignment: .leading, spacing: 10) {
                                LazyVGrid(columns: gridColumns(for: category), spacing: 10) {
                                    ForEach(category.symbols, id: \.self) { symbol in
                                        iconButton(for: symbol)
                                    }
                                }
                                .padding(.leading, -5)
                            }
                            .padding(.top, 10)
                        },
                        label: {
                            Text(category.description)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(.pink.opacity(0.15))
                                .foregroundStyle(.pink)
                                .cornerRadius(16)
                        }
                    )
                    .padding(.vertical, 5)
                    .accentColor(.pink)
                }

                Spacer(minLength: 110)
            }
            .padding()
        }
        .overlay(alignment: .bottom) {
            ZStack {
                Color.pink.opacity(0.15)
                    .cornerRadius(16)
                    .ignoresSafeArea(.all)

                VStack(spacing: 6) {
                    WidgetPreviewView(symbolName: selectedSymbol, color: selectedColor, size: 90, fillColor: Color.white)
                    Text(controlDescription.isEmpty ? getNavigationTitle() : controlDescription)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 16)
            }.frame(height: 140)
        }
        .navigationTitle(getNavigationTitle())
        .onChange(of: selectedColor) { _ in saveConfig() }
        .onChange(of: selectedSymbol) { _ in saveConfig() }
        .onChange(of: controlDescription) { _ in debouncedSaveDescription() }
        .onAppear { loadConfig() }
        .onDisappear {
            // Flush any pending description edit immediately.
            descriptionSaveTask?.cancel()
            descriptionSaveTask = nil
            saveConfig()
        }
    }

    /// Coalesce rapid keystrokes so we don't re-save and reload every widget on each character.
    private func debouncedSaveDescription() {
        descriptionSaveTask?.cancel()
        descriptionSaveTask = Task {
            try? await Task.sleep(nanoseconds: 500_000_000)
            guard !Task.isCancelled else { return }
            saveConfig()
        }
    }

    private func getNavigationTitle() -> String {
        viewModel.labelFor(index: controlIndex, in: controlIndex <= 5 ? "Preset" : (controlIndex <= 15 ? "Custom" : "Extra"))
    }

    private func gridColumns(for category: CategoryType) -> [GridItem] {
        let minimum: CGFloat = category == .kaomoji ? 92 : 50
        return [GridItem(.adaptive(minimum: minimum))]
    }

    @ViewBuilder
    private func iconButton(for symbol: String) -> some View {
        if symbol.isSFSymbol {
            Image(systemName: symbol)
                .font(.system(size: 30))
                .foregroundColor(symbol == selectedSymbol ? selectedColor : .gray)
                .onTapGesture {
                    selectedSymbol = symbol // save config'i çağırır
                }
        } else {
            // Kaomoji → becomes the control's description (its name), kept
            // separate from the symbol so picking an icon never overwrites it.
            let isSelected = controlDescription == symbol
            Text(symbol)
                .font(.system(size: 15))
                .lineLimit(1)
                .minimumScaleFactor(0.4)
                .padding(.horizontal, 4)
                .frame(maxWidth: .infinity, minHeight: 44)
                .foregroundColor(isSelected ? selectedColor : .primary)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? selectedColor : Color.gray.opacity(0.3),
                                lineWidth: isSelected ? 2 : 1)
                )
                .onTapGesture {
                    controlDescription = symbol // shows as the control's name
                }
        }
    }

    private func saveConfig() {
        viewModel.saveConfig(index: controlIndex, color: selectedColor, symbol: selectedSymbol, description: controlDescription)
        ControlCenter.shared.reloadAllControls()
    }

    private func loadConfig() {
        if let config = viewModel.loadConfig(for: controlIndex) {
            selectedColor = config.0
            selectedSymbol = config.1
            controlDescription = viewModel.getDescription(for: controlIndex) ?? ""
        } else {
            if controlIndex <= 5 {
                let preset = viewModel.presets[controlIndex - 1]
                selectedColor = preset.0
                selectedSymbol = preset.1
                controlDescription = "Preset #\(controlIndex)"
            } else {
                selectedColor = .blue
                selectedSymbol = "questionmark.app.fill"
                controlDescription = controlIndex <= 15 ? "Custom #\(controlIndex - 5)" : "Extra #\(controlIndex - 15)"
            }
        }
    }
}

//#Preview {
//    NavigationView {
//        ChangeView(
//            controlIndex: 1,
//            onConfigChange: { _, _ in }
//        )
//    }
//}
