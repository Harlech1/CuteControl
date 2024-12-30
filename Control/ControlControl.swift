//
//  ControlControl.swift
//  Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//

import AppIntents
import SwiftUI
import WidgetKit

protocol ToggleableControlWidget: ControlWidget {
    var index: Int { get }
}

extension ToggleableControlWidget {
    var value: Bool {
        get {
            UserDefaults.standard.bool(forKey: "controlWidget\(index)State")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "controlWidget\(index)State")
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
}

struct Action_Q1: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 1"

    @Parameter(title: "Widget 1 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget1()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q2: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 2"

    @Parameter(title: "Widget 2 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget2()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q3: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 3"

    @Parameter(title: "Widget 3 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget3()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q4: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 4"

    @Parameter(title: "Widget 4 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget4()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q5: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 5"

    @Parameter(title: "Widget 5 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget5()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q6: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 6"

    @Parameter(title: "Widget 6 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget6()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q7: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 7"

    @Parameter(title: "Widget 7 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget7()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q8: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 8"

    @Parameter(title: "Widget 8 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget8()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q9: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 9"

    @Parameter(title: "Widget 9 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget9()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q10: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 10"

    @Parameter(title: "Widget 10 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget10()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q11: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 11"

    @Parameter(title: "Widget 11 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget11()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q12: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 12"

    @Parameter(title: "Widget 12 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget12()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q13: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 13"

    @Parameter(title: "Widget 13 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget13()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q14: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 14"

    @Parameter(title: "Widget 14 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget14()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q15: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 15"

    @Parameter(title: "Widget 15 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget15()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q16: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 16"

    @Parameter(title: "Widget 16 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget16()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q17: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 17"

    @Parameter(title: "Widget 17 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget17()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q18: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 18"

    @Parameter(title: "Widget 18 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget18()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q19: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 19"

    @Parameter(title: "Widget 19 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget19()
        widget.value.toggle()
        return .result()
    }
}

struct Action_Q20: SetValueIntent {
    static let title: LocalizedStringResource = "Widget 20"

    @Parameter(title: "Widget 20 is running")
    var value: Bool

    func perform() async throws -> some IntentResult {
        WidgetCenter.shared.reloadAllTimelines()
        var widget = ControlWidget20()
        widget.value.toggle()
        return .result()
    }
}

struct ControlWidget1: ToggleableControlWidget {
    let index = 1
    static let title: LocalizedStringResource = "Control Widget 1"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control1",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q1()) {
                Label {
                    Text(config.description ?? "Preset #1")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #1")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #1"))
    }
}

struct ControlWidget2: ToggleableControlWidget {
    let index = 2
    static let title: LocalizedStringResource = "Control Widget 2"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control2",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q2()) {
                Label {
                    Text(config.description ?? "Preset #2")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #2")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #2"))
    }
}

struct ControlWidget3: ToggleableControlWidget {
    let index = 3
    static let title: LocalizedStringResource = "Control Widget 3"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control3",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q3()) {
                Label {
                    Text(config.description ?? "Preset #3")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #3")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #3"))
    }
}

struct ControlWidget4: ToggleableControlWidget {
    let index = 4
    static let title: LocalizedStringResource = "Control Widget 4"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control4",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q4()) {
                Label {
                    Text(config.description ?? "Preset #4")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #4")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #4"))
    }
}

struct ControlWidget5: ToggleableControlWidget {
    let index = 5
    static let title: LocalizedStringResource = "Control Widget 5"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control5",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q5()) {
                Label {
                    Text(config.description ?? "Preset #5")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #5")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #5"))
    }
}

struct ControlWidget6: ToggleableControlWidget {
    let index = 6
    static let title: LocalizedStringResource = "Control Widget 6"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control6",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q6()) {
                Label {
                    Text(config.description ?? "Preset #6")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #6")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #6"))
    }
}

struct ControlWidget7: ToggleableControlWidget {
    let index = 7
    static let title: LocalizedStringResource = "Control Widget 7"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control7",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q7()) {
                Label {
                    Text(config.description ?? "Preset #7")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #7")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #7"))
    }
}

struct ControlWidget8: ToggleableControlWidget {
    let index = 8
    static let title: LocalizedStringResource = "Control Widget 8"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control8",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q8()) {
                Label {
                    Text(config.description ?? "Preset #8")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #8")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #8"))
    }
}

struct ControlWidget9: ToggleableControlWidget {
    let index = 9
    static let title: LocalizedStringResource = "Control Widget 9"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control9",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q9()) {
                Label {
                    Text(config.description ?? "Preset #9")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #9")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #9"))
    }
}

struct ControlWidget10: ToggleableControlWidget {
    let index = 10
    static let title: LocalizedStringResource = "Control Widget 10"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control10",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q10()) {
                Label {
                    Text(config.description ?? "Preset #10")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #10")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #10"))
    }
}

struct ControlWidget11: ToggleableControlWidget {
    let index = 11
    static let title: LocalizedStringResource = "Control Widget 11"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control11",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q11()) {
                Label {
                    Text(config.description ?? "Preset #11")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #11")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #11"))
    }
}

struct ControlWidget12: ToggleableControlWidget {
    let index = 12
    static let title: LocalizedStringResource = "Control Widget 12"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control12",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q12()) {
                Label {
                    Text(config.description ?? "Preset #12")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #12")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #12"))
    }
}

struct ControlWidget13: ToggleableControlWidget {
    let index = 13
    static let title: LocalizedStringResource = "Control Widget 13"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control13",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q13()) {
                Label {
                    Text(config.description ?? "Preset #13")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #13")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #13"))
    }
}

struct ControlWidget14: ToggleableControlWidget {
    let index = 14
    static let title: LocalizedStringResource = "Control Widget 14"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control14",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q14()) {
                Label {
                    Text(config.description ?? "Preset #14")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #14")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #14"))
    }
}

struct ControlWidget15: ToggleableControlWidget {
    let index = 15
    static let title: LocalizedStringResource = "Control Widget 15"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control15",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q15()) {
                Label {
                    Text(config.description ?? "Preset #15")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #15")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #15"))
    }
}

struct ControlWidget16: ToggleableControlWidget {
    let index = 16
    static let title: LocalizedStringResource = "Control Widget 16"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control16",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q16()) {
                Label {
                    Text(config.description ?? "Preset #16")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #16")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #16"))
    }
}

struct ControlWidget17: ToggleableControlWidget {
    let index = 17
    static let title: LocalizedStringResource = "Control Widget 17"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control17",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q17()) {
                Label {
                    Text(config.description ?? "Preset #17")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #17")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #17"))
    }
}

struct ControlWidget18: ToggleableControlWidget {
    let index = 18
    static let title: LocalizedStringResource = "Control Widget 18"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control18",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q18()) {
                Label {
                    Text(config.description ?? "Preset #18")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #18")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #18"))
    }
}

struct ControlWidget19: ToggleableControlWidget {
    let index = 19
    static let title: LocalizedStringResource = "Control Widget 19"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control19",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q19()) {
                Label {
                    Text(config.description ?? "Preset #19")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #19")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #19"))
    }
}

struct ControlWidget20: ToggleableControlWidget {
    let index = 20
    static let title: LocalizedStringResource = "Control Widget 20"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control20",
            provider: ConfigProvider(index: index)
        ) { config in
            ControlWidgetToggle(isOn: value, action: Action_Q20()) {
                Label {
                    Text(config.description ?? "Preset #20")
                } icon: {
                    Image(systemName: config.symbolName)
                }
            }
            .tint(Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3]))
        }
        .displayName("Preset #20")
        .description(LocalizedStringResource(stringLiteral: ConfigProvider(index: index).previewValue.description ?? "Preset Control Widget #20"))
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
        guard
            let configData = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.data(forKey: "widgetConfig\(index)"),
            let config = try? JSONDecoder().decode(ControlConfig.self, from: configData)
        else {
            return getDefaultConfig(for: index)
        }
        return config
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
