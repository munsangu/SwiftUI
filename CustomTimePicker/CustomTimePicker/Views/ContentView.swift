import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TimePickerView(
                    viewModel: viewModel.timePickerViewModel
                )
                .padding(viewModel.timePickerPadding)
                .background(
                    .white,
                    in: .rect(cornerRadius: viewModel.timePickerCornerRadius)
                )
                .padding(
                    .horizontal,
                    viewModel.horizontalPadding
                )
            }
            .padding(viewModel.timePickerPadding)
            .navigationTitle("Custom Time Picker")
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(Color.gray.opacity(viewModel.backgroundOpacity))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
