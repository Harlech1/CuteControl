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
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
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

                HStack {
                    Spacer()
                    WidgetPreviewView(symbolName: selectedSymbol, color: selectedColor, size: 100, fillColor: Color.white)
                    Spacer()
                }
                .padding(.top, 20)
            }.frame(height: 140)
        }
        .navigationTitle(getNavigationTitle())
        .onChange(of: selectedColor) { _ in saveConfig() }
        .onChange(of: selectedSymbol) { _ in saveConfig() }
        .onChange(of: controlDescription) { _ in saveConfig() }
        .onAppear { loadConfig() }
    }

    private func getNavigationTitle() -> String {
        viewModel.labelFor(index: controlIndex, in: controlIndex <= 5 ? "Preset" : (controlIndex <= 15 ? "Custom" : "Extra"))
    }

    private func iconButton(for symbol: String) -> some View {
        Image(systemName: symbol)
            .font(.system(size: 30))
            .foregroundColor(symbol == selectedSymbol ? selectedColor : .gray)
            .onTapGesture {
                selectedSymbol = symbol // save config'i çağırır
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
