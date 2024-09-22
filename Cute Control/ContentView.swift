//
//  ContentView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var widgetConfigs: [Int: (Color, String)] = [:]
    
    init() {
        _widgetConfigs = State(initialValue: loadConfigs())
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 20) {
                    ForEach(1...20, id: \.self) { index in
                        NavigationLink(destination: ChangeView(controlIndex: index, onConfigChange: { color, symbol in
                            widgetConfigs[index] = (color, symbol)
                        })) {
                            Circle()
                                .fill(Color.gray.opacity(0.15))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: widgetConfigs[index]?.1 ?? "\(index).circle.fill")
                                        .foregroundColor(widgetConfigs[index]?.0 ?? .red)
                                        .font(.system(size: 24))
                                )
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Control Widgets")
        }
    }
    
    func loadConfigs() -> [Int: (Color, String)] {
        var configs: [Int: (Color, String)] = [:]
        for index in 1...20 {
            if let configData = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.data(forKey: "widgetConfig\(index)"),
               let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) {
                configs[index] = (Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]), config.symbolName)
            } else {
                configs[index] = (.red, "\(index).circle.fill")
            }
        }
        return configs
    }
}

extension Color {
    static func fromString(_ colorName: String) -> Color {
        switch colorName.lowercased() {
        case "green":
            return .green
        case "red":
            return .red
        case "blue":
            return .blue
            // Diğer renkleri de ekleyebilirsiniz
        default:
            return .red
        }
    }
}

#Preview {
    ContentView()
}
