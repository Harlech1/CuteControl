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
    
    let letterSymbols = (97...122).map { String(UnicodeScalar($0)) + ".circle.fill" }
    let randomSymbols = ["star.fill", "heart.fill", "bell.fill", "cloud.fill", "bolt.fill", 
                         "sun.max.fill", "moon.fill", "cloud.sun.fill", "wind", "snowflake"]
    
    // Preset değerlerini tanımlayalım
    let presets: [(Color, String)] = [
        (.pink, "heart.fill"),
        (.blue, "headphones"),
        (.yellow, "star.fill"),
        (.pink, "pawprint.fill"),
        (.black, "guitars.fill")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Control \(controlIndex) Ayarları")
                .font(.headline)
            
            ColorPicker("Renk Seçin", selection: $selectedColor)
            
            Text("İkon Seçin")
                .font(.headline)
            
            Group {
                Text("Harfler")
                    .font(.subheadline)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                    ForEach(letterSymbols, id: \.self) { symbol in
                        iconButton(for: symbol)
                    }
                }
                
                Text("Diğer Semboller")
                    .font(.subheadline)
                    .padding(.top)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                    ForEach(randomSymbols, id: \.self) { symbol in
                        iconButton(for: symbol)
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
        .onChange(of: selectedSymbol) { _ in saveConfig() }
        .onAppear { loadConfig() }
    }
    
    private func iconButton(for symbol: String) -> some View {
        Image(systemName: symbol)
            .font(.system(size: 30))
            .foregroundColor(symbol == selectedSymbol ? selectedColor : .gray)
            .onTapGesture {
                selectedSymbol = symbol
            }
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
        } else if controlIndex <= 5 {
            // Eğer kaydedilmiş bir değer yoksa ve bu bir preset ise, preset değerini kullan
            let preset = presets[controlIndex - 1]
            selectedColor = preset.0
            selectedSymbol = preset.1
        } else {
            // Diğer durumlarda varsayılan değeri kullan
            selectedColor = .red
            selectedSymbol = "\(controlIndex).circle.fill"
        }
    }
}
