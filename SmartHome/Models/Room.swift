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
    var lampsOn: [Bool]
    var doorClosed: Bool
    var timeOfDay: TimeOfDay
}

