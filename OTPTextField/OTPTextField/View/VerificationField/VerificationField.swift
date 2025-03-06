import SwiftUI

struct VerificationField: View {
    var type: CodeType
    var style: TextFieldStyle = .roundedBorder
    @Binding var value: String
    var onChange: (String) async -> TypingState
    
    @StateObject private var viewModel: VerificationFieldViewModel
    @FocusState private var isActive: Bool
    
    init(
        type: CodeType,
        style: TextFieldStyle = .roundedBorder,
        value: Binding<String>,
        onChange: @escaping (String) async -> TypingState
    ) {
        self.type = type
        self.style = style
        self._value = value
        self.onChange = onChange
        self._viewModel = StateObject(wrappedValue: VerificationFieldViewModel(
            initialValue: value.wrappedValue,
            type: type,
            onChangeHandler: onChange
        ))
    }
    
    var body: some View {
        HStack(spacing: style == .roundedBorder ? 6 : 10) {
            ForEach(0..<type.rawValue, id: \.self) { index in
                CharacterView(
                    index: index,
                    value: viewModel.value,
                    style: style,
                    state: viewModel.state,
                    isActive: isActive
                )
            }
        }
        .animation(
            .easeInOut(duration: 0.2),
            value: viewModel.value
        )
        .animation(
            .easeInOut(duration: 0.2),
            value: isActive
        )
        .compositingGroup()
        .phaseAnimator(
            [0, 10, -10, 10, -5, 5, 0],
            trigger: viewModel.invalidTrigger,
            content: { content, offset in
                content
                    .offset(x: offset)
            },
            animation: { _ in
                    .linear(duration: 0.06)
            })
        .background {
            TextField("", text: $viewModel.value)
                .focused($isActive)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .mask(alignment: .trailing) {
                    Rectangle()
                        .frame(
                            width: 1,
                            height: 1
                        )
                        .opacity(0.01)
                }
                .allowsHitTesting(false)
        }
        .contentShape(.rect)
        .onTapGesture {
            isActive = true
        }
        .onChange(of: viewModel.value) { _, newValue in
            value = newValue
        }
        .onChange(of: value) { _, newValue in
            viewModel.processValueChange(newValue)
        }
        .onAppear {
            if !value.isEmpty {
                viewModel.processValueChange(value)
            }
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isActive = false
                }
                .tint(Color.primary)
                .frame(
                    maxWidth: .infinity,
                    alignment: .trailing
                )
            }
        }
    }
}
