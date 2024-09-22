//
//  ChangeView.swift
//  Cute Control
//
//  Created by Türker Kızılcık on 22.09.2024.
//

import SwiftUI
import WidgetKit

// ControlConfig yapısını ekleyelim
struct ControlConfig: Codable {
    var color: [CGFloat]
    var symbolName: String
}

struct ChangeView: View {
    let controlIndex: Int
    let onConfigChange: (Color, String) -> Void
    @State private var selectedColor: Color = .red
    @State private var selectedSymbol: String = "1.circle.fill"
    
    let symbols = ["l.circle.fill", "o.circle.fill", "v.circle.fill", "e.circle.fill", "heart.fill", 
                   "sun.max.fill", "moon.fill", "cloud.sun.fill", "wind", "snowflake",
                   "flame.fill", "drop.fill", "leaf.fill", "camera.fill", "message.fill",
                   "phone.fill", "envelope.fill", "cart.fill", "gift.fill", "flag.fill"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Control \(controlIndex) Ayarları")
                .font(.headline)
            
            ColorPicker("Renk Seçin", selection: $selectedColor)
            
            Text("İkon Seçin")
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                ForEach(symbols, id: \.self) { symbol in
                    Image(systemName: symbol)
                        .font(.system(size: 30))
                        .foregroundColor(symbol == selectedSymbol ? selectedColor : .gray)
                        .onTapGesture {
                            selectedSymbol = symbol
                            saveConfig()
                        }
                }
            }
            
            Circle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
                .overlay(
                    Image(systemName: selectedSymbol)
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                )
                .shadow(radius: 5)
        }
        .padding()
        .navigationTitle("Widget Ayarları")
        .onChange(of: selectedColor) { _ in saveConfig() }
        .onAppear { loadConfig() }
    }
    
    private func saveConfig() {
        let uiColor = UIColor(selectedColor)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let config = ControlConfig(color: [red, green, blue, alpha], symbolName: selectedSymbol)
        let configData = try? JSONEncoder().encode(config)
        UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.set(configData, forKey: "widgetConfig\(controlIndex)")
        UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.synchronize()
        
        onConfigChange(selectedColor, selectedSymbol)
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    private func loadConfig() {
        if let configData = UserDefaults(suiteName: "group.com.turkerkizilcik.Cute-Control")?.data(forKey: "widgetConfig\(controlIndex)"),
           let config = try? JSONDecoder().decode(ControlConfig.self, from: configData) {
            selectedColor = Color(.sRGB, red: config.color[0], green: config.color[1], blue: config.color[2], opacity: config.color[3])
            selectedSymbol = config.symbolName
        }
    }
}
