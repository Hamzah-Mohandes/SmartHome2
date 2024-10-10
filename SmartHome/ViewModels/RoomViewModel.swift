//
//  RoomViewModel.swift
//  SmartHome
//
//  Created by Hamzah on 10.10.24.
//


import SwiftUI
import Combine

class RoomViewModel: ObservableObject {
    @Published var room: Room

    init(room: Room) {
        self.room = room
    }
}



