import SwiftUICore
import SwiftUI

struct ContentView: View {
    @State private var rooms: [Room] = []
    @State private var roomName: String = ""
    @State private var lampCount: Int = 1
    @State private var temperature: Int = 20
    @State private var selectedSeason: Season = .spring
    @State private var showingSeasonInfo: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header der App
                Text("Smart Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .shadow(radius: 5)
                    .padding(.bottom, 20)
                
                TextField("Zimmername 🏠", text: $roomName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .cornerRadius(8)
                
              
                HStack {
                    Text("Anzahl der Lampen 💡: \(lampCount)")
                    Stepper(value: $lampCount, in: 1...10) {
                        Text("Lampen: \(lampCount)") // Anzeige der Lampenanzahl
                    }
                }
                .padding(.horizontal)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
                
                HStack {
                    Picker("Temperatur 🌡️", selection: $temperature) {
                        ForEach(10..<31) { temp in
                            Text("\(temp) °C").tag(temp)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                    
                    // Picker für die Jahreszeiten
                    Picker("Jahreszeit 🌸", selection: $selectedSeason) {
                        ForEach(Season.allCases, id: \.self) { season in
                            Text(season.rawValue.capitalized).tag(season)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                }
                
                Button(action: {
                    showingSeasonInfo = true
                }) {
                    Text("Details zur Jahreszeit anzeigen")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .alert(isPresented: $showingSeasonInfo) {
                    Alert(title: Text("Informationen zu \(selectedSeason.rawValue)"),
                          message: Text(getSeasonInfo()),
                          dismissButton: .default(Text("OK")))
                }
                
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
                    .shadow(radius: 5)
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
                                Text("🌸 Jahreszeit: \(rooms[index].season.rawValue.capitalized)")
                            }
                            .padding(.vertical, 10)
                        }
                    }
                    .onDelete(perform: deleteRoom)
                }
            }
            .navigationBarHidden(true) // Versteckt die Standard-Navigationleiste
            .background(Color.white.ignoresSafeArea()) 
        }
    }
    
    private func addRoom() {
        let newRoom = Room(name: roomName, temperature: temperature, lampCount: lampCount, lampsOn: Array(repeating: false, count: lampCount), doorClosed: false, timeOfDay: .day, season: selectedSeason)
        rooms.append(newRoom)
        roomName = ""
        lampCount = 1
    }
    
    private func deleteRoom(at offsets: IndexSet) {
        rooms.remove(atOffsets: offsets)
    }
    
    // Funktion, um Informationen basierend auf der Jahreszeit zu erhalten
    private func getSeasonInfo() -> String {
        let info: SeasonInfo
        
        switch selectedSeason {
        case .spring:
            info = SeasonInfo(season: .spring, dayTemperature: 20, nightTemperature: 10, monthlyCost: 100)
        case .summer:
            info = SeasonInfo(season: .summer, dayTemperature: 30, nightTemperature: 20, monthlyCost: 150)
        case .fall: // Korrigiere 'autumn' zu 'fall'
            info = SeasonInfo(season: .fall, dayTemperature: 15, nightTemperature: 5, monthlyCost: 120)
        case .winter:
            info = SeasonInfo(season: .winter, dayTemperature: 5, nightTemperature: -5, monthlyCost: 200)
        }
        
        return "Tagestemperatur: \(info.dayTemperature) °C\nNachtstemperatur: \(info.nightTemperature) °C\nMonatliche Kosten: \(info.monthlyCost) €"
    }
}


#Preview {
    ContentView()
}
