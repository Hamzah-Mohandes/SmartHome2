import SwiftUI

struct RoomView: View {
    @Binding var room: Room

    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Text("🏠 \(room.name)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(10)
            .shadow(radius: 5)

            // Türstatus
            Text("🚪 Tür ist \(room.doorClosed ? "Geschlossen" : "Offen")")
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(room.doorClosed ? Color.red : Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 5)

            // Toggle für Tag/Nacht
            Toggle(isOn: Binding(
                get: { room.timeOfDay == .day },
                set: { room.timeOfDay = $0 ? .day : .night; room.doorClosed = room.timeOfDay == .night }
            )) {
                Text(room.timeOfDay == .day ? "Wechsel zu Nacht" : "Wechsel zu Tag")
                    .font(.headline)
                    .foregroundColor(.white)
                    
            }
            .padding()
            .background(Color.gray.opacity(0.6))
            .cornerRadius(10)
            .shadow(radius: 5)

            // Lampensteuerung
            VStack(alignment: .leading, spacing: 10) {
                Text("💡 Lampen")
                    .font(.title2)
                    .bold()

                ForEach(0..<room.lampCount, id: \.self) { index in
                    Toggle(isOn: $room.lampsOn[index]) {
                        Text("Lampe \(index + 1): \(room.lampsOn[index] ? "An" : "Aus")")
                            .font(.body)
                    }
                    .padding()
                    .background(room.lampsOn[index] ? Color.yellow : Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)

            // Tag-/Nacht-Emoji
            Text(room.timeOfDay == .day ? "🌞" : "🌙")
                .font(.system(size: 100))

            Spacer()
        }
        .padding()
        .navigationTitle(room.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white.opacity(0.95))
    }
}
#Preview {
    RoomView(room: .constant(Room(name: "Wohnzimmer", temperature: 22, lampCount: 3, lampsOn: [false, true, false], doorClosed: false, timeOfDay: .day)))
}
