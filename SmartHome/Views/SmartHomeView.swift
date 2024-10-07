//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Hamzah on 07.10.24.
//
import SwiftUI

struct SmartHomeView: View {
    @State private var newDeviceName: String = ""
    @State private var isRoomPreviewEnabled: Bool = false
    @State private var devices: [String] = [] // Liste der hinzugefügten Geräte

    var body: some View {
        VStack {
            Text("Syntax Home")
                .font(.largeTitle)
                .bold()
                .padding()

            // Textfeld für die Eingabe des neuen Geräts
            TextField("Neues Gerät", text: $newDeviceName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Button zum Hinzufügen des Geräts
            Button(action: {
                if !newDeviceName.isEmpty {
                    devices.append(newDeviceName) // Gerät zur Liste hinzufügen
                    newDeviceName = "" // Textfeld zurücksetzen
                }
            }) {
                Text("Hinzufügen")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }

            // Liste der hinzugefügten Geräte
            List(devices, id: \.self) { device in
                Text(device)
            }

            // Toggle für die Raumvorschau
            Toggle("Raumvorschau anzeigen", isOn: $isRoomPreviewEnabled)
                .padding()

            // Wenn der Toggle aktiviert ist, wird die RoomView angezeigt
            if isRoomPreviewEnabled {
                RoomView(isRoomPreviewEnabled: $isRoomPreviewEnabled) // Übergabe des Bindings
            }

            Spacer()
        }
        
    }
}

struct SmartHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SmartHomeView()
    }
}

