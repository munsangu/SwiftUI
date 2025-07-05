import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = KalimbaViewModel()
    @State private var pressedKeyId: UUID? = nil
    @State private var selectedNote: String? = nil
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("kalimba_wood")
                    .resizable()
                    .ignoresSafeArea()

                VStack {
                    if let note = selectedNote {
                        Text(note)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .transition(.opacity)
                    } else {
                        Spacer()
                        
                        Text("Pressed Button")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .transition(.opacity)
                    }
                    
                    Spacer(minLength: geometry.size.height * 0.15)

                    HStack(alignment: .bottom, spacing: 2) {
                        ForEach(viewModel.keys) { key in
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    pressedKeyId = key.id
                                    selectedNote = key.note
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                    withAnimation(.easeOut(duration: 0.1)) {
                                        pressedKeyId = nil
                                    }
                                }
                                viewModel.playSound(for: key)
                                selectedNote = key.note
                            }) {
                                ZStack(alignment: .bottom) {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(
                                            LinearGradient(
                                                colors: [
                                                    Color(white: 0.95),
                                                    Color(white: 0.75)
                                                ],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .frame(
                                            width: key.keyWidth,
                                            height: geometry.size.height * 0.75 * key.heightRatio
                                        )
                                        .scaleEffect(pressedKeyId == key.id ? 0.95 : 1.0)
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)

                                    Text(key.note)
                                        .foregroundColor(.black)
                                        .font(
                                            .system(
                                                size: 14,
                                                weight: .bold
                                            )
                                        )
                                        .padding(
                                            .bottom,
                                            50
                                        )
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(
                        .horizontal,
                        12
                    )
                    .padding(
                        .vertical,
                        16
                    )
                    .cornerRadius(12)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
