import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GlitchTextViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                GlitchTextView(
                    "Hello World!",
                    trigger: viewModel.triggers[0]
                )
                    .font(
                        .system(
                            size: 60,
                            weight: .semibold
                        )
                    )
                
                GlitchTextView(
                    "Glitch Text Effect",
                    trigger: viewModel.triggers[1]
                )
                    .font(
                        .system(
                            size: 40,
                            design: .rounded
                        )
                    )
                
                GlitchTextView(
                    "By @Hiro",
                    trigger: viewModel.triggers[2]
                )
                    .font(.system(size: 20))
            }
            
            Button {
                viewModel.triggerGlitchSequence()
            } label: {
                Text("Trigger")
                    .padding(
                        .horizontal,
                        15
                    )
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.black)
            .padding(
                .top,
                20
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
