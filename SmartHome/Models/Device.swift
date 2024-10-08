//
//  Device.swift
//  SmartHome
//
//  Created by Hamzah on 07.10.24.
//

import Foundation

// Enum für die verschiedenen Gerätetypen
enum DeviceType: String {
    case light = "Light"
    case thermostat = "Thermostat"
    case lock = "Lock"
}

// Erweiterte Version des Device Structs
struct Device: Identifiable {
    let id: UUID // Eindeutige Identifikation
    var name: String // Name des Geräts
    var type: DeviceType // Typ des Geräts (z. B. Licht, Thermostat, Schloss)
    var isOn: Bool = false // Gibt an, ob das Gerät eingeschaltet ist (Standardwert: false)
    var temperature: Double = 20.0 // Temperatur für Geräte wie Thermostate (Standardwert: 20)
    var isLocked: Bool = true // Gibt an, ob das Gerät verriegelt ist (Standardwert: true)
    
    // Initializer (Optionale Parameter haben Standardwerte)
    init(id: UUID = UUID(), name: String, type: DeviceType, isOn: Bool = false, temperature: Double = 20.0, isLocked: Bool = true) {
        self.id = id
        self.name = name
        self.type = type
        self.isOn = isOn
        self.temperature = temperature
        self.isLocked = isLocked
    }
}
