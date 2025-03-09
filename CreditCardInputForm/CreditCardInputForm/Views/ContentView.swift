import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CardViewModel()
    @FocusState private var focusedField: ActiveField?
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                if viewModel.animateField != .cvv {
                    MeshGradient(
                        width: 3,
                        height: 3,
                        points: [
                            .init(x: 0, y: 0), .init(x: 0.5, y: 0), .init(x: 1, y: 0),
                            .init(x: 0, y: 0.5), .init(x: 0.9, y: 0.6), .init(x: 1, y: 0.5),
                            .init(x: 0, y: 1), .init(x: 0.5, y: 1), .init(x: 1, y: 1)
                        ],
                        colors: [
                            .blue, .cyan, .teal,
                            .cyan, .blue, .cyan,
                            .blue, .teal, .blue
                        ]
                    )
                    .clipShape(.rect(cornerRadius: 25))
                    .overlay {
                        CardFrontView(
                            card: viewModel.card,
                            animateField: viewModel.animateField,
                            animation: animation
                        )
                    }
                    .transition(.filp)
                } else {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(
                            .red
                                .mix(
                                    with: .blue,
                                    by: 0.2
                                )
                        )
                        .overlay {
                            CardBackView(card: viewModel.card)
                        }
                        .frame(height: 200)
                        .transition(.reverseFilp)
                }
            }
            .frame(height: 200)

            CustomTextField(
                title: "Card Number",
                hint: "",
                value: $viewModel.card.number,
                onChange: viewModel.formatCardNumber
            )
            .keyboardType(.numberPad)
            .focused($focusedField, equals: .number)
            
            CustomTextField(
                title: "Card Name",
                hint: "",
                value: $viewModel.card.name,
                onChange: {}
            )
            .focused($focusedField, equals: .name)
            
            HStack(spacing: 10) {
                CustomTextField(
                    title: "Month",
                    hint: "",
                    value: $viewModel.card.month,
                    onChange: viewModel.formatMonth
                )
                .focused($focusedField, equals: .month)

                CustomTextField(
                    title: "Year",
                    hint: "",
                    value: $viewModel.card.year,
                    onChange: viewModel.formatYear
                )
                .focused($focusedField, equals: .year)
                
                CustomTextField(
                    title: "CVV",
                    hint: "",
                    value: $viewModel.card.cvv,
                    onChange: viewModel.formatCVV
                )
                .focused($focusedField, equals: .cvv)
            }
            .keyboardType(.numberPad)
            
            Spacer(minLength: 0)
        }
        .padding()
        .onChange(of: focusedField) { newValue in
            viewModel.activeField = newValue
        }
        .onChange(of: viewModel.activeField) { newValue in
            if newValue != focusedField {
                focusedField = newValue
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedField = nil
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .trailing
                )
            }
        }
    }
}
