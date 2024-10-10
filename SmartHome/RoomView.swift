import SwiftUI

struct RoomView: View {
    @Binding var room: Room
    @State private var password: String = ""
    @State private var enteredPassword: String = ""
    @State private var isDoorLocked: Bool = false
    @State private var showingPasswordField: Bool = false
    @State private var incorrectPassword: Bool = false

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

            Text("🚪 Tür ist \(room.doorClosed ? "Geschlossen" : "Offen")")
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(room.doorClosed ? Color.red : Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
                .shadow(radius: 5)

            // Passwort-Eingabe und Überprüfung
            if showingPasswordField {
                SecureField("Passwort eingeben", text: $enteredPassword)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding()

                Button(action: {
                    verifyPassword()
                }) {
                    Text("Bestätigen")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                if incorrectPassword {
                    Text("Falsches Passwort!")
                        .foregroundColor(.red)
                        .padding()
                }
            } else {
                Button(action: {
                    showingPasswordField = true
                }) {
                    Text(room.doorClosed ? "Tür öffnen" : "Tür schließen")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            // Lampen Status
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

            Text(room.timeOfDay == .day ? "🌞" : "🌙")
                .font(.system(size: 100))

            Spacer()
        }
        .padding()
        .navigationTitle(room.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white.opacity(0.95))
        .onAppear {
            // Passwort nur einmal festlegen (kann später erweitert werden)
            if password.isEmpty {
                password = "1234" // Beispielpasswort festlegen (kann angepasst werden)
            }
        }
    }

    // Funktion zur Passwortüberprüfung
    private func verifyPassword() {
        if enteredPassword == password {
            room.doorClosed.toggle() // Tür öffnen oder schließen
            showingPasswordField = false // Passwortfeld ausblenden
            incorrectPassword = false
            enteredPassword = "" // Passwortfeld zurücksetzen
        } else {
            incorrectPassword = true // Passwort falsch
        }
    }
}

#Preview {
    RoomView(room: .constant(Room(name: "Wohnzimmer", temperature: 22, lampCount: 3, lampsOn: [false, true, false], doorClosed: false, timeOfDay: .day, season: .spring)))
}
