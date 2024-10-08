import SwiftUI

struct SmartHomeView: View {
    @State private var newDeviceName: String = ""
    @State private var isRoomPreviewEnabled: Bool = false
    @State private var devices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light, isOn: true),
        SmartDevice(name: "Heizung", type: .thermostat, temperature: 22.0),
        SmartDevice(name: "Haustür", type: .lock, isLocked: true)
    ]

    var body: some View {
        VStack {
            Text("SmartHome Interface")
                .font(.largeTitle)
                .bold()
                .padding()

            // HStack für Textfeld und Button
            HStack {
                TextField("Neues Gerät", text: $newDeviceName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.trailing, 5) // Padding zwischen Textfeld und Button

                Button(action: addDevice) {
                    Text("Hinzufügen")
                        .padding(5) // Padding für den Button
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
            .padding() // Padding für die gesamte HStack

            // Liste der hinzugefügten Geräte
            List(devices) { device in
                HStack {
                    Text(device.name)
                    Spacer()
                    Text(device.type.rawValue)
                        .foregroundColor(.gray)
                }
            }

            // Toggle für die Raumvorschau
            Toggle("Raumvorschau anzeigen", isOn: $isRoomPreviewEnabled)
                .padding()

            // Wenn der Toggle aktiviert ist, wird die RoomView angezeigt
            if isRoomPreviewEnabled {
                RoomView(isRoomPreviewEnabled: $isRoomPreviewEnabled)
            }

            Spacer()
        }
    }
    
    // Funktion zum Hinzufügen eines Geräts
    func addDevice() {
        if !newDeviceName.isEmpty {
            let newDevice = SmartDevice(name: newDeviceName, type: .light) // Beispielhaft Gerätetyp Licht
            devices.append(newDevice) // Gerät zur Liste hinzufügen
            newDeviceName = "" // Textfeld zurücksetzen
        }
    }
}

struct SmartHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SmartHomeView()
    }
}
