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
                VStack(alignment: .leading, spacing: 20) {
                    sectionView(title: "Preset", range: 1...5)
                    sectionView(title: "Custom", range: 6...15)
                    sectionView(title: "Launcher", range: 16...20)
                }
                .padding()
            }
            .navigationTitle("Control Center")
        }
    }
    
    private func sectionView(title: String, range: ClosedRange<Int>) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 5)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                ForEach(range, id: \.self) { index in
                    NavigationLink(destination: ChangeView(controlIndex: index, onConfigChange: { color, symbol in
                        widgetConfigs[index] = (color, symbol)
                    })) {
                        VStack {
                            Circle()
                                .fill(Color.gray.opacity(0.15))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: widgetConfigs[index]?.1 ?? "\(index).circle.fill")
                                        .foregroundColor(widgetConfigs[index]?.0 ?? .red)
                                        .font(.system(size: 24))
                                )
                            Text(labelFor(index: index, in: title))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
    
    private func labelFor(index: Int, in section: String) -> String {
        switch section {
        case "Preset":
            return "Preset #\(index)"
        case "Custom":
            return "Custom #\(index - 5)"
        case "Launcher":
            return "Launcher #\(index - 15)"
        default:
            return ""
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
