import SwiftUI

struct WaterTrackerView: View {
    @StateObject private var viewModel = WaterTrackerViewModel()
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Drink Water")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Text("Goal: 2 Liters")
                    .foregroundColor(.white.opacity(0.8))

                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(
                            width: 120,
                            height: 300
                        )
                        .foregroundColor(.white.opacity(0.1))
                        .overlay(
                            VStack {
                                Text(
                                    String(
                                        format: "%.2fL",
                                        Double(viewModel.remaining) / 1000)
                                )
                                Text("Remained")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                        )

                    RoundedRectangle(cornerRadius: 16)
                        .frame(
                            width: 120,
                            height: CGFloat(viewModel.progress) * 300
                        )
                        .foregroundColor(.blue)
                        .overlay(
                            Text("\(Int(viewModel.progress * 100))%")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.bottom, 4),
                            alignment: .bottom
                        )
                        .clipped()
                        .animation(
                            .easeInOut,
                            value: viewModel.progress
                        )
                }

                Text("Select how many glasses of water that you have drank")
                    .font(.subheadline)
                    .foregroundColor(.white)

                let columns = [GridItem(), GridItem(), GridItem(), GridItem()]
                LazyVGrid(
                    columns: columns,
                    spacing: 12
                ) {
                    ForEach(
                        viewModel.glasses.indices,
                        id: \.self
                    ) { index in
                        let glass = viewModel.glasses[index]
                        Button {
                            viewModel.toggleGlass(at: index)
                        } label: {
                            VStack {
                                Text("250")
                                    .font(.headline)
                                Text("ml")
                                    .font(.caption)
                            }
                            .frame(
                                width: 60,
                                height: 100
                            )
                            .background(glass.isDrunk ? Color.blue : Color.white.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    WaterTrackerView()
}
