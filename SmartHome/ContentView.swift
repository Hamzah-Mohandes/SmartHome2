import SwiftUI

struct ContentView: View {
    @State private var rooms: [Room] = []
    @State private var roomName: String = ""
    @State private var lampCount: String = ""
    @State private var temperature: Int = 20

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Titel zentriert und stilvoll
                Text("🏡 Smart Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)

                TextField("Zimmername 🏠", text: $roomName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)

                TextField("Anzahl der Lampen 💡", text: $lampCount)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)

                Picker("Temperatur 🌡️", selection: $temperature) {
                    ForEach(10..<31) { temp in
                        Text("\(temp) °C").tag(temp)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.horizontal)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)

                Button(action: {
                    addRoom()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Zimmer hinzufügen")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding(.horizontal)

                List {
                    ForEach(rooms.indices, id: \.self) { index in
                        NavigationLink(destination: RoomView(room: $rooms[index])) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("🏠 \(rooms[index].name)")
                                    .font(.headline)
                                    .foregroundColor(.green)
                                Text("🌡️ Temperatur: \(rooms[index].temperature) °C")
                                Text("💡 Lampen: \(rooms[index].lampCount) - \(rooms[index].lampsOn.filter { $0 }.count) an")
                                Text("🚪 Tür: \(rooms[index].doorClosed ? "Geschlossen" : "Offen")")
                            }
                            .padding(.vertical, 10)
                        }
                    }
                    .onDelete(perform: deleteRoom)
                }
            }
            .navigationBarHidden(true) // Versteckt die Standard-Navigation-Überschrift
        }
    }

    private func addRoom() {
        guard let lampCountInt = Int(lampCount), !roomName.isEmpty else { return }
        let newRoom = Room(name: roomName, temperature: temperature, lampCount: lampCountInt, lampsOn: Array(repeating: false, count: lampCountInt), doorClosed: false, timeOfDay: .day)
        rooms.append(newRoom)
        roomName = ""
        lampCount = ""
    }

    private func deleteRoom(at offsets: IndexSet) {
        rooms.remove(atOffsets: offsets) // Zimmer löschen
    }
}

#Preview {
    ContentView()
}
