import SwiftUI

struct BounceDirectionSelector: View {
    @ObservedObject var viewModel: TabBarViewModel
    
    var body: some View {
        Picker(
            "",
            selection: $viewModel.bounceDown
        ) {
            Text("Bounce Down")
                .tag(true)
            
            Text("Bounce Up")
                .tag(false)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 15)
        .padding(.bottom, 20)
    }
}
