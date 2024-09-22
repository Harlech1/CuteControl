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
        .displayName("Control 1")
        .description("Control Widget 1")
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
        .displayName("Control 2")
        .description("Control Widget 2")
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
        .displayName("Control 3")
        .description("Control Widget 3")
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
        .displayName("Control 4")
        .description("Control Widget 4")
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
        .displayName("Control 5")
        .description("Control Widget 5")
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
        .displayName("Control 6")
        .description("Control Widget 6")
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
        .displayName("Control 7")
        .description("Control Widget 7")
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
        .displayName("Control 8")
        .description("Control Widget 8")
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
        .displayName("Control 9")
        .description("Control Widget 9")
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
        .displayName("Control 10")
        .description("Control Widget 10")
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
        .displayName("Control 11")
        .description("Control Widget 11")
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
        .displayName("Control 12")
        .description("Control Widget 12")
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
        .displayName("Control 13")
        .description("Control Widget 13")
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
        .displayName("Control 14")
        .description("Control Widget 14")
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
        .displayName("Control 15")
        .description("Control Widget 15")
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
        .displayName("Control 16")
        .description("Control Widget 16")
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
        .displayName("Control 17")
        .description("Control Widget 17")
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
        .displayName("Control 18")
        .description("Control Widget 18")
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
        .displayName("Control 19")
        .description("Control Widget 19")
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
        .displayName("Control 20")
        .description("Control Widget 20")
    }
}

struct ControlConfig: Codable {
    var color: [CGFloat]
    var symbolName: String
}

struct ConfigProvider: ControlValueProvider {
    let index: Int
    
    func currentValue() async throws -> ControlConfig {
        if let configData = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.data(forKey: "widgetConfig\(index)"),
           let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) {
            return config
        }
        return ControlConfig(color: [1, 0, 0, 1], symbolName: "\(index).circle.fill") // Varsayılan kırmızı renk ve numara ikonu
    }
    
    var previewValue: ControlConfig {
        ControlConfig(color: [1, 0, 0, 1], symbolName: "\(index).circle.fill")
    }
}

struct Action_Q: SetValueIntent {
    static let title: LocalizedStringResource = "Start a timer"

    @Parameter(title: "Timer is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        return .result()
    }
}

