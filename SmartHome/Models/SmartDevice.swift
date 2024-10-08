import Foundation

enum DeviceType: String {
    case light = "Licht"
    case thermostat = "Thermostat"
    case lock = "Schloss"
}

struct SmartDevice: Identifiable {
    let id = UUID() // Eindeutige ID für jedes Gerät
    var name: String
    var type: DeviceType
    var isOn: Bool = false // Standardwert
    var temperature: Double = 20.0 // Standardwert für Thermostat
    var isLocked: Bool = true // Standardwert für Schloss
}
