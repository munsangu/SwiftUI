import SwiftUI

struct HeaderView: View {
    let title: String
    @Binding var isToggleOn: Bool
    
    var body: some View {
        VStack {
            HStack {
                titleView
                
                Spacer(minLength: 0)
                
                toggleButton
            }
        }
        .padding()
        .frame(
            maxHeight: .infinity,
            alignment: .top
        )
    }
    
    private var titleView: some View {
        Text(title)
            .font(.largeTitle.bold())
    }
    
    private var toggleButton: some View {
        Toggle(isOn: $isToggleOn) {
            Image(systemName: "eyedropper.halffull")
                .font(.title2)
        }
        .toggleStyle(.button)
        .tint(.purple)
    }
}

#Preview {
    HeaderView(
        title: "Wave's",
        isToggleOn: .constant(false)
    )
}
