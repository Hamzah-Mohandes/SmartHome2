import SwiftUI

struct RoomView: View {
    @Binding var isRoomPreviewEnabled: Bool // Binding für den Zustand

    var body: some View {
        VStack {
            HStack {
                Spacer() // Um den Button nach rechts zu verschieben
                Button(action: {
                    isRoomPreviewEnabled = false // Schließe die RoomView
                }) {
                    Text("✕")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                .padding()
            }
        
            Text("Hier ist die Raumvorschau.")
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color.orange) // Hintergrundfarbe
                .cornerRadius(10)
                .padding()
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        // Beispiel-Preview mit aktivem Binding
        StatefulPreviewWrapper(true) { isRoomPreviewEnabled in
            RoomView(isRoomPreviewEnabled: isRoomPreviewEnabled)
        }
    }
}

// Wrapper für Preview mit State
struct StatefulPreviewWrapper<Content: View>: View {
    @State private var value: Bool

    var content: (Binding<Bool>) -> Content

    init(_ value: Bool, @ViewBuilder content: @escaping (Binding<Bool>) -> Content) {
        self._value = State(initialValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
