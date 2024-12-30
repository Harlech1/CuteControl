//
//  WidgetConfigViewModel.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 5.10.2024.
//

import SwiftUI
import Combine
import WidgetKit

class WidgetConfigViewModel: ObservableObject {
    @Published var widgetConfigs: [Int: (Color, String)] = [:]
    
    private let userDefaults = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")
    
    let presets: [(Color, String)] = [
        (.pink, "l.circle.fill"),
        (.pink, "o.circle.fill"),
        (.pink, "v.circle.fill"),
        (.pink, "e.circle.fill"),
        (.pink, "heart.fill")
    ]
    
    init() {
        initializePresets()
        loadAllConfigs()
    }
    
    private func initializePresets() {
        for (index, preset) in presets.enumerated() {
            let key = "widgetConfig\(index + 1)"
            if userDefaults?.object(forKey: key) == nil {
                saveConfig(index: index + 1, color: preset.0, symbol: preset.1, description: "Preset #\(index + 1)")
            }
        }
    }
    
    func loadAllConfigs() {
        for index in 1...20 {
            if let config = loadConfig(for: index) {
                widgetConfigs[index] = config
            } else if index <= 5 {
                widgetConfigs[index] = presets[index - 1]
            } else {
                widgetConfigs[index] = (.blue, "questionmark.app.fill")
            }
        }
    }
    
    func loadConfig(for index: Int) -> (Color, String)? {
        guard let configData = userDefaults?.data(forKey: "widgetConfig\(index)"),
              let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) else {
            return nil
        }
        return (Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]), config.symbolName)
    }
    
    func saveConfig(index: Int, color: Color, symbol: String, description: String?) {
        let uiColor = UIColor(color)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let config = ControlConfig(color: [red, green, blue, alpha], symbolName: symbol, description: description)
        let configData = try? JSONEncoder().encode(config)
        userDefaults?.set(configData, forKey: "widgetConfig\(index)")
        
        widgetConfigs[index] = (color, symbol)
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func getDescription(for index: Int) -> String? {
        guard let configData = userDefaults?.data(forKey: "widgetConfig\(index)"),
              let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) else {
            return nil
        }
        return config.description
    }
    
    func labelFor(index: Int, in section: String) -> String {
        switch section {
        case "Preset":
            return "Preset #\(index)"
        case "Custom":
            return "Custom #\(index - 5)"
        case "Extra":
            return "Extra #\(index - 15)"
        default:
            return ""
        }
    }
}
