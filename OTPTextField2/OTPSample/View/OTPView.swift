import SwiftUI

struct OTPView: View {
    @StateObject private var viewModel = OTPViewModel()
    @FocusState private var isKeyboardFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Input OTP Code")
                    .font(.title)
                    .bold()
                
                TextField("6-digit OTP Code", text: $viewModel.otpCode)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal, 40)
                    .focused($isKeyboardFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isKeyboardFocused = true
                        }
                    }
                    .onChange(of: viewModel.otpCode) { _, newValue in
                        let filtered = newValue.filter(\.isNumber)
                        if filtered.count > 6 {
                            viewModel.otpCode = String(filtered.prefix(6))
                        } else if filtered != newValue {
                            viewModel.otpCode = filtered
                        }
                    }
                
                Button("Okay") {
                    viewModel.verifyOTP()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.isOTPComplete ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal, 40)
                .disabled(!viewModel.isOTPComplete)
                
            }
            .navigationDestination(isPresented: $viewModel.shouldNavigate) {
                NextView()
                    .navigationBarBackButtonHidden(true)
            }
            .alert("OTP Error", isPresented: $viewModel.showErrorAlert) {
                Button("OK", role: .cancel) {
                    viewModel.resetOTP()
                    isKeyboardFocused = true
                }
            } message: {
                Text("The OTP you entered is not valid.")
            }
        }
    }
}

#Preview {
    OTPView()
}
