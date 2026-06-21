//
//  ControlControl.swift
//  Control
//
//  Created by Türker Kızılcık on 21.09.2024.
//
//  20 Control Center toggles, all driven by one shared implementation.
//  Each control is purely cosmetic: it remembers an on/off state and shows
//  the user's chosen color, SF Symbol and label. Configuration is read from
//  the shared App Group; toggle state is stored per-index.
//

import AppIntents
import SwiftUI
import WidgetKit
import UIKit

// MARK: - Shared constants & helpers

private let appGroupSuite = "group.com.turkerkizilcik.Cute-Control"

/// Fallback label when a slot has no custom description, matching the
/// Preset / Custom / Extra grouping used in the main app.
func cuteControlDefaultLabel(for index: Int) -> String {
    switch index {
    case ...5:  return "Preset #\(index)"
    case ...15: return "Custom #\(index - 5)"
    default:    return "Extra #\(index - 15)"
    }
}

/// Default glyph used when a slot holds a kaomoji instead of an SF Symbol —
/// Control Center only renders SF Symbols as a control's icon, so the kaomoji
/// itself is shown as the control's title instead (see the body below).
private let kaomojiFallbackSymbol = "heart.fill"

/// True when the stored value is a real SF Symbol; false means it's a kaomoji.
private func isSFSymbol(_ name: String) -> Bool {
    UIImage(systemName: name) != nil
}

private func toggleStateKey(for index: Int) -> String { "controlWidget\(index)State" }

/// Current on/off state for a control. New controls default to ON so they start
/// colorful; once the user toggles, the chosen state is remembered.
private func isControlOn(_ index: Int) -> Bool {
    let defaults = UserDefaults(suiteName: appGroupSuite)
    guard let defaults, defaults.object(forKey: toggleStateKey(for: index)) != nil else {
        return true
    }
    return defaults.bool(forKey: toggleStateKey(for: index))
}

// MARK: - Toggle intent
//
// A real on/off toggle: tapping flips the stored state. On = the control shows
// in its tint color; off = Control Center renders it muted.

struct CuteControlToggleIntent: SetValueIntent {
    static let title: LocalizedStringResource = "Cute Control"

    @Parameter(title: "Control Index")
    var index: Int

    @Parameter(title: "Is On")
    var value: Bool

    init() {}

    init(index: Int) {
        self.index = index
    }

    func perform() async throws -> some IntentResult {
        UserDefaults(suiteName: appGroupSuite)?.set(value, forKey: toggleStateKey(for: index))
        ControlCenter.shared.reloadAllControls()
        return .result()
    }
}

// MARK: - Shared widget implementation

protocol CuteControlWidget: ControlWidget {
    static var index: Int { get }
}

extension CuteControlWidget {
    var body: some ControlWidgetConfiguration {
        let index = Self.index
        return StaticControlConfiguration(
            kind: "com.turkerkizilcik.Cute-Control.Control\(index)",
            provider: ConfigProvider(index: index)
        ) { config in
            // The description is the control's name (kaomoji live here); the
            // symbol is the glyph. The `isSFSymbol` guard keeps a stray
            // non-symbol value (e.g. old data) from breaking the glyph.
            let glyph = isSFSymbol(config.symbolName) ? config.symbolName : kaomojiFallbackSymbol
            let title = config.description ?? cuteControlDefaultLabel(for: index)

            // Real on/off toggle (defaults on so it starts colorful).
            ControlWidgetToggle(isOn: isControlOn(index), action: CuteControlToggleIntent(index: index)) {
                Label {
                    Text(title)
                } icon: {
                    Image(systemName: glyph)
                }
            }
            .tint(Color(.sRGB,
                        red: config.color[0],
                        green: config.color[1],
                        blue: config.color[2],
                        opacity: config.color[3]))
        }
        .displayName(LocalizedStringResource(stringLiteral: cuteControlDefaultLabel(for: index)))
        .description(LocalizedStringResource(stringLiteral:
            ConfigProvider(index: index).previewValue.description ?? cuteControlDefaultLabel(for: index)))
    }
}

// MARK: - The 20 concrete controls
//
// Control Center requires a distinct concrete type per control (each needs its
// own `kind`), so the types can't be generated in a loop — but with the shared
// `body` above, every one is a single line.

struct ControlWidget1:  CuteControlWidget { static let index = 1 }
struct ControlWidget2:  CuteControlWidget { static let index = 2 }
struct ControlWidget3:  CuteControlWidget { static let index = 3 }
struct ControlWidget4:  CuteControlWidget { static let index = 4 }
struct ControlWidget5:  CuteControlWidget { static let index = 5 }
struct ControlWidget6:  CuteControlWidget { static let index = 6 }
struct ControlWidget7:  CuteControlWidget { static let index = 7 }
struct ControlWidget8:  CuteControlWidget { static let index = 8 }
struct ControlWidget9:  CuteControlWidget { static let index = 9 }
struct ControlWidget10: CuteControlWidget { static let index = 10 }
struct ControlWidget11: CuteControlWidget { static let index = 11 }
struct ControlWidget12: CuteControlWidget { static let index = 12 }
struct ControlWidget13: CuteControlWidget { static let index = 13 }
struct ControlWidget14: CuteControlWidget { static let index = 14 }
struct ControlWidget15: CuteControlWidget { static let index = 15 }
struct ControlWidget16: CuteControlWidget { static let index = 16 }
struct ControlWidget17: CuteControlWidget { static let index = 17 }
struct ControlWidget18: CuteControlWidget { static let index = 18 }
struct ControlWidget19: CuteControlWidget { static let index = 19 }
struct ControlWidget20: CuteControlWidget { static let index = 20 }

// MARK: - Config model & provider

struct ControlConfig: Codable {
    var color: [CGFloat]
    var symbolName: String
    var description: String?
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
            let configData = UserDefaults(suiteName: appGroupSuite)?.data(forKey: "widgetConfig\(index)"),
            let config = try? JSONDecoder().decode(ControlConfig.self, from: configData)
        else {
            return getDefaultConfig(for: index)
        }
        return config
    }

    private func getDefaultConfig(for index: Int) -> ControlConfig {
        let presets: [(Color, String)] = [
            (.pink, "l.circle.fill"),
            (.pink, "o.circle.fill"),
            (.pink, "v.circle.fill"),
            (.pink, "e.circle.fill"),
            (.pink, "heart.fill")
        ]

        if index <= 5 {
            let preset = presets[index - 1]
            let uiColor = UIColor(preset.0)
            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            return ControlConfig(color: [red, green, blue, alpha],
                                 symbolName: preset.1,
                                 description: cuteControlDefaultLabel(for: index))
        } else {
            return ControlConfig(color: [1, 0, 0, 1],
                                 symbolName: "questionmark.app.fill",
                                 description: cuteControlDefaultLabel(for: index))
        }
    }
}
