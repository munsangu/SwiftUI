import SwiftUI

struct ContentView: View {
    @State private var code: String = ""
    @State private var selectedCodeType: CodeType = .six
    @State private var selectedStyle: TextFieldStyle = .roundedBorder
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Verification Field")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            SegmentedPickerView(
                title: "Code Length",
                options: CodeType.allCases,
                selection: $selectedCodeType,
                textForOption: { $0.stringValue }
            )
            .padding(.top, 20)
            
            SegmentedPickerView(
                title: "Style",
                options: TextFieldStyle.allCases,
                selection: $selectedStyle,
                textForOption: { $0.rawValue }
            )
            .padding(.top, 20)
            .padding(.bottom, 50)
            
            VerificationField(
                type: selectedCodeType,
                style: selectedStyle,
                value: $code
            ) { result in
                await validateCode(result)
            }
            .padding(.top, 30)
            .padding(.bottom, 50)
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private func validateCode(_ result: String) async -> TypingState {
        if result.count < selectedCodeType.rawValue {
            return .typing
        } else if result == "123456" || result == "1234" {
            return .valid
        } else {
            return .invalid
        }
    }
}

#Preview {
    ContentView()
}
