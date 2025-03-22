import SwiftUI

struct ContentView: View {
    @StateObject private var clockViewModel = ClockViewModel()
    
    var body: some View {
        VStack {
            Text("Flip Clock Text Effect")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 10)
            
            Spacer()
            
            FlipClockView(viewModel: clockViewModel)
                .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .background(Color.black)
        .preferredColorScheme(.dark)
        .statusBarHidden(false)
    }
}

#Preview {
    ContentView()
}
