//
//  Extension.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 24.09.2024.
//

import Foundation
import SwiftUI

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
