import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = KalimbaViewModel()

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    VStack {
                        HStack(
                            alignment: .bottom,
                            spacing: 6
                        ) {
                            ForEach(viewModel.keys) { key in
                                Button(action: {
                                    viewModel.playSound(for: key)
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 6)
                                            .fill(key.isLeftAligned ? Color.blue.opacity(0.8) : Color.cyan.opacity(0.8))
                                            .frame(
                                                width: key.keyWidth,
                                                height: key.keyHeight
                                            )

                                        VStack(spacing: 0) {
                                            ForEach(
                                                Array(key.note),
                                                id: \.self
                                            ) { char in
                                                Text(String(char))
                                                    .foregroundColor(.white)
                                                    .font(.caption2)
                                            }
                                        }
                                        .padding(.top, 4)
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .frame(
                            width: geometry.size.width * 0.95,
                            height: geometry.size.height * 1.2
                        )
                        .padding()
                        .background(Color(UIColor.brown))
                        .cornerRadius(24)
                    }
                    .ignoresSafeArea()
                }
                .navigationTitle("Kalimba")
            }
        }
    }
}

#Preview {
    ContentView()
}
