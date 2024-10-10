//
//  Room.swift
//  SmartHome
//
//  Created by Hamzah on 09.10.24.
//
import Foundation

struct Room: Identifiable, Codable {
    var id = UUID()
    var name: String
    var temperature: Int
    var lampCount: Int
    var lampsOn: [Bool] // Bool Array ist Codable
    var doorClosed: Bool
    var timeOfDay: TimeOfDay
    var season: Season
    

    // Füge einen Initializer hinzu, wenn du ihn brauchst
    init(name: String, temperature: Int, lampCount: Int, lampsOn: [Bool], doorClosed: Bool, timeOfDay: TimeOfDay, season: Season) {
        self.name = name
        self.temperature = temperature
        self.lampCount = lampCount
        self.lampsOn = lampsOn
        self.doorClosed = doorClosed
        self.timeOfDay = timeOfDay
        self.season = season
    }
}
