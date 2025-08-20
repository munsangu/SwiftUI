import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TOTPViewModel(secretBase32: "JBSWY3DPEHPK3PXP")
    
    var body: some View {
        VStack(spacing: 20) {
            Text("OTP Code")
                .font(.headline)
            
            Text(viewModel.code)
                .font(
                    .system(
                        size: 40,
                        weight: .bold,
                        design: .monospaced)
                )
            
            Text("Remaining Time: \(viewModel.remaining)s")
                .font(.subheadline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
