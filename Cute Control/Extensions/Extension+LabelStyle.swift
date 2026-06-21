//
//  Extension.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 24.09.2024.
//

import SwiftUI
import UIKit

extension String {
    /// True when this string is a valid SF Symbol name. Lets us tell apart
    /// SF Symbols (rendered with `Image(systemName:)`) from kaomoji / plain
    /// text (rendered with `Text`), without changing the stored data model.
    var isSFSymbol: Bool {
        UIImage(systemName: self) != nil
    }
}

struct ColorfulIconLabelStyle: LabelStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
        } icon: {
            configuration.icon
                .imageScale(.small)
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 28, height: 28)
                        .foregroundColor(color)
                }
        }
    }
}

extension LabelStyle where Self == ColorfulIconLabelStyle {
    static func colorful(_ color: Color) -> Self {
        ColorfulIconLabelStyle(color: color)
    }
}
