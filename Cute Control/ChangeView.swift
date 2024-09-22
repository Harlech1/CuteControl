//
//  ChangeView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 22.09.2024.
//

import SwiftUI
import WidgetKit

// ControlConfig yapısını ekleyelim
struct ControlConfig: Codable {
    var color: [CGFloat]
    var symbolName: String
    var description: String?
}

struct ChangeView: View {
    let controlIndex: Int
    let onConfigChange: (Color, String) -> Void
    let symbolCommunication =  SymbolCategory.communication
    let symbolWeather = SymbolCategory.weather
    let symbolMaps = SymbolCategory.maps
    let symbolObjectsAndTools = SymbolCategory.objectsandtools
    let symbolDevices = SymbolCategory.devices
    let symbolCamera = SymbolCategory.camera
    let symbolGaming = SymbolCategory.gaming
    let symbolConnectivity = SymbolCategory.connectivity
    let symbolTransportation = SymbolCategory.transportation
    let symbolAutomative = SymbolCategory.automative
    let symbolAccessibility = SymbolCategory.accessibility
    let symbolPrivacy = SymbolCategory.privacy
    let symbolHuman = SymbolCategory.human
    let symbolHome = SymbolCategory.home
    let symbolFitness = SymbolCategory.fitness
    let symbolNature = SymbolCategory.nature
    let symbolEditing = SymbolCategory.editing
    let symbolTextformat = SymbolCategory.textformat
    let symbolMedia = SymbolCategory.media
    let symbolKeyboard = SymbolCategory.keyboard
    let symbolCommerce = SymbolCategory.commerce
    let symbolTime = SymbolCategory.time
    let symbolHealth = SymbolCategory.health
    let symbolShapes = SymbolCategory.shapes
    let symbolArrows = SymbolCategory.arrows
    let symbolIndices = SymbolCategory.indices
    let symbolMath = SymbolCategory.math

    @State private var selectedColor: Color = .red
    @State private var selectedSymbol: String = "1.circle.fill"
    @State private var controlDescription: String = ""

    let letterSymbols = (97...122).map { String(UnicodeScalar($0)) + ".circle.fill" }
    let randomSymbols = ["star.fill", "heart.fill", "bell.fill", "cloud.fill", "bolt.fill",
                         "sun.max.fill", "moon.fill", "cloud.sun.fill", "wind", "snowflake"]

    let quickColors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .pink, .cyan, .mint, .indigo, .brown, .teal]
    // Preset değerlerini tanımlayalım
    let presets: [(Color, String)] = [
        (.pink, "heart.fill"),
        (.blue, "headphones"),
        (.yellow, "star.fill"),
        (.pink, "pawprint.fill"),
        (.black, "guitars.fill")
    ]

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
                            ColorPicker("", selection: $selectedColor)
                                .labelsHidden()

                            ForEach(quickColors, id: \.self) { color in
                                Button(action: {
                                    selectedColor = color
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolCommunication.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Communication")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolWeather.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Weather")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolMaps.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Maps")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolObjectsAndTools.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Objects & Tools")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolDevices.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Devices")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolCamera.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Camera & Photos")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolGaming.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Gaming")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolConnectivity.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Connectivity")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolTransportation.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Transportation")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolAutomative.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Automative")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolAccessibility.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Accessibility")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolPrivacy.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Privacy & Security")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolHuman.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Human")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolHome.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Home")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolFitness.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Fitness")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolNature.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Nature")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolEditing.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Editing")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolTextformat.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Text Formatting")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolMedia.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Media")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolKeyboard.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Keyboard")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolCommerce.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Commerce")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolTime.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Time")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolHealth.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Health")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolShapes.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Shapes")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolArrows.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Arrows")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolIndices.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Indices")
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

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 10) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                                ForEach(symbolMath.symbols, id: \.self) { symbol in
                                    iconButton(for: symbol)
                                }
                            }
                            .padding(.leading, -5)
                        }
                        .padding(.top, 10)
                    },
                    label: {
                        Text("Math")
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

                // Description TextField
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                    TextField("Enter description", text: $controlDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
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
                    CustomSymbolView(symbolName: selectedSymbol, color: selectedColor, size: 100, fillColor: Color.white)
                    Spacer()
                }
                .padding(.top, 20)
            }.frame(height: 140)
        }
        .navigationTitle(getTitle())
        .onChange(of: selectedColor) { _ in saveConfig() }
        .onChange(of: selectedSymbol) { _ in saveConfig() }
        .onChange(of: controlDescription) { _ in saveConfig() }
        .onAppear { loadConfig() }
    }

    private func getTitle() -> String {
        if controlIndex <= 5 {
            return "Preset #\(controlIndex)"
        } else if controlIndex <= 15 {
            return "Custom #\(controlIndex - 5)"
        } else {
            return "Launcher #\(controlIndex - 15)"
        }
    }

    private func iconButton(for symbol: String) -> some View {
        Image(systemName: symbol)
            .font(.system(size: 30))
            .foregroundColor(symbol == selectedSymbol ? selectedColor : .gray)
            .onTapGesture {
                selectedSymbol = symbol
            }
    }

    private func saveConfig() {
        let uiColor = UIColor(selectedColor)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let config = ControlConfig(color: [red, green, blue, alpha], symbolName: selectedSymbol, description: controlDescription.isEmpty ? nil : controlDescription)
        let configData = try? JSONEncoder().encode(config)
        UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.set(configData, forKey: "widgetConfig\(controlIndex)")
        UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.synchronize()

        onConfigChange(selectedColor, selectedSymbol)
        WidgetCenter.shared.reloadAllTimelines()
    }

    private func loadConfig() {
        if let configData = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.data(forKey: "widgetConfig\(controlIndex)"),
           let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) {
            selectedColor = Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3])
            selectedSymbol = config.symbolName
            controlDescription = config.description ?? ""
        } else if controlIndex <= 5 {
            let preset = presets[controlIndex - 1]
            selectedColor = preset.0
            selectedSymbol = preset.1
            controlDescription = "Preset #\(controlIndex)"
        } else {
            selectedColor = .blue
            selectedSymbol = "questionmark.app.fill"
            controlDescription = controlIndex <= 15 ? "Custom #\(controlIndex - 5)" : "Launcher #\(controlIndex - 15)"
        }
    }
}

#Preview {
    NavigationView {
        ChangeView(
            controlIndex: 1,
            onConfigChange: { _, _ in }
        )
    }
}
