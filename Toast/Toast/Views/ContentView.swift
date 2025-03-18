import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ToastViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("CUSTOM")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    Spacer()
                }
                .padding(.top)
                
                VStack(spacing: 20) {
                    HStack(spacing: 10) {
                        Button("Error") {
                            viewModel.addAirpodsBatteryLowToast()
                        }
                        .foregroundColor(.white)
                        .frame(height: 44)
                        .frame(minWidth: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                        )
                        
                        Button("Success") {
                            viewModel.addAirpodsFullyChargedToast()
                        }
                        .foregroundColor(.white)
                        .frame(height: 44)
                        .frame(minWidth: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green)
                        )
                        
                        Button("Warning") {
                            viewModel.addAirpodsOptimizedChargingToast()
                        }
                        .foregroundColor(.black)
                        .frame(height: 44)
                        .frame(minWidth: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.yellow)
                        )
                    }
                
                    Button("Apple Like HUD") {
                        viewModel.addUserAirpodsToast(userName: "SW")
                    }
                    .foregroundColor(.white)
                    .frame(height: 44)
                    .frame(minWidth: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(UIColor.secondarySystemBackground))
                )
                .padding()
                
                Spacer()
            }
            .navigationTitle("Toasts")
        }
        .interactiveToasts($viewModel.toasts)
    }
}

#Preview {
    ContentView()
}
