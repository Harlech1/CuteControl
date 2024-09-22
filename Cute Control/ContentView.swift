//
//  ContentView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var widgetConfigs: [Int: (Color, String)] = [:]
    
    let presets: [(Color, String)] = [
        (.pink, "heart.fill"),
        (.blue, "headphones"),
        (.yellow, "star.fill"),
        (.pink, "pawprint.fill"),
        (.black, "guitars.fill")
    ]
    
    init() {
        initializePresets()
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
    
    private func initializePresets() {
        let userDefaults = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")
        for (index, preset) in presets.enumerated() {
            let key = "widgetConfig\(index + 1)"
            if userDefaults?.object(forKey: key) == nil {
                let uiColor = UIColor(preset.0)
                var red: CGFloat = 0
                var green: CGFloat = 0
                var blue: CGFloat = 0
                var alpha: CGFloat = 0
                uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                
                let config = ControlConfig(color: [red, green, blue, alpha], symbolName: preset.1)
                let configData = try? JSONEncoder().encode(config)
                userDefaults?.set(configData, forKey: key)
            }
        }
        userDefaults?.synchronize()
    }

    func loadConfigs() -> [Int: (Color, String)] {
        var configs: [Int: (Color, String)] = [:]
        let userDefaults = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")
        
        for index in 1...20 {
            if let configData = userDefaults?.data(forKey: "widgetConfig\(index)"),
               let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) {
                configs[index] = (Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]), config.symbolName)
            } else if index <= 5 {
                configs[index] = presets[index - 1]
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
