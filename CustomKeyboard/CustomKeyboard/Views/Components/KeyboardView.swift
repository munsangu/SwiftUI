import SwiftUI

struct KeyboardView: View {
    @ObservedObject var viewModel: PinCodeViewModel
    var onDone: () -> Void
    
    var body: some View {
        LazyVGrid(
            columns: Array(
                            repeating: GridItem(spacing: 0),
                            count: 3
                        ),
            spacing: 15
        ) {
            ForEach(1...9, id: \.self) { index in
                KeyButtonView(
                    value: "\(index)",
                    action: { viewModel.appendDigit("\(index)") }
                )
            }
            
            KeyButtonView(
                value: "delete.backward.fill",
                isImage: true,
                action: { viewModel.removeLastDigit() },
                showBackground: false
            )
            
            KeyButtonView(
                value: "0",
                action: { viewModel.appendDigit("0") }
            )
            
            KeyButtonView(
                value: "checkmark.circle.fill",
                isImage: true,
                action: {
                    onDone()
                    viewModel.confirmPinCode()
                },
                showBackground: false
            )
        }
        .padding(15)
        .background(
            .background
                .shadow(
                    .drop(
                        color: .black.opacity(0.08),
                        radius: 5,
                        x: 0,
                        y: -5
                    )
                )
        )
    }
}

#Preview {
    KeyboardView(
        viewModel: PinCodeViewModel(),
        onDone: {}
    )
}
