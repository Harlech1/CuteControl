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
                Label {
                    Text(config.description ?? "Preset #1")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #1")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 1).previewValue.description ?? "Preset Control Widget #1"))
    }
}

struct ControlWidget2: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control2",
            provider: ConfigProvider(index: 2)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Preset #2")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #2")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 2).previewValue.description ?? "Preset Control Widget #2"))
    }
}

struct ControlWidget3: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control3",
            provider: ConfigProvider(index: 3)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Preset #3")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #3")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 3).previewValue.description ?? "Preset Control Widget #3"))
    }
}

struct ControlWidget4: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control4",
            provider: ConfigProvider(index: 4)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Preset #4")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #4")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 4).previewValue.description ?? "Preset Control Widget #4"))
    }
}

struct ControlWidget5: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control5",
            provider: ConfigProvider(index: 5)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Preset #5")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #5")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 5).previewValue.description ?? "Preset Control Widget #5"))
    }
}

struct ControlWidget6: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control6",
            provider: ConfigProvider(index: 6)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #1")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #1")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 6).previewValue.description ?? "Custom Control Widget #1"))
    }
}

struct ControlWidget7: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control7",
            provider: ConfigProvider(index: 7)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #2")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #2")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 7).previewValue.description ?? "Custom Control Widget #2"))
    }
}

struct ControlWidget8: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control8",
            provider: ConfigProvider(index: 8)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #3")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #3")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 8).previewValue.description ?? "Custom Control Widget #3"))
    }
}

struct ControlWidget9: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control9",
            provider: ConfigProvider(index: 9)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #4")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #4")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 9).previewValue.description ?? "Custom Control Widget #4"))
    }
}

struct ControlWidget10: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control10",
            provider: ConfigProvider(index: 10)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #5")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #5")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 10).previewValue.description ?? "Custom Control Widget #5"))
    }
}

struct ControlWidget11: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control11",
            provider: ConfigProvider(index: 11)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #6")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #6")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 11).previewValue.description ?? "Custom Control Widget #6"))
    }
}

struct ControlWidget12: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control12",
            provider: ConfigProvider(index: 12)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #7")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #7")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 12).previewValue.description ?? "Custom Control Widget #7"))
    }
}

struct ControlWidget13: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control13",
            provider: ConfigProvider(index: 13)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #8")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #8")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 13).previewValue.description ?? "Custom Control Widget #8"))
    }
}

struct ControlWidget14: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control14",
            provider: ConfigProvider(index: 14)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #9")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #9")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 14).previewValue.description ?? "Custom Control Widget #9"))
    }
}

struct ControlWidget15: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control15",
            provider: ConfigProvider(index: 15)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Custom #10")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Custom #10")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 15).previewValue.description ?? "Custom Control Widget #10"))
    }
}

struct ControlWidget16: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control16",
            provider: ConfigProvider(index: 16)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Extra #1")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Extra #1")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 16).previewValue.description ?? "Extra Control Widget #1"))
    }
}

struct ControlWidget17: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control17",
            provider: ConfigProvider(index: 17)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Extra #2")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Extra #2")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 17).previewValue.description ?? "Extra Control Widget #2"))
    }
}

struct ControlWidget18: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control18",
            provider: ConfigProvider(index: 18)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Extra #3")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Extra #3")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 18).previewValue.description ?? "Extra Control Widget #3"))
    }
}

struct ControlWidget19: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control19",
            provider: ConfigProvider(index: 19)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Extra #4")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Extra #4")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 19).previewValue.description ?? "Extra Control Widget #4"))
    }
}

struct ControlWidget20: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control20",
            provider: ConfigProvider(index: 20)
        ) { config in
            ControlWidgetToggle(isOn: true, action: Action_Q()) {
                Label {
                    Text(config.description ?? "Extra #5")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Extra #5")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: 20).previewValue.description ?? "Extra Control Widget #5"))
    }
}

struct ControlConfig: Codable {
    var color: [CGFloat]
    var symbolName: String
    var description: String?  // Opsiyonel yaptık
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
        let presets: [(Color, String, String)] = [
            (.pink, "l.circle.fill", "Preset #1"),
            (.pink, "o.circle.fill", "Preset #2"),
            (.pink, "v.circle.fill", "Preset #3"),
            (.pink, "e.circle.fill", "Preset #4"),
            (.pink, "heart.fill", "Preset #5")
        ]
        
        if index <= 5 {
            let preset = presets[index - 1]
            let uiColor = UIColor(preset.0)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return ControlConfig(color: [red, green, blue, alpha], symbolName: preset.1, description: preset.2)
        } else {
            return ControlConfig(color: [1, 0, 0, 1], symbolName: "questionmark.app.fill", description: index <= 15 ? "Custom #\(index - 5)" : "Extra #\(index - 15)")
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

