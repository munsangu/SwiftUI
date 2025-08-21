import SwiftUI

struct OTPCardView: View {
    @ObservedObject var viewModel: OTPViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("OTP")
                .font(.headline)
            
            Text(viewModel.code.isEmpty ? "------" : viewModel.code)
                .font(
                    .system(
                        size: 40,
                        weight: .bold,
                        design: .monospaced
                    )
                )
            
            Text("残り時間 \(viewModel.remaining)s")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(.separator)
        )
    }
}
