//
//  ControlControl.swift
//  Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import AppIntents
import SwiftUI
import WidgetKit

struct ControlWidget1: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control1",
            provider: ConfigProvider(index: 1)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #1")
        .description("Preset Control Widget #1")
    }
}

struct ControlWidget2: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control2",
            provider: ConfigProvider(index: 2)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #2")
        .description("Preset Control Widget #2")
    }
}

struct ControlWidget3: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control3",
            provider: ConfigProvider(index: 3)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #3")
        .description("Preset Control Widget #3")
    }
}

struct ControlWidget4: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control4",
            provider: ConfigProvider(index: 4)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #4")
        .description("Preset Control Widget #4")
    }
}

struct ControlWidget5: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control5",
            provider: ConfigProvider(index: 5)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #5")
        .description("Preset Control Widget #5")
    }
}

struct ControlWidget6: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control6",
            provider: ConfigProvider(index: 6)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #1")
        .description("Custom Control Widget #1")
    }
}

struct ControlWidget7: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control7",
            provider: ConfigProvider(index: 7)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #2")
        .description("Custom Control Widget #2")
    }
}

struct ControlWidget8: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control8",
            provider: ConfigProvider(index: 8)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #3")
        .description("Custom Control Widget #3")
    }
}

struct ControlWidget9: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control9",
            provider: ConfigProvider(index: 9)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #4")
        .description("Custom Control Widget #4")
    }
}

struct ControlWidget10: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control10",
            provider: ConfigProvider(index: 10)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #5")
        .description("Custom Control Widget #5")
    }
}

struct ControlWidget11: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control11",
            provider: ConfigProvider(index: 11)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #6")
        .description("Custom Control Widget #6")
    }
}

struct ControlWidget12: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control12",
            provider: ConfigProvider(index: 12)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #7")
        .description("Custom Control Widget #7")
    }
}

struct ControlWidget13: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control13",
            provider: ConfigProvider(index: 13)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #8")
        .description("Custom Control Widget #8")
    }
}

struct ControlWidget14: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control14",
            provider: ConfigProvider(index: 14)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #9")
        .description("Custom Control Widget #9")
    }
}

struct ControlWidget15: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control15",
            provider: ConfigProvider(index: 15)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #10")
        .description("Custom Control Widget #10")
    }
}

struct ControlWidget16: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control16",
            provider: ConfigProvider(index: 16)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Launcher #1")
        .description("Launcher Control Widget #1")
    }
}

struct ControlWidget17: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control17",
            provider: ConfigProvider(index: 17)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Launcher #2")
        .description("Launcher Control Widget #2")
    }
}

struct ControlWidget18: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control18",
            provider: ConfigProvider(index: 18)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Launcher #3")
        .description("Launcher Control Widget #3")
    }
}

struct ControlWidget19: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control19",
            provider: ConfigProvider(index: 19)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Launcher #4")
        .description("Launcher Control Widget #4")
    }
}

struct ControlWidget20: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control20",
            provider: ConfigProvider(index: 20)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Image(systemName: config.symbolName)
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Launcher #5")
        .description("Launcher Control Widget #5")
    }
}

struct ControlConfig: Codable {
    var color: [CGFloat]
    var symbolName: String
}

struct ConfigProvider: ControlValueProvider {
    let index: Int
    
    func currentValue() async throws -> ControlConfig {
        return loadConfig(for: index)
    }
    
    var previewValue: ControlConfig {
        return loadConfig(for: index)
    }
    
    private func loadConfig(for index: Int) -> ControlConfig {
        if let configData = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.data(forKey: "widgetConfig\(index)"),
           let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) {
            return config
        }
        return getDefaultConfig(for: index)
    }
    
    private func getDefaultConfig(for index: Int) -> ControlConfig {
        let presets: [(Color, String)] = [
            (.pink, "heart.fill"),
            (.blue, "headphones"),
            (.yellow, "star.fill"),
            (.pink, "pawprint.fill"),
            (.black, "guitars.fill")
        ]
        
        if index <= 5 {
            let preset = presets[index - 1]
            let uiColor = UIColor(preset.0)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return ControlConfig(color: [red, green, blue, alpha], symbolName: preset.1)
        } else {
            return ControlConfig(color: [1, 0, 0, 1], symbolName: "questionmark.app.fill")
        }
    }
}

struct Action_Q: SetValueIntent {
    static let title: LocalizedStringResource = "Start a timer"

    @Parameter(title: "Timer is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}

