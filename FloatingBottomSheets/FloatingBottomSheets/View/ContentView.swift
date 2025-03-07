import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BottomSheetViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 12) {
                    SheetButton(
                        title: "Alert",
                        color: .red,
                        action: { viewModel.showSheet(type: .alert) }
                    )
                    
                    SheetButton(
                        title: "Question",
                        color: .blue,
                        action: { viewModel.showSheet(type: .question) }
                    )
                    
                    SheetButton(
                        title: "Request",
                        color: .green,
                        action: { viewModel.showSheet(type: .request) }
                    )
                }
                .padding()
            }
            .navigationTitle("Floating bottom sheet")
        }
        .floatingBottomSheet(isPresented: $viewModel.isSheetPresented) {
            BottomSheetContent(
                config: viewModel.currentSheetConfiguration,
                dismiss: viewModel.dismissSheet
            )
            .presentationDetents([.height(330)])
            .presentationBackgroundInteraction(.enabled(upThrough: .height(330)))
        }
    }
}

#Preview {
    ContentView()
}
