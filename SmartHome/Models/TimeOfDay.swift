//
//  TimeOfDay.swift
//  SmartHome
//
//  Created by Hamzah on 10.10.24.
//

import Foundation
enum Season: String, CaseIterable, Codable {
    case spring = "Frühling"
    case summer = "Sommer"
    case fall = "Herbst"
    case winter = "Winter"
}

enum TimeOfDay: String, Codable {
    case day = "Tag"
    case night = "Nacht"
}

enum ActionType: String, CaseIterable {
    case opened = "Öffnen"
    case closed = "Schließen"
}
