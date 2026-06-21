//
//  WidgetPreviewView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 24.09.2024.
//

import SwiftUI

struct WidgetPreviewView: View {
    let symbolName: String
    let color: Color
    let size: CGFloat
    let fillColor: Color

    var body: some View {
        ZStack {
            Circle()
                .fill(fillColor)
                .frame(width: size, height: size)

            if symbolName.isSFSymbol {
                Image(systemName: symbolName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size * 0.5, height: size * 0.5)
                    .foregroundStyle(color, color.opacity(0.2))
            } else {
                Text(symbolName)
                    .font(.system(size: size * 0.24))
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .foregroundStyle(color)
                    .frame(width: size * 0.86)
            }
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    WidgetPreviewView(symbolName: "heart.fill", color: .pink, size: 100, fillColor: .gray.opacity(0.2))
}
