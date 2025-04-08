import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                let config = SlideToConfirm.Config(
                    idleText: "Swipe to Pay",
                    onSwipeText: "Confirms Payment",
                    confirmationText: "Success!",
                    tint: .green,
                    foregroundColor: .white
                )
                
                SlideToConfirm(config: config) {
                    print("Swiped")
                }
            }
            .padding(15)
            .navigationTitle("Slide to Confirm")
        }
    }
}

#Preview {
    ContentView()
}


